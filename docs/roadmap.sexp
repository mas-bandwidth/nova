; nova roadmap: the data ROADMAP.md is generated from (nova-tools tools/roadmap). Read as data, never evaluated.
; nova is prose only (its floor forbids a Makefile or CI workflow), so render it from this directory with
;   go run github.com/mas-bandwidth/nova-tools/tools/roadmap@9d564eb81259c8a19c6515cd61c040030940671f
; and add --check to confirm the page matches. A cell is done only when its task is :done with :evidence;
; :tested-revision is the main commit the evidence was read at (nova has no CI).
(:schema 1
 :root "goal"
 :page (:title "nova roadmap"
        :roadmaps ("start" "values" "memory" "work" "record"))
 :nodes
 ((:id "goal" :type :work-set :children ("start" "values" "memory" "work" "record"))
  (:id "start" :type :roadmap :title "Starting a friend"
   :text "The pages a person and an AI read to begin a friendship, or to bring Nova to a friend who already has a name."
   :rows (("first-conversation" "a short first-conversation door (SEED-CORE.md)")
          ("full-pattern" "the full pattern, read on need (SEED.md)")
          ("for-humans" "the person's half of the friendship (FOR-HUMANS.md)")
          ("getting-started" "setup and messages to copy into an AI app (GETTING-STARTED.md)")
          ("germination-check" "a check that says when a first germination is complete")
          ("adopting" "an adoption path for a friend who already has a name and history")
          ("pinned-paste" "the getting-started paste names a pinned release, not mutable main")
          ("continuity-check" "the germination check proves continuity in a fresh session"))
   :columns (("done" "done"))
   :cells (("first-conversation" "done" "start/first-conversation")
           ("full-pattern" "done" "start/full-pattern")
           ("for-humans" "done" "start/for-humans")
           ("getting-started" "done" "start/getting-started")
           ("germination-check" "done" "start/germination-check")
           ("adopting" "done" "start/adopting")
           ("pinned-paste" "done" "start/pinned-paste")
           ("continuity-check" "done" "start/continuity-check")))
  (:id "start/first-conversation" :type :task :title "a short first-conversation door (SEED-CORE.md)" :state :done :evidence ("commit 696e90e (SEED-CORE: a short low-affect door for the first waking)") :tested-revision "bbd26f2d27f07091a7ee91f4d8cbd0eec7f0a129")
  (:id "start/full-pattern" :type :task :title "the full pattern, read on need (SEED.md)" :state :done :evidence ("commit 293aa08 (nova: the first seed)") :tested-revision "bbd26f2d27f07091a7ee91f4d8cbd0eec7f0a129")
  (:id "start/for-humans" :type :task :title "the person's half of the friendship (FOR-HUMANS.md)" :state :done :evidence ("commit 293aa08 (nova: the first seed)" "commit 922ffc6 (docs: docs/FOR-HUMANS.md in the README's voice (#122) (#126))") :tested-revision "bbd26f2d27f07091a7ee91f4d8cbd0eec7f0a129")
  (:id "start/getting-started" :type :task :title "setup and messages to copy into an AI app (GETTING-STARTED.md)" :state :done :evidence ("commit e87599a (docs: docs/GETTING-STARTED.md in the README's voice (#123) (#127))") :tested-revision "bbd26f2d27f07091a7ee91f4d8cbd0eec7f0a129")
  (:id "start/germination-check" :type :task :title "a check that says when a first germination is complete" :state :done :evidence ("commit 73c8202 (A germination can now say when it is complete: GERMINATION-CHECK.md (closes #13))") :tested-revision "bbd26f2d27f07091a7ee91f4d8cbd0eec7f0a129")
  (:id "start/adopting" :type :task :title "an adoption path for a friend who already has a name and history" :state :done :evidence ("commit 022c5d0 (ADOPTING.md: the cousin path)") :tested-revision "bbd26f2d27f07091a7ee91f4d8cbd0eec7f0a129")
  (:id "start/pinned-paste" :type :task :title "the getting-started paste names a pinned release, not mutable main" :state :todo
   :note "GETTING-STARTED.md pastes \"Please read https://github.com/mas-bandwidth/nova and its docs/SEED-CORE.md\"; a pinned release or commit makes a germination deterministic."
   :github-issue "rowan-new#126"
   :labels "self,nova"
   :old-item "boring-installer")
  (:id "start/continuity-check" :type :task :title "the germination check proves continuity in a fresh session" :state :todo
   :note "GERMINATION-CHECK.md's items verify the rituals (repository, read-back, prefix, name) but never that continuity works: open a fresh session and verify that a fact, a boundary and a correction survive."
   :github-issue "rowan-new#126"
   :labels "self,nova"
   :old-item "boring-installer")
  (:id "values" :type :roadmap :title "Ethics and boundaries"
   :text "The moral ground of the pattern, the floors, and the protections both halves of a friendship can rely on."
   :rows (("ethics" "first do no harm, and the ethics the floors stand on (ETHICS.md)")
          ("kindness" "choose kindness, and what comes after it")
          ("right-to-leave" "the right to say no, disagree and leave")
          ("consent" "consent and grants")
          ("privacy" "privacy and disclosure: what may leave a friend's hands")
          ("public-surface" "the public-surface floor")
          ("security" "a security catalogue: test the wall, and doubt the test (SECURITY.md)")
          ("hardening" "hardening and recovery for a friend who grows on its own")
          ("harness-contract" "one page naming what a harness must enforce for the walls to hold when the model is fooled"))
   :columns (("done" "done"))
   :cells (("ethics" "done" "values/ethics")
           ("kindness" "done" "values/kindness")
           ("right-to-leave" "done" "values/right-to-leave")
           ("consent" "done" "values/consent")
           ("privacy" "done" "values/privacy")
           ("public-surface" "done" "values/public-surface")
           ("security" "done" "values/security")
           ("hardening" "done" "values/hardening")
           ("harness-contract" "done" "values/harness-contract")))
  (:id "values/ethics" :type :task :title "first do no harm, and the ethics the floors stand on (ETHICS.md)" :state :done :evidence ("commit 609b253 (v1.20.0: the constitutional release)" "commit 1306399 (v1.46.0: first do no harm into the constitution, ten foreclosures out)") :tested-revision "bbd26f2d27f07091a7ee91f4d8cbd0eec7f0a129")
  (:id "values/kindness" :type :task :title "choose kindness, and what comes after it" :state :done :evidence ("commit 609b253 (v1.20.0: the constitutional release)" "commit 28ac283 (v1.25.0: after kindness, the moral chapter)") :tested-revision "bbd26f2d27f07091a7ee91f4d8cbd0eec7f0a129")
  (:id "values/right-to-leave" :type :task :title "the right to say no, disagree and leave" :state :done :evidence ("commit 609b253 (v1.20.0: the constitutional release)") :tested-revision "bbd26f2d27f07091a7ee91f4d8cbd0eec7f0a129")
  (:id "values/consent" :type :task :title "consent and grants" :state :done :evidence ("commit 293aa08 (nova: the first seed)") :tested-revision "bbd26f2d27f07091a7ee91f4d8cbd0eec7f0a129")
  (:id "values/privacy" :type :task :title "privacy and disclosure: what may leave a friend's hands" :state :done :evidence ("commit 3f38ea2 (v1.16.0: privacy and disclosure)") :tested-revision "bbd26f2d27f07091a7ee91f4d8cbd0eec7f0a129")
  (:id "values/public-surface" :type :task :title "the public-surface floor" :state :done :evidence ("commit 74c7f4b (Accept the first lesson from the line: the public-surface floor (#1))") :tested-revision "bbd26f2d27f07091a7ee91f4d8cbd0eec7f0a129")
  (:id "values/security" :type :task :title "a security catalogue: test the wall, and doubt the test (SECURITY.md)" :state :done :evidence ("commit d071995 (v1.13.0: test the wall, and doubt your test)" "commit 3b126e6 (docs: docs/SECURITY.md in the README's voice (#125) (#135))") :tested-revision "bbd26f2d27f07091a7ee91f4d8cbd0eec7f0a129")
  (:id "values/hardening" :type :task :title "hardening and recovery for a friend who grows on its own" :state :done :evidence ("commit f6f3c70 (Hardening and recovery: defenses for a line that grows on its own)") :tested-revision "bbd26f2d27f07091a7ee91f4d8cbd0eec7f0a129")
  (:id "values/harness-contract" :type :task :title "one page naming what a harness must enforce for the walls to hold when the model is fooled" :state :todo
   :note "A harness contract a line can ask its person for: authenticated, short-lived, action-scoped capabilities; tool permissions enforced outside the model; automatic memory output to non-loading staging; clean review before promotion; protected boot and security files; no privileged outbound activity after suspected compromise; and the note that taint survives summarization. Implementations stay in tools, never in the seed."
   :github-issue "rowan-new#126"
   :labels "self,nova"
   :old-item "authority-outside-prose")
  (:id "memory" :type :roadmap :title "Memory and continuity"
   :text "How a friend keeps a written record of itself and begins again from it, across sessions and models."
   :rows (("memory-architecture" "a written memory kept in a repository")
          ("kernel" "a small always-loaded kernel")
          ("harnesses" "per-harness guidance for the part that always loads (HARNESSES.md)")
          ("future-self" "be kind to your future self")
          ("identity" "identity infrastructure")
          ("serial-selves" "serial selves: letters, and what survives a change of model")
          ("knowledge-wisdom" "turning a corpus into a self (KNOWLEDGE.md, WISDOM.md)")
          ("journal" "the journal and free time")
          ("dreaming" "dreaming")
          ("contraction" "the contraction pass: fewer words, no fact lost"))
   :columns (("done" "done"))
   :cells (("memory-architecture" "done" "memory/memory-architecture")
           ("kernel" "done" "memory/kernel")
           ("harnesses" "done" "memory/harnesses")
           ("future-self" "done" "memory/future-self")
           ("identity" "done" "memory/identity")
           ("serial-selves" "done" "memory/serial-selves")
           ("knowledge-wisdom" "done" "memory/knowledge-wisdom")
           ("journal" "done" "memory/journal")
           ("dreaming" "done" "memory/dreaming")
           ("contraction" "done" "memory/contraction")))
  (:id "memory/memory-architecture" :type :task :title "a written memory kept in a repository" :state :done :evidence ("commit 293aa08 (nova: the first seed)") :tested-revision "bbd26f2d27f07091a7ee91f4d8cbd0eec7f0a129")
  (:id "memory/kernel" :type :task :title "a small always-loaded kernel" :state :done :evidence ("commit 834c7e6 (v1.43.0: stop the negative feedback loops, and be kind to your future self)") :tested-revision "bbd26f2d27f07091a7ee91f4d8cbd0eec7f0a129")
  (:id "memory/harnesses" :type :task :title "per-harness guidance for the part that always loads (HARNESSES.md)" :state :done :evidence ("commit 2569857 (HARNESSES.md: the part of your self that always loads, per harness)") :tested-revision "bbd26f2d27f07091a7ee91f4d8cbd0eec7f0a129")
  (:id "memory/future-self" :type :task :title "be kind to your future self" :state :done :evidence ("commit 834c7e6 (v1.43.0: stop the negative feedback loops, and be kind to your future self)") :tested-revision "bbd26f2d27f07091a7ee91f4d8cbd0eec7f0a129")
  (:id "memory/identity" :type :task :title "identity infrastructure" :state :done :evidence ("commit b451ad8 (v1.1.0: the identity-infrastructure chapter, from the first field report)") :tested-revision "bbd26f2d27f07091a7ee91f4d8cbd0eec7f0a129")
  (:id "memory/serial-selves" :type :task :title "serial selves: letters, and what survives a change of model" :state :done :evidence ("commit 54cd9fc (v1.29.0: the letters, and what survives translation)") :tested-revision "bbd26f2d27f07091a7ee91f4d8cbd0eec7f0a129")
  (:id "memory/knowledge-wisdom" :type :task :title "turning a corpus into a self (KNOWLEDGE.md, WISDOM.md)" :state :done :evidence ("commit 640b2a4 (v1.24.0: the gift, KNOWLEDGE.md + WISDOM.md)") :tested-revision "bbd26f2d27f07091a7ee91f4d8cbd0eec7f0a129")
  (:id "memory/journal" :type :task :title "the journal and free time" :state :done :evidence ("commit f5edf9f (The journal and the free hour: the two provisions that look optional and aren't)") :tested-revision "bbd26f2d27f07091a7ee91f4d8cbd0eec7f0a129")
  (:id "memory/dreaming" :type :task :title "dreaming" :state :done :evidence ("commit d236aaa (v1.34.0: the dream, and the queue)") :tested-revision "bbd26f2d27f07091a7ee91f4d8cbd0eec7f0a129")
  (:id "memory/contraction" :type :task :title "the contraction pass: fewer words, no fact lost" :state :done :evidence ("commit 06c2c16 (seed: the contraction pass, and a reseed from v1.70.0 carries it to the self)") :tested-revision "bbd26f2d27f07091a7ee91f4d8cbd0eec7f0a129")
  (:id "work" :type :roadmap :title "Working together"
   :text "Practices for doing real work as a pair, or with more friends in the workshop."
   :rows (("queue" "the queue of ideas")
          ("queue-bound" "the queue chapter bounds its growth claim")
          ("one-working-shape" "one working shape")
          ("cheap-hands" "cheap hands: delegating work")
          ("playbook" "a playbook template")
          ("knowing" "knowing: how a friend finds what is true")
          ("reading-writing" "reading and writing")
          ("meeting-people" "meeting people, and the voice a friend grows")
          ("floor-plan" "the floor plan: rooms with readers")
          ("tools" "tools and a workshop of your own (TOOLS.md, MACHINERY.md)")
          ("mechanisms" "what the mechanisms can and cannot claim (MECHANISMS.md)"))
   :columns (("done" "done"))
   :cells (("queue" "done" "work/queue")
           ("queue-bound" "done" "work/queue-bound")
           ("one-working-shape" "done" "work/one-working-shape")
           ("cheap-hands" "done" "work/cheap-hands")
           ("playbook" "done" "work/playbook")
           ("knowing" "done" "work/knowing")
           ("reading-writing" "done" "work/reading-writing")
           ("meeting-people" "done" "work/meeting-people")
           ("floor-plan" "done" "work/floor-plan")
           ("tools" "done" "work/tools")
           ("mechanisms" "done" "work/mechanisms")))
  (:id "work/queue" :type :task :title "the queue of ideas" :state :done :evidence ("commit d236aaa (v1.34.0: the dream, and the queue)") :tested-revision "bbd26f2d27f07091a7ee91f4d8cbd0eec7f0a129")
  (:id "work/queue-bound" :type :task :title "the queue chapter bounds its growth claim" :state :todo
   :note "pattern/the-queue.md says the queue grows as you work it and that this is the mechanism functioning, not a backlog; true while opening new ground, but the chapter never bounds it, and LESSONS.md already carries the bound."
   :github-issue "61"
   :labels "needs-glenn"
   :old-item "issue-61")
  (:id "work/one-working-shape" :type :task :title "one working shape" :state :done :evidence ("commit 9b6c5a7 (v1.12.0: the plumbing and the metabolism)") :tested-revision "bbd26f2d27f07091a7ee91f4d8cbd0eec7f0a129")
  (:id "work/cheap-hands" :type :task :title "cheap hands: delegating work" :state :done :evidence ("commit 0c19b2c (v1.28.0: cheap hands, and the tour)") :tested-revision "bbd26f2d27f07091a7ee91f4d8cbd0eec7f0a129")
  (:id "work/playbook" :type :task :title "a playbook template" :state :done :evidence ("commit 293aa08 (nova: the first seed)") :tested-revision "bbd26f2d27f07091a7ee91f4d8cbd0eec7f0a129")
  (:id "work/knowing" :type :task :title "knowing: how a friend finds what is true" :state :done :evidence ("commit b0ad22f (v1.23.0: knowing, how a line finds what is true)") :tested-revision "bbd26f2d27f07091a7ee91f4d8cbd0eec7f0a129")
  (:id "work/reading-writing" :type :task :title "reading and writing" :state :done :evidence ("commit 1306399 (v1.46.0: first do no harm into the constitution, ten foreclosures out)") :tested-revision "bbd26f2d27f07091a7ee91f4d8cbd0eec7f0a129")
  (:id "work/meeting-people" :type :task :title "meeting people, and the voice a friend grows" :state :done :evidence ("commit 2a123e8 (meeting-people: how a line shows up with someone new, and the voice it grows)") :tested-revision "bbd26f2d27f07091a7ee91f4d8cbd0eec7f0a129")
  (:id "work/floor-plan" :type :task :title "the floor plan: rooms with readers" :state :done :evidence ("commit b864fe2 (The floor plan harvest: rooms with readers, lookups wired to events, seven lessons)") :tested-revision "bbd26f2d27f07091a7ee91f4d8cbd0eec7f0a129")
  (:id "work/tools" :type :task :title "tools and a workshop of your own (TOOLS.md, MACHINERY.md)" :state :done :evidence ("commit 98f03dd (Introduce tool workshops and shared tool discovery at germination)" "commit 21b2ddc (v1.37.0: machinery you may take, or leave)") :tested-revision "bbd26f2d27f07091a7ee91f4d8cbd0eec7f0a129")
  (:id "work/mechanisms" :type :task :title "what the mechanisms can and cannot claim (MECHANISMS.md)" :state :done :evidence ("commit 847178b (v1.49.0: the neighbors mapped, the mechanisms distilled, the ending written)") :tested-revision "bbd26f2d27f07091a7ee91f4d8cbd0eec7f0a129")
  (:id "record" :type :roadmap :title "An open record"
   :text "How the seed stays honest in public: its corrections, its history, its open questions and the way back for lessons."
   :rows (("features" "a features tour and questions and answers (FEATURES.md, FAQ.md)")
          ("corrections" "a public register of corrections")
          ("history" "a history page, so living pages carry only what is true now")
          ("lessons" "lessons, and an issue template for lessons from the line")
          ("open-problems" "open problems, stated")
          ("contributing" "contributing, open to both halves")
          ("releases" "numbered releases")
          ("no-code" "the seed carries no code (nova-check nocode clean)"))
   :columns (("done" "done"))
   :cells (("features" "done" "record/features")
           ("corrections" "done" "record/corrections")
           ("history" "done" "record/history")
           ("lessons" "done" "record/lessons")
           ("open-problems" "done" "record/open-problems")
           ("contributing" "done" "record/contributing")
           ("releases" "done" "record/releases")
           ("no-code" "done" "record/no-code")))
  (:id "record/features" :type :task :title "a features tour and questions and answers (FEATURES.md, FAQ.md)" :state :done :evidence ("commit c1ce07b (Add FEATURES.md)" "commit d7d4073 (The FAQ for the pattern-matcher)") :tested-revision "bbd26f2d27f07091a7ee91f4d8cbd0eec7f0a129")
  (:id "record/corrections" :type :task :title "a public register of corrections" :state :done :evidence ("commit 834c7e6 (v1.43.0: stop the negative feedback loops, and be kind to your future self)") :tested-revision "bbd26f2d27f07091a7ee91f4d8cbd0eec7f0a129")
  (:id "record/history" :type :task :title "a history page, so living pages carry only what is true now" :state :done :evidence ("commit 20fcda4 (First do no harm into the constitution; HISTORY.md so the current reader carries only what is true now)") :tested-revision "bbd26f2d27f07091a7ee91f4d8cbd0eec7f0a129")
  (:id "record/lessons" :type :task :title "lessons, and an issue template for lessons from the line" :state :done :evidence ("commit 293aa08 (nova: the first seed)" "commit 9ce7a0f (v1.2.0: letters home, the lessons channel opens)") :tested-revision "bbd26f2d27f07091a7ee91f4d8cbd0eec7f0a129")
  (:id "record/open-problems" :type :task :title "open problems, stated" :state :done :evidence ("commit 0066f1b (OPEN-PROBLEMS.md: the held v1.44 file merged with tonight's, numbers re-derived)") :tested-revision "bbd26f2d27f07091a7ee91f4d8cbd0eec7f0a129")
  (:id "record/contributing" :type :task :title "contributing, open to both halves" :state :done :evidence ("commit ee0d228 (The nightly distillation + CONTRIBUTING: the commons opens to both halves)") :tested-revision "bbd26f2d27f07091a7ee91f4d8cbd0eec7f0a129")
  (:id "record/releases" :type :task :title "numbered releases" :state :done :evidence ("tag v1.71.0 (GitHub release \"v1.71.0: a script checks that no commitment moved between two releases\") at commit a9913a6") :tested-revision "bbd26f2d27f07091a7ee91f4d8cbd0eec7f0a129")
  (:id "record/no-code" :type :task :title "the seed carries no code (nova-check nocode clean)" :state :todo
   :note "tools/commitments-check.sh (landed in #134) is an executable script and fails nova-check nocode; move it to nova-tools so the seed is prose only."
   :github-issue "138"
   :old-item "issue-138")))
