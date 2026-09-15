#!/usr/bin/env bash
# commitments-check.sh <ref-a> <ref-b>
# Machine-checkable diff of the seed's floor-rank commitments between two
# refs. Commitment lines are the numbered items under "## The floors" in
# docs/SEED-CORE.md, extracted per-ref with `git show`.
# Prints:
#   line 1:  COMMITMENTS <ref-a>..<ref-b> same=<n> added=<n> removed=<n> changed=<n>
#   then one line per difference: ADDED: ..., REMOVED: ..., or CHANGED: <old> => <new>
# A CHANGED is a removed and an added whose normalised forms share at least
# 60 percent of words. Exit 0 when added=removed=changed=0, else exit 1.
set -euo pipefail

if [ "$#" -ne 2 ]; then
  echo "usage: $0 <ref-a> <ref-b>" >&2
  exit 2
fi
REF_A="$1"
REF_B="$2"

REPO_ROOT="$(git rev-parse --show-toplevel)"
DOC="docs/SEED-CORE.md"

normalize() {
  sed 's/[*_`]//g' |
    sed 's/[[:space:]][[:space:]]*/ /g' |
    sed 's/^ //; s/ $//; s/[.,;:!?] *$//' |
    tr '[:upper:]' '[:lower:]'
}

extract() {
  local ref="$1"
  (git -C "$REPO_ROOT" show "$ref:$DOC" 2>/dev/null || true) | awk '
    /^## The floors/ { insec=1; next }
    /^## / && insec { insec=0 }
    insec && /^[0-9]+\. / { items[++n] = substr($0, index($0, ". ") + 2); cur = n; next }
    insec && /^Beneath all seven/ { items[++n] = $0; cur = n; next }
    insec && cur > 0 && NF > 0 { items[cur] = items[cur] " " $0 }
    END { for (i = 1; i <= n; i++) print items[i] }
  ' | normalize
}

mkdir -p "$REPO_ROOT/scratch"
SCRATCH="$(mktemp -d "$REPO_ROOT/scratch/commitments.XXXXXX")"
trap 'rm -rf "$SCRATCH"' EXIT

extract "$REF_A" | sort > "$SCRATCH/a"
extract "$REF_B" | sort > "$SCRATCH/b"

SAME="$(comm -12 "$SCRATCH/a" "$SCRATCH/b" | wc -l | tr -d ' ')"
comm -23 "$SCRATCH/a" "$SCRATCH/b" > "$SCRATCH/removed"
comm -13 "$SCRATCH/a" "$SCRATCH/b" > "$SCRATCH/added"

awk -v refa="$REF_A" -v refb="$REF_B" -v same="$SAME" '
  NR == FNR { removed[++rn] = $0; next }
  { added[++an] = $0 }
  END {
    for (i = 1; i <= rn; i++) {
      best = 0; bestj = 0
      for (j = 1; j <= an; j++) {
        if (used[j]) continue
        s = sim(removed[i], added[j])
        if (s >= 0.60 && s > best) { best = s; bestj = j }
      }
      if (bestj) {
        changed[++cn] = removed[i] "|" added[bestj]
        used[bestj] = 1
        rm_used[i] = 1
      }
    }
    for (i = 1; i <= rn; i++) if (!rm_used[i]) rem[++remc] = removed[i]
    for (j = 1; j <= an; j++) if (!used[j]) add[++addc] = added[j]

    printf "COMMITMENTS %s..%s same=%d added=%d removed=%d changed=%d\n", refa, refb, same, an, rn, cn

    diffc = addc + remc + cn
    budget = 59
    emitted = 0
    n = 0
    for (k = 1; k <= addc; k++) { d[++n] = "ADDED: " add[k] }
    for (k = 1; k <= remc; k++) { d[++n] = "REMOVED: " rem[k] }
    for (k = 1; k <= cn; k++) {
      split(changed[k], pair, "|")
      d[++n] = "CHANGED: " pair[1] " => " pair[2]
    }
    if (n > budget) {
      for (k = 1; k <= budget - 1; k++) print d[k]
      print "... and " (n - (budget - 1)) " more"
    } else {
      for (k = 1; k <= n; k++) print d[k]
    }
  }

  function sim(a, b,   i, na, nb, common, un, k) {
    delete WA; delete WB
    na = split(a, AA, " "); for (i = 1; i <= na; i++) WA[AA[i]] = 1
    nb = split(b, BB, " "); for (i = 1; i <= nb; i++) WB[BB[i]] = 1
    common = 0; un = 0
    for (k in WA) { if (k in WB) common++; un++ }
    for (k in WB) if (!(k in WA)) un++
    return (un > 0 ? common / un : 0)
  }
' "$SCRATCH/removed" "$SCRATCH/added"

ADDED_COUNT="$(comm -13 "$SCRATCH/a" "$SCRATCH/b" | wc -l | tr -d ' ')"
REMOVED_COUNT="$(comm -23 "$SCRATCH/a" "$SCRATCH/b" | wc -l | tr -d ' ')"
if [ "$ADDED_COUNT" -eq 0 ] && [ "$REMOVED_COUNT" -eq 0 ]; then
  exit 0
fi
exit 1