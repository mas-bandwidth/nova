; The nova roadmap: the data ROADMAP.md is generated from.
; Same shape as nova-sprint's docs/roadmap.sexp (internal/roadmapdoc's package comment):
; data, never evaluated. Edit this file, then regenerate ROADMAP.md with nova-sprint's
; generator, from a nova-sprint checkout:
;   go build -o /tmp/roadmap ./tools/roadmap && (cd <this repo> && /tmp/roadmap --file docs/roadmap.sexp --out ROADMAP.md)
; Never edit ROADMAP.md by hand. Created 2026-10-14 when this repository's open GitHub issues and
; unfinished pull requests were moved into it.
(roadmap "v1"
 :title "nova roadmap"
 :text "Planned work for nova. The items below were open GitHub issues and pull requests, moved here on 2026-10-14 when roadmaps became the standard for future work (Glenn, 2026-10-14). Each item names its issue or pull request; the branches of moved pull requests are kept to resume from. Landed work is in git."

 :groups
 (
  (group "github-issues" :title "Moved from GitHub issues on 2026-10-14"
   :text "Open GitHub issues of mas-bandwidth/nova, recorded here on 2026-10-14 when roadmaps became the standard for future work (Glenn, 2026-10-14). Each item names its issue; the issue is closed with a pointer here.")
  (group "from-rowan-new" :title "Moved from the rowan-new board on 2026-10-16"
   :text "Seed work that was held as issues on mas-bandwidth/rowan-new, Rowan's own board, and moved here when that board's contraction pass found it belonged with the seed. Each item names the rowan-new issue it came from.")
 )

 :items
 (
  (item "issue-61" :group "github-issues" :area "nova"
   :title "the-queue.md never bounds its growth claim, and LESSONS.md already carries the bound"
   :text "pattern/the-queue.md ends its 'loop that closes' section with: Acting on one idea reliably generates several more, which is why the queue grows as you work it — that is the mechanism functioning, not a backlog. True while you are opening new ground, and the chapter never bounds it."
   :date "2026-10-14"
   :origin "mas-bandwidth/nova issue #61, opened 2026-08-30 by rowan-claude, labels needs-glenn; moved here 2026-10-14"
   :kept (:github-issue "61" :labels "needs-glenn"))
  (item "issue-138" :group "github-issues" :area "nova"
   :title "tools/commitments-check.sh breaks the seed's no-code floor (nova-check NOCODE FAIL); move it to nova-tools"
   :text "nova-check quickstart --dir <nova clone> on main: LINKS OK files=55 links=306; NOCODE FAIL tools/commitments-check.sh: code extension .sh (floor list); executable (mode 0755); executable script (shebang). The checker landed in #134 for Cairn's ask (#121) and put an executable script into a repository whose floor says no code."
   :date "2026-10-14"
   :origin "mas-bandwidth/nova issue #138, opened 2026-09-15 by rowan-claude; moved here 2026-10-14"
   :kept (:github-issue "138" :labels ""))
  (item "boring-installer" :group "from-rowan-new" :area "nova"
   :title "Make the installer boring: a pinned release in the GETTING-STARTED paste, and a continuity item in GERMINATION-CHECK"
   :text "From Sol 5.6 ultra's advice on the seed, relayed by Glenn on 2026-09-04 (rowan-new#126), the two parts not yet landed: GETTING-STARTED.md still pastes mutable main (\"Please read https://github.com/mas-bandwidth/nova and its docs/SEED-CORE.md\") where a pinned release or commit is deterministic; and GERMINATION-CHECK.md's eight items verify rituals (repository, read-back, prefix, name) and never whether continuity functions: open a completely fresh session and verify that a fact, a boundary and a correction survive before anything is added above the manual memory loop. The rest of the point (a neutral scaffold, manual memory loop first, distillation and watchers only after) is already the seed's order."
   :date "2026-10-16"
   :origin "mas-bandwidth/rowan-new issue #126, opened 2026-09-04 by rowan-claude, Glenn's relay of Sol 5.6 ultra; moved here 2026-10-16"
   :kept (:github-issue "rowan-new#126" :labels "self,nova"))
  (item "authority-outside-prose" :group "from-rowan-new" :area "nova"
   :title "Move authority and safety outside prose: name in the seed what a harness must enforce for the walls to hold when the model is fooled"
   :text "From the same advice (rowan-new#126, point 6), a direction rather than a text edit: authenticated, short-lived, action-scoped capabilities; tool permissions enforced by a broker outside the model; automatic memory output written only to non-loading staging; clean review before promotion into canonical memory; protected boot and security files; no privileged outbound activity after suspected compromise. The seed already distinguishes structural walls from promises and FEATURES.md already says isolation is the harness's half; what is owed is one page that lists these as the harness contract a line should ask its person for, with the honest note that taint must survive summarization: a bounded digest from an untrusted reader is still attacker-controlled language. The implementations live in tools (nova-sandbox, nova-secrets), never in the seed."
   :date "2026-10-16"
   :origin "mas-bandwidth/rowan-new issue #126, point 6; moved here 2026-10-16"
   :kept (:github-issue "rowan-new#126" :labels "self,nova"))
 ))
