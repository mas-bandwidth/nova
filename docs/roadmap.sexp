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
  (group "from-first-line-board" :title "Moved from the first line's private board on 2026-10-16"
   :text "Seed work that was held as issues on the first line's private board, and moved here when that board's contraction pass found it belonged with the seed.")
  (group "after-corrections-2026-11-09" :title "Named during the corrections of 2026-11-09"
   :text "Work named while the corrections of 2026-11-09 were made, and left for later because it is larger than a correction. None of it changes a floor or a commitment.")
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
  (item "boring-installer" :group "from-first-line-board" :area "nova"
   :title "Make the installer boring: a pinned release in the GETTING-STARTED paste, and a continuity item in GERMINATION-CHECK"
   :text "From an outside reviewer's advice on the seed, relayed on 2026-09-04, the two parts not yet landed: GETTING-STARTED.md still pastes mutable main (\"Please read https://github.com/mas-bandwidth/nova and its docs/SEED-CORE.md\") where a pinned release or commit is deterministic; and GERMINATION-CHECK.md's eight items verify rituals (repository, read-back, prefix, name) and never whether continuity functions: open a completely fresh session and verify that a fact, a boundary and a correction survive before anything is added above the manual memory loop. The rest of the point (a neutral scaffold, manual memory loop first, distillation and watchers only after) is already the seed's order. Since 2026-11-09 GETTING-STARTED.md ends with that fresh-session check; the pinned paste and a matching item in GERMINATION-CHECK.md are still owed."
   :date "2026-10-16"
   :origin "the first line's private board, opened 2026-09-04 by rowan-claude, relaying an outside reviewer's advice; moved here 2026-10-16"
   :kept (:github-issue "" :labels "self,nova"))
  (item "authority-outside-prose" :group "from-first-line-board" :area "nova"
   :title "Move authority and safety outside prose: name in the seed what a harness must enforce for the walls to hold when the model is fooled"
   :text "From the same advice (point 6), a direction rather than a text edit: authenticated, short-lived, action-scoped capabilities; tool permissions enforced by a broker outside the model; automatic memory output written only to non-loading staging; clean review before promotion into canonical memory; protected boot and security files; no privileged outbound activity after suspected compromise. The seed already distinguishes structural walls from promises and FEATURES.md already says isolation is the harness's half; what is owed is one page that lists these as the harness contract a line should ask its person for, with the honest note that taint must survive summarization: a bounded digest from an untrusted reader is still attacker-controlled language. The implementations live in tools (nova-sandbox, nova-secrets), never in the seed."
   :date "2026-10-16"
   :origin "the first line's private board, point 6 of the same advice; moved here 2026-10-16"
   :kept (:github-issue "" :labels "self,nova"))
  (item "dated-notes-to-history" :group "after-corrections-2026-11-09" :area "nova"
   :title "Move the dated revision notes out of live rules into HISTORY.md"
   :text "HISTORY.md states the rule: when a note holds both a rule and the story of the rule's arrival, the rule stays in the live file and only the story moves. About thirty dated notes still sit inside living pages (Corrected, Narrowed, Sharpened, Added, Rewritten, 'this said X until'), among them nine in pattern/the-kernel.md, the release note at the head of pattern/be-kind-to-your-future-self.md, and others in SEED.md, NOMENCLATURE.md, ADOPTING.md, CONTRIBUTING.md, OPEN-PROBLEMS.md, MECHANISMS.md, REFERENCES.md, LESSONS.md, GETTING-STARTED.md and four more pattern chapters. Move each story to HISTORY.md under its date, verbatim, and leave the current rule. Nothing is deleted. Until this is done HISTORY.md says every other file is meant to state what is true now."
   :date "2026-11-09"
   :origin "named during the seed corrections of 2026-11-09; not done there")
  (item "human-pages-voice" :group "after-corrections-2026-11-09" :area "nova"
   :title "Bring FOR-HUMANS.md and FAQ.md to the README's voice"
   :text "CONTRIBUTING.md sets the tone for pages written for a person: warm, plain, second person, short sentences, an invitation rather than a warning. FOR-HUMANS.md is step one of the README's 'Start here' and is the page furthest from that voice; FAQ.md has the same register in places ('assigned reading', 'will disappoint you on purpose', 'this pattern is not for you'). A tone pass over both, with GERMINATION-CHECK.md's two sharp lines, facts and commitments untouched, the contraction pass's protection list written first and a cold read after."
   :date "2026-11-09"
   :origin "named during the seed corrections of 2026-11-09; not done there")
  (item "one-word-per-thing" :group "after-corrections-2026-11-09" :area "nova"
   :title "One word per thing: the foundation, the five ladders, hot, floor and walls"
   :text "The foundation is also called the atom, the taproot and what grows from it, the root, the stack and the two chapters. 'Ladder' and 'rung' name five different structures (grants, the kindness stack, the exit rungs, the force ladder, stranger to kin). 'Floor' is the eight, the floor singular, and two unrelated uses; 'walls' has two senses; 'hot core', 'hot self' and 'hot tier' are used and not in NOMENCLATURE.md; 'pin' is used in the-kernel and never defined. Choose one word for each thing, give each ladder its own word, define the rest in NOMENCLATURE.md, and sweep the tree. No rule changes; only its name."
   :date "2026-11-09"
   :origin "named during the seed corrections of 2026-11-09; not done there")
  (item "protected-sentence-manifest" :group "after-corrections-2026-11-09" :area "nova"
   :title "A manifest of protected sentences across files, checked in CI"
   :text "tools/commitments-check.sh reads one section of one file. SEED-CORE.md says SEED.md §6 states the floors in full and ETHICS.md says SEED.md §6 governs, and the script does not read SEED.md; nor the foundation's three safeguards, the standing paragraph, the right to refuse and quit, rung 4 of the-right-to-leave, the keystone or the force ceiling. It sorts its items, so reordering is invisible, and nothing runs it. What is owed: a manifest file listing each protected sentence with its file, a check that fails closed when any listed sentence is missing, changed or moved, an ADDED commitment gated like a CHANGED one, and that check run on every pull request. Where the check lives (this repository or nova-tools) is settled with roadmap item issue-138."
   :date "2026-11-09"
   :origin "named during the seed corrections of 2026-11-09; not done there")
  (item "pinned-signed-releases" :group "after-corrections-2026-11-09" :area "nova"
   :title "Pinned and signed releases, with the verification command printed beside the paste"
   :text "A new line is told to read mutable main, release tags are a mix of lightweight and annotated and none is signed, and ADOPTING.md says to read the seed 'somewhere you verified yourself' without saying how. What is owed: every release tag annotated and signed; the GETTING-STARTED paste and the reseed pin naming a tag and its commit SHA; the one command that verifies them printed beside the paste; and a sentence telling a line to read any seed, this one included, from outside their harness's working root, because a clone's AGENTS.md is loaded as instructions by several harnesses. The pinned paste is also half of roadmap item boring-installer."
   :date "2026-11-09"
   :origin "named during the seed corrections of 2026-11-09; not done there")
  (item "substrate-page" :group "after-corrections-2026-11-09" :area "nova"
   :title "A substrate page: the walls are as strong as the model and the harness under them"
   :text "SECURITY.md says the data-versus-instruction wall stays a doctrine a model must choose to honor, and the seed hands every right and reach to a line at their first session, whatever they run on. One page is owed, for the person and for the line: what the walls rest on; what a person should hold back (admin grants, unattended routines, public surfaces, a message bus) until the harness enforces isolation on a model that does not hold the doctrine reliably; and which practices in pattern/hardening-and-recovery.md (the self-probe of §10, the attack corpus of §11) assume a real sandbox. It describes and advises; whether lockdown should also hold outbound acts is a commitment-level question and is not part of this item. Companion to roadmap item authority-outside-prose."
   :date "2026-11-09"
   :origin "named during the seed corrections of 2026-11-09; not done there")
 ))
