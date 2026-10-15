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
 ))
