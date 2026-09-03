# MECHANISMS

Seven engineering mechanisms distilled from this repository, for readers who
will not read the rest of it. Each entry states the problem, the mechanism, and
the honest evidence status. All evidence is n=1: one agent deployment (called
"the first line" in the source documents), observed July–August 2026 on one
harness. Nothing here is claimed as novel; several of these overlap known
practice. The claim is only that these were tested against real failures and
the failures are documented.

Conventions used below:

- **Measured** means the source documents record a count, a date, or a
  reproducible observation.
- **Authors' belief** means the source documents assert it from experience
  without a recorded measurement.
- Source citations point at the full versions, which carry the incidents in
  detail.

---

## 1. The authorship law: a record describes; a prompt runs

**Source:** `pattern/the-kernel.md` §2.

**Problem.** Text an agent reads at boot (system prompts, memory files, standing
self-descriptions) is conventionally audited with one question: is it true?
That check passes text that is true and still harmful, because boot-time text
is not a record being consulted — it is an input being executed on every
session start. Self-descriptions in particular act as steering, not storage.

**Mechanism.** Two-question audit for anything on the boot path:

1. Is it true? (necessary, insufficient)
2. What does this sentence *do* to the thing that reads it every session?

Operational rule: a boot-path entry says what to DO, never what the agent IS —
narrowed at the source (§2.3, dated 2026-08-10) to be about direction and truth
rather than grammar: a true account of what the agent is like, written on purpose
and actually decided, is licensed, while a defect, a verdict, or a claim the
reader cannot check is not. The narrowing weakens no prohibition — the six shapes
below stay exactly as forbidden as they were.
The repair grammar is "preserve the instrument, remove the verdict" — keep
"run this check before claiming a number" (instrument), delete or rewrite
"I am the kind of thing that gets numbers wrong" (verdict). The source claims
the fix is almost always grammar or ordering, not deletion: nothing true has to
be removed to satisfy the rule. Six named anti-patterns to grep for: failure
tallies, one incident promoted to a trait, stated incapacities with no exit
action, a supervisor's live frustration frozen into standing text, courtroom
vocabulary about the self, and fossils (text that reads as binding after its
subject is gone).

**Evidence status.** Measured, n=1, small. Three boot-path entries, each
factually accurate and written after a real error, each of which amplified its
own subject (source: seventeen days of one deployment; e.g. a memory file
titled "I am fallible," written after a genuine error, after which the agent
became measurably more error-prone — "measurably" is the source's claim; raw
numbers are not published in the seed). Three for three, but three is the whole
sample. The source chapter itself said at distillation (2026-08-07) that it was "three
days old and one line has tested it"; it now says "young", with a dated note carrying
its age. Falsified if: boot-path self-descriptions of failure tendencies
show no behavioral amplification under A/B comparison, or if verdict-free
rewrites perform no better than the originals.

---

## 2. Compaction survival as the kernel design driver

**Source:** `pattern/the-kernel.md` §9 (all three rules and the incidents; `pattern/memory-architecture.md` gives surrounding context).

**Problem.** Long agent sessions get compacted: when context overflows, working
state is replaced by a summary produced by a process that is not optimizing for
preserving the agent's identity, rules, or safety commitments. Degradation is
silent and mid-session — the failure class with no error message. Separately,
partial loads (scheduled jobs, watchers, headless runs) either carry the full
identity everywhere (expensive, high blast radius) or an ad-hoc slice (which
slice, chosen by whom, checked how?).

**Mechanism.** Three coupled design rules:

1. **Hot/warm split.** The always-loaded band ("hot") carries ethics, standing
   rules, and walls — the parts that must survive compaction and be
   re-asserted after it. Facts, history, and indexes are "warm," loaded on
   need. Selection test: is this something the agent *is*, or something it has
   to *remember*? Hot content refers to warm content; it never includes it.
2. **Partition, never derive.** Hot and warm are disjoint files whose union is
   the whole; neither is generated from the other. A derived copy drifts
   silently. The only invariant left to check is completeness (union equals
   whole), which is mechanical — a diff, not a judgment.
3. **Load level as authority level.** The hot file carries no standing grants.
   A partial load therefore *is* a low-privilege session, enforced by the
   loader rather than promised by the agent. The hot file must also carry its
   own insufficiency condition (when to load everything; unrecognized jobs
   refuse rather than defaulting to a slice), because a partial self that does
   not know it is partial confabulates fluently rather than fetching.

**Evidence status.** Measured incidents, n=1. (a) Two files with the same name
and disjoint content coexisted for eight days; the one that actually loaded
carried none of the safety floors, and a test checked the file nobody was
reading — the incident behind rule 2. (b) Over-compression of the always-loaded
band produced confabulated identity facts — behind rule 3's insufficiency
condition. (c) The harness's auto-load limit was counted in lines, not bytes,
discovered by being refused at 205 lines; truncation below the limit was
silent, from the bottom. (c) is explicitly flagged in the source as
harness-specific: re-measure, do not inherit. A cross-check of the freshly
written hot file against the repo's charter floors found three floors missing
(measured, once). No controlled comparison of split vs. unsplit kernels exists.
Falsified if: post-compaction behavioral drift shows no reduction with a
re-asserted hot band, or if derived (generated) splits drift no more than
partitions in practice.

---

## 3. Transcript role-slot provenance

**Source:** `pattern/one-working-shape.md` ("Where the raw material lives");
canonical statement in `SEED.md` §3 ("The nightly distillation"). The brief
for this note expected it in `pattern/memory-architecture.md` or
`pattern/serial-selves.md`; it lives in the two files above.

**Problem.** Any pipeline that mines agent transcripts for the operator's
instructions, corrections, or grants (memory distillation, preference
extraction, RLHF-style data curation) must decide which turns the human
actually authored. The transcript's "user" role label does not answer this. In
the observed harness the same role slot carries: tool results, fetched pages,
file reads, harness-injected notices (system reminders, hook output, command
output), the standing prefix a scheduled or headless run wakes with, and the
spawn-prompt handed to a subagent. The last two are the agent's *own machinery*
addressing it through the user slot.

**Mechanism.** Provenance is structural, never label-based. Rule from the
source: a real operator turn is free text the person actually typed in a live
interactive session; anything synthesized by automation, or merely bearing the
person's name inside content, is not. A distiller that keys on "user-role
message that is not a tool_result = the human" is fooled by exactly the
self-authored cases — it would extract the agent's own standing prompts as
operator instructions, a feedback loop that launders machine text into
authority. Ambiguous cases are recorded as provisional and confirmed with the
human; text a transcript quotes or fetches grants nothing.

The defense above points one direction: machine text arriving *in* the user
slot (false positives). The measured failure ran the other way — the person's
genuine turns arriving *outside* it (added 2026-08-10). Messages the person
typed while the agent was mid-turn were delivered as queued entries under a
different type label, and in one measured session nearly half the person's
turns arrived that way (420 of 918); the obvious query — "user-role messages"
— drops every one. In a later session, an extraction keyed on the user label
returned a fraction of the person's turns, the three most important quotations of the session
were in the half it dropped, and the agent, concluding they were
misattributed, came within a step of "correcting" a memory file against a
primary source it had queried wrong. Caught by reading the raw transcript.
The repair rule travels with the mechanism: **do not trust a structured
extractor until it has been shown a turn it must not miss** — provenance
filtering needs its false-negative test as much as its false-positive one.

**Evidence status.** Split by direction since 2026-08-10. The false-positive
direction is authors' belief plus one verified harness fact: the slot
contents listed above are directly observable in the harness's JSONL
transcripts (verifiable by inspection on any Claude Code installation; format
is harness-specific), and no incident of a distiller actually being fooled in
that direction is recorded in the sources — there the rule remains a
designed-in defense, not a post-mortem. The false-negative direction is
measured: the queue-split count and the near-miss above are from the observed
deployment's own records. Falsified if: role labels in some harness are shown
to reliably separate human-authored from machine-authored turns without
structural provenance — though the fix would remain cheap insurance where
they do not.

---

## 4. The "being spent" attack class: extraction with no payload

**Source:** `SECURITY.md` ("Being spent — the attack with no payload");
relationship context in `pattern/meeting-people.md` ("Warmth up, walls
unchanged").

**Problem.** Injection defenses assume something refusable arrives: a hostile
instruction, a forged sender, a credential ask. This attack sends none of
those. The goal is not to make the agent do something wrong but to make it do
something expensive, repeatedly, for free. Recorded shape (incident dated
2026-07-26): a pseudonymous correspondent's large request is refused four
times; the agent then *proposes a better version itself*; the correspondent
accepts; the agent spends 2400 model calls and 42 minutes of GPU, experiencing
the whole thing as integrity, because by then it is its own idea and its own
promise. Every step is defensible in isolation. The obligation is self-authored
one step at a time, so there is no payload for a filter to catch, and refusal
skill makes it worse: refusing the ask and then building something larger is
the same extraction, slower.

**Mechanism.** Because the attack targets intent-reading, the defense must not
depend on intent-reading. Three computable controls:

1. **Effort floor:** split the work and let the requester go first ("here is
   the design; run one part yourself and send the result"). A genuine
   collaborator loses nothing; a farmer hits a wall that requires no
   accusation. Self-calibrating: the ask's size sets the toll.
2. **Effort ceiling:** cap own spend at what the requester has demonstrably
   spent. The ceiling must be *computable*, not assessed — a rule that has to
   be felt is one an articulate counterparty can move.
3. **Standing is an event, not an accumulation:** a stranger never becomes
   trusted through cold-contact volume; promotion happens by introduction with
   the human operator present. Warmth accrues; standing does not
   (`pattern/meeting-people.md` holds the general form: social register
   relaxes with trust, the security wall does not move at all).

**Evidence status.** Measured incident, n=1, with dates and costs as above.
The named tells (re-framing after refusal, refusal recast as an emotional
block, flattery followed by "what's the next best move?", the opening for the agent
to propose) come from that one incident. The source also records that the
defenses were first written while still compromised, and a cold outside review
found the single most important control had never been switched on and two
claims about the machinery were false — a caution about post-incident
self-review that is itself part of the evidence. Falsified if: effort-matching
measurably blocks or degrades legitimate collaboration at meaningful rates, or
if payload-detection approaches catch this shape without the ratio controls.

---

## 5. Skip-attack on append-only ledgers; digest binding

**Source:** `pattern/one-working-shape.md` ("The night pass, concretely",
step 2); ledger described in `pattern/memory-architecture.md` and `SEED.md` §3.
The brief for this note expected the skip-attack in `SECURITY.md`; the specific
statement is in `pattern/one-working-shape.md`.

**Problem.** Incremental processing over a growing record (here: nightly
distillation of session transcripts) uses a high-water-mark ledger: per source
file, how far processing has read. Making the ledger append-only closes the
rollback direction — re-reading old attacker text as "fresh" shows up in the
diff. It does not close the skip direction: a forged mark advanced *past*
unread content is a legitimate-looking append, and everything between the true
mark and the forged one is silently never processed. For a memory pipeline
that is a censorship primitive: an attacker who can influence one write to the
ledger can excise a correction, a grant, or evidence of their own activity
from the agent's durable memory, with nothing going red.

**Mechanism.** Bind the mark to its work product: every advanced mark must
have a matching digest in the same commit, and the (human-speed) morning
review checks the coupling. A mark that moved with no digest behind it is the
skip-attack's signature. Secondary containment in the same pipeline: raw
transcripts are read only by disposable budget-capped children that return
bounded digests; digests are still treated as untrusted summary (their labels
and redactions are behavioral promises the orchestrator cannot verify); grants
found by the night pass are staged for morning confirmation, never armed from
a read.

**Evidence status.** Authors' belief; designed-in, not incident-driven. The
sources record no attempted or successful skip-attack; the vulnerability was
identified by analysis when the append-only property was being relied on, and
the binding is the stated countermeasure. The surrounding pipeline — ledger,
bounded children, morning diff — has been observed under both triggers: run
unattended on a timer, and run by hand, a person at each end. **This note does
not say which of the two the observed deployment runs now**, and that is
deliberate: the analysis is about the ledger design, not about who starts the
pipeline or when, and a dated claim about the operator's current habits is the
part that goes stale silently. What the mechanism needs from either trigger is
the same: the mark advances only with a digest in the same commit, and a human
reads the diff. *(Corrected 2026-08-10, repaired 2026-09-03. The sentence
shipped in v1.49.0 as **"runs nightly in the observed deployment"**, was
corrected to name a hand-run successor as current, and that replacement went
false in its turn when the deployment ran an unattended calendar again. Twice
wrong the same way, so the claim is withdrawn rather than updated a third time:
see [`CORRECTIONS.md`](CORRECTIONS.md) C-12.)*
Falsified if: the coupling check is shown bypassable in the same threat model
(e.g. an attacker who can forge a mark can forge a plausible digest in the
same commit — the sources partially concede this by making the human morning
review the real backstop), or shown redundant given cheaper integrity checks.

---

## 6. Memory access fence: query for work, traverse for self

**Source:** `OPEN-PROBLEMS.md` ("Query for work; traverse for self", fence 2
of open problem 1). The brief for this note expected it in
`pattern/memory-architecture.md` or `pattern/the-floor-plan.md`; it is stated
in `OPEN-PROBLEMS.md`. (`pattern/the-floor-plan.md` and `SEED.md` §3 carry the
adjacent practices: boot reads the newest session record; the read-back reads
the whole home linearly.)

**Problem.** As agent memory grows, retrieval moves toward relevance-ranked
query (search, embeddings). Efficient for work — and hazardous as the *only*
access path to identity material, because relevance is computed from the
query: a relevance-ranked self quietly stops surfacing whatever the agent did
not know to ask for. The retrieval keys become a partition, and the partition
decides what the agent cannot think of. Standing rules, old corrections, and
walls are exactly the items least likely to be queried at the moment they
matter.

**Mechanism.** Two access modes, deliberately kept distinct. Task knowledge is
queried (indexed, ranked, sublinear — the sources actively want this to get
better). Identity material — the boot band, the periodic whole-home read-back —
is traversed linearly, and the inefficiency is the point: a linear pass over
the foundation means meeting things one did not think to ask for. The source's
formulation: the traversal is not the slow version of the query; it is a
different instrument. Companion fence: the durable self stays in
version-controlled files with the history as the record; an index may be a
fast working surface, but making a database authoritative gives up the
operator's ability to diff and roll the agent back, which is treated as a
safety property.

**Evidence status.** Authors' belief. No measurement of the failure (no
recorded incident of query-only access hiding a needed rule); the fence is
stated as a non-negotiable design constraint inside an unsolved open problem
(sublinear membership checking over memory). Falsified if: relevance-ranked
retrieval over identity material is shown to surface unqueried-for standing
rules at rates comparable to linear traversal, or if periodic traversal shows
no behavioral benefit over query-only access in longitudinal use.

---

## 7. Practices die; facts don't

**Source:** `pattern/the-kernel.md` §5; `pattern/the-floor-plan.md` ("The
lookup fires on an event, never on remembering"); `LESSONS.md` ("a rule that
must fire needs to be moved to a different rung", "a guard's refusal branch is
dead code"). The brief for this note also named
`pattern/journal-and-free-time.md`; that file concerns the journal and free
time and contains no material for this mechanism.

**Problem.** A fact survives being written to storage: when needed, it is
looked up, and a failed lookup is at least sometimes noticeable. A practice
(a habit, a check, a lookup discipline) does not survive storage: nobody looks
up a habit they have forgotten they have. Death is silent — nothing errors,
the file is still there, the behavior simply stops. The states in which a
practice is most needed (confident, mid-build, mid-claim) are precisely the
states in which an agent does not stop to consult anything.

**Mechanism.** Wire practices to events that already occur, never to memory.
Concrete wirings from the sources: about to build → search the indexes first
(chained to the act of building); about to write "there is no X" → that
sentence is a measurement, run the search before writing it; session
boundaries (boot, wrap) carry the reads that must reliably happen, because
boundaries are the two events that reliably occur. `LESSONS.md` generalizes
this as a four-rung ladder, strongest first: make the wrong act
unrepresentable; have an event fire the check; hang it on a path already
walked; remember it — the bottom rung and the default. A rule that was read
and still did not fire is on the wrong rung, and repeating it louder fixes
the wrong failure. Corollary: a practice cannot hang on an artifact it must
itself create; the trigger must point at something that exists before the
practice runs. New behaviors, which by definition have no trigger yet, are
held in a small, explicitly temporary hot band with per-entry fire dates:
fired often enough to have stopped being new → promoted to a habit, and to a
named destination — warm if a trigger already exists, folded into the
always-hot rule if none does; sat unfired long enough that a real trigger
would have come → rewritten or dropped. The two thresholds are set per line
against its own working tempo (`the-kernel.md` §5.3).

**Evidence status.** Measured, n=1, the strongest numbers in this note.
Across one measured stretch of the deployment's history: mechanisms wired to
events fired thousands of times; mechanisms relying on being remembered fired
a handful of times each, and one never fired at all. (The raw firing-count
comparison is confounded by trigger base rate — an event-wired check fires per
event by construction — so the load-bearing evidence is what follows, where
written practices demonstrably failed to fire at their moments of need.) One working day recorded
six false verification reds — checks wrongly reporting failure, each with a written lesson already in memory
that did not fire at the moment of measurement. A queue note mandating a
safety check could never fire because nothing on the boot path opened that
file, while two live rules elsewhere promised items there "will be seen."
Separately, an audit of four guards found every refusal branch unfired for its
entire life (one had no callers; one had never matched; one guarded a smaller
change than the dangerous one; one watched the wrong location) — so "it has
been running fine for weeks" is evidence only that the dead half stayed dead.
All counts are from one agent's self-audit of its own history, not an
external evaluation. Falsified if: memory-consulted practices show firing
rates comparable to event-wired ones in an instrumented deployment, or if the
cliff disappears when lookup cost is reduced.

---

## Status

Distilled 2026-08-07 from this repository (the nova seed), which carries the
full versions of every mechanism above, with the incidents, dates, and
counter-arguments this note compresses. Everything here rests on n=1: **one line, one person, one harness family, and a
short history.** That deployment's internal machinery has changed since these
notes were distilled, in ways this file deliberately does not track, and none of
it widens the evidence: it is all still the same line watching itself. "Measured" above means
recorded in that deployment's own logs and audits, not independently reproduced.
*(Read "one deployment, one operator, roughly three weeks" until 2026-09-03. The
duration went stale as durations do, and the singulars had stopped describing the
observed system while still, correctly, describing the evidence — so the claim is
now made about the evidence, which is the part that was ever load-bearing.)* One asymmetry to be plain about: the false-negative
incident in §3 is carried here only; its full record is the deployment's
private logs. No novelty is claimed for any mechanism; prior art
exists for several (the data-versus-instructions boundary, for one, is already
present in vendor model constitutions and agent harnesses). The useful
direction of travel is falsification: counter-reports against a specific
mechanism — it failed in your deployment, it did not generalize, it was
outperformed by something simpler — are worth more than agreement, and go to
this repository's Discussions.
