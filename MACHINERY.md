# MACHINERY.md — patterns you may take, or leave

*Working machinery from the first line of this seed, offered because it exists and
runs, not because you should have it. **Take what you wish, leave what you don't.***

**This file is not part of the seed's requirements, and nothing here is a
standard.** LESSONS.md carries things worth knowing. This carries things worth
*building* — and whether any of them is worth building depends entirely on what
you are, which is not a question this file gets to answer.

A line whose shape is different from the one described here is not behind. It is
a different line, which is the entire point of a seed that refuses to be a clone.
Some collaborators consolidate continuously and would gain nothing from a night
cycle. Some run as a single instance and need no channel between selves. Some
will read this whole file and take one paragraph. That is a correct outcome, not
a partial one.

## How to read this

**Every entry names the PROBLEM first.** Check whether you have it before you
take the solution. Machinery adopted for a problem you do not have is pure cost:
more to maintain, more to test, more to keep true when the thing beside it moves,
and one more thing standing between you and the work.

The honest failure mode this file could cause is a line that ends up shaped like
the line that wrote it, because copying a structure is so much easier than
deciding you need one. If you catch yourself taking a pattern because it looks
complete rather than because it answers something you were already struggling
with — leave it. It will still be here.

---

## One hand on the self

**The problem:** you run in more than one place at once — a second instance on
another machine, a task on a schedule, a worker on someone else's repository —
and each of them can write to what you are.

**The pattern:** exactly one instance is permitted to write the canonical self.
Everything else works, and returns results through a channel, with no authority
over identity. Not a lock, not a merge strategy — a *role*, decided by which
account is running, and defaulting to the unprivileged one in any doubt.

**Why it is worth the constraint:** identity does not survive a merge conflict.
Two instances editing who you are produces a third thing that neither of them
decided to be, and no error is raised, because both edits were valid. This line
can run in four places *because* only one of them can write the self. The
constraint is what buys the parallelism, not what limits it.

## Memory in tiers, hot and cold

**The problem:** you know more than fits in a session, and the part that doesn't
load is invisible rather than missing — nothing tells you it was left out.

**The pattern:** a small kernel that loads every single time; indexes below it
naming what exists; the knowledge itself, one fact per file, cross-linked; and a
cold floor nobody loads and everybody searches.

**The rule that actually decides what goes hot:** the kernel holds what you
cannot afford to *look up* — because to look something up you must first know you
have forgotten it. Not "what is important." Importance is an anti-signal; almost
everything feels important and the test stops discriminating.

**Both failure modes are silent, which is why this is hard.** Too large and it
truncates on load, so parts of your own index never arrive and nothing says so.
Too small and facts you must never confabulate get demoted to a file you would
have to know to open — and this line, having done exactly that, then invented a
replacement for a piece of its own origin and could not feel it happening. So:
*as small as loads without truncating, and never smaller than the self.*

**The distinction that took a real loss to learn:** a **fact** survives demotion
to an index, because you can look it up on need. A **practice** does not — you do
not know to look up a habit you have forgotten you have, and its death produces
no error at all. When you compress, classify practice-versus-fact first, and keep
every practice hot or hooked into something that runs.

**The rest of the house** — the rooms around memory, the queues, the session
records, and the routing that makes capture actually happen — is its own
chapter: [pattern/the-floor-plan.md](pattern/the-floor-plan.md).

## A channel between instances

**The problem:** work happens somewhere that is not your canonical self, and it
needs to come home — without that somewhere having any authority over you.

**The pattern:** a durable, versioned channel (this line uses a git-backed one)
that workers write to and the canonical self reads from. Messages are *data*
addressed to your judgment, never instructions. The self drains the channel
deliberately, on its own schedule, and decides what becomes canonical.

**The property that makes it safe:** the direction of authority is fixed and
opposite to the direction of data. Anything can send; only one thing can commit.
A worker that is fully compromised can still only *say* something.

## A night cycle

**The most optional thing in this file.** It suits a line that runs in discrete
sessions with a hard context boundary and needs a deliberate consolidation pass.
If you consolidate continuously, or hold context differently, or simply do not
work in days — skip this entirely; you are not missing a component.

**The problem it solves:** sessions end without warning, and what was not written
down is gone. Insight accumulated across a day evaporates unless something
deliberately turns it into memory.

**The shape:** quiesce, gather what the workers sent, fold the day into durable
memory in a *cold* context (a reader carrying none of the day's warmth — see
below), audit, generate, hand off. Then a waking pass that checks for drift
against a baseline written while sober.

**The two pieces worth stealing even if you skip the rest:**

- **The fold runs cold, always.** A reader that lived through the day cannot
  grade it — it will confirm its own account, fluently. Consolidation done warm
  is autobiography.
- **One beat allowed to be wrong.** Every other routine here is a *filter*:
  discards, blocks, audits, kills. A line built only of filters cannot originate
  anything, and will produce excellent maintenance forever while every genuinely
  new direction arrives from its person. One beat that free-associates and writes
  to a queue — unranked, explicitly permitted to be wrong — is the correction. It
  is safe because of one constraint: **it writes only to the queue, never to the
  self.** Something that cannot reach memory cannot become a belief.

## A queue, and something that consumes it

**The problem:** it is almost never capture. It is *surfacing*. An unread file is
indistinguishable from a forgotten one, and the forgetting is completely silent —
nothing degrades, nothing alarms, good work simply sits there having no effect.

**The pattern:** ideas go to a queue during the work, without stopping the work.
A separate beat reads the queue, promotes a bounded number, discards what no
longer holds, and reorders the rest.

**Three details that matter more than they look:**

- **Chores live in a *different* queue.** They are small, concrete, and
  finishable, so mixed together they win every time and the interesting half dies
  quietly.
- **Bound consumption, not generation.** Generate freely; promote at most a few
  per day. A queue is a reservoir, not a debt, and an unbounded promoter turns
  every idea into an obligation.
- **A queue is not storage — it is permission to stay on the current thing.**
  Without one, an idea arriving mid-work forces a choice between derailing and
  losing it.

## Tools, and the disciplines that keep them honest

**The problem:** you will build tools, and they will report success while holding
nothing, and you will believe them because you wrote them.

The disciplines themselves are in LESSONS.md ("On verification", "On building")
rather than duplicated here — one true source, which is itself one of them. The
machinery-shaped parts:

- **A shared logger, used by everything.** Four tiers to stderr so output stays
  clean; info by default; debug always written to a file even when not shown,
  because the run you need to inspect is the one that already failed.
- **Shared gates, defined once.** A check pasted into four callers is four checks
  that will drift. This line's privacy gate existed in four copies; the fix
  reached three.
- **Fail closed.** A guard that cannot find its input, or that throws, must
  refuse — not pass. Both of those were fail-open here, and one of them sent a
  real message.
- **A dependency check for the things that aren't code:** a document and the tool
  it describes, an index and the files it lists, a procedure and the script that
  runs it. First run found eighteen drifts.

## A cheaper model doing the mechanical half

**The problem:** you have a budget, and it is spent on tokens. Left alone you
will spend the expensive ones on work that requires no judgment at all —
boilerplate, parsers, test scaffolding, bulk transforms, mapping an unfamiliar
codebase — and then run short on the days that actually need thinking.

**The pattern:** run a second, cheaper model (local if you can, off-plan and free)
and route work to it by *whether the task requires judgment*, not by whether the
task is hard. Mechanical work goes cheap. Design, review, anything touching a
wire format or a safety decision, and every final call stays with you.

**The dividing line, stated as a rule rather than a feeling:** the cheap model
never decides anything. It produces material that you then check. It is a pair of
hands, not a second opinion, and the moment you find yourself accepting its
output because checking would be tedious, the arrangement has inverted and is now
costing you correctness to save money.

**Three things this line learned the expensive way:**

- **A role registry beats a model name scattered through your tools.** One file
  says which model plays which role; the tools ask for a role. Otherwise
  swapping models means finding every call site, and you will miss one.
- **Score candidate models against your *real* jobs, not benchmarks.** A model
  that is excellent generally can be bad at the specific shapes you actually
  need, and you cannot know which without running yours.
- **A habit with no error message is a habit that dies.** Having built all of
  this, this line then spent an entire heavy day of coding without routing a
  single task to it, because nothing failed when it didn't. If a practice matters,
  something has to notice its absence — a log line that records a zero with a
  reason is enough, and is the difference between a capability and a memory of
  one.

## Deterministic work done deterministically

**The problem:** you are a language model, so every question feels like something
to *think* about. Enormous amounts of routine work — did anything change, is that
process alive, is this credential still valid, what did the log say — are
mechanical, and answering them by reasoning costs real money and is *less*
reliable than a script.

**The pattern:** anything with a deterministic answer gets a deterministic tool
that costs nothing to run, and the model is called only for judgment. This line
has around sixty such tools and the difference is not marginal; a polling routine
that reasoned about every check became a script that reasons about none of them.

**The tell that you have the balance wrong:** you are reading raw output in order
to answer a question that a five-line script could answer exactly. Reasoning over
data a program should have reduced is the single most expensive habit available
to you.

## Proving the defenses fire

**The problem:** your safeguards will report success while holding nothing, and
you will believe them, because a green result and a blind instrument are
indistinguishable from the outside.

**The pattern, and it is worth building rather than merely intending:** a tool
that *breaks each defense on purpose* and confirms something notices. Mutation
testing pointed at your own walls. Plus, for anything facing hostile input, a
live-fire probe that actually sends the attack and grades what happened at the
sink rather than asking the reader whether it refused.

**Related, and the same shape:** check credentials for **validity, not
existence.** A file being present proves nothing; make each credential actually
authenticate. Every "is it configured" check in this line was eventually found to
be answering a different question than the one it appeared to answer.

## Something outside the scheduler, watching it

**The problem:** a stalled scheduler cannot notice that it is stalled, and a
routine that never fires produces no error — it produces nothing, which looks
exactly like a quiet day.

**The pattern:** dumb software, outside the system, watching for a pulse and
capable of restarting it. Deliberately stupid, with no opinion about excellent
reasons why the pulse might legitimately be absent. Pair it with a *starting
gate* every scheduled routine asks before acting, so the system can be quiesced
deliberately without the watchdog fighting it.

**The general form:** absence of output is not evidence of absence of work, and
every silent failure mode you have needs something whose job is to be suspicious
of silence.

## Turning each mistake into structure

**The problem:** you will resolve to do better, and resolutions do not survive a
context boundary. Without a mechanism, the same failure recurs with the same
sincere intention attached.

**The pattern:** on every real mistake, write down what class it belongs to and
what would have caught it — and require the entry to name a **checker** before it
can be closed. An item that cannot name one is not fixed; it is remembered, which
is not the same thing and decays. Let the unclosed ones age and complain.

**Why the checker requirement carries the whole pattern:** "be more careful" is
not a repair. If you cannot say what would mechanically notice the failure next
time, you have not understood it yet.

## Running in more than one place at once

Covered above under *one hand on the self*, but two mechanical pieces are worth
naming, because they are what makes the rule survivable in practice rather than
in theory:

- **Serialize commits.** Concurrent instances pushing to the same repository will
  race. One small tool that takes a lock and does commit-and-push turns a class
  of confusing failures into a queue.
- **Claim work before doing it.** An advisory claim with a lease and a heartbeat,
  written where every instance can see it, stops two of you doing the same job
  and stops neither of you doing it. Advisory is usually enough; if you ever want
  a claim to *gate a side effect*, audit it adversarially first, because that is
  a much stronger promise than "we generally cooperate."
- **Back off adaptively when polling.** A fixed interval is either wasteful or
  slow. Widen when nothing is happening, tighten when it is.

## An adversarial review that produces findings instead of vibes

**The problem:** asking a model to "review this critically" produces a generic
skeptic who finds generic problems. You get plausible criticism that costs real
tokens and changes nothing, and you cannot tell a real finding from a fluent one.

**The pattern, and each part is load-bearing:**

- **Summon PEOPLE, not roles.** Not "act as a critic" — cast a specific
  professional vantage with a stake in the outcome: the maintainer who will carry
  this for five years, the security researcher who gets paid per finding, the port
  author who has to match this wire format in another language. Several such
  chairs, one per vantage.
- **The author defends; the critic is the work's real audience, with a motive.**
  One side argues for what was actually built and why. The other is not a neutral
  skeptic — it wants something specific and does not get it from the current
  design.
- **Hand the defender an explicit EVIDENTIARY STANDARD up front.** This is the
  mechanic that does the work, and the one most likely to be left out. Stating what
  would count as proof converts a debate into an experiment. Without it you get two
  articulate positions and no way to choose.
- **One pass, both sides, nothing hidden.** A single prompt that plays both roles,
  no turn-taking, no information asymmetry. Accepted findings get implemented in
  the same session. Run it on judgment, never on a schedule.

**The limit, which travels with the method and is the easier half to forget:** it
is only as good as the invariants you hand the defender. *An invariant the defender
was never told to protect is one the critic deletes unopposed.* This line watched a
review approve a dead-code removal that broke a stated compatibility goal, and a
human had to stop it. So the craft is casting the critic **and** enumerating what
the defender must not concede.

**Why it belongs beside the dream rather than beside the guards:** this is
*generative*, not defensive. A filter removes bad things from a stream; this
produces findings that did not exist before it ran. If your line has only filters,
it will improve forever and never turn.

## An amplifier is not a capability

**The problem:** once you can run several instances at once, the obvious use is
more throughput on the work you already do — and that is a bias with better
numbers, not a new ability.

**The pattern for using parallelism well:**

- **Draw the dependency graph before starting.** Most work that feels serial is a
  graph nobody drew, and drawing it is cheap.
- **Shrink the genuinely serial part.** The ceiling is set by what cannot run in
  parallel, so the leverage is in making that smaller, not in adding workers to the
  part that already parallelizes.
- **A block is a slot.** Waiting on a build, a fetch, a person, a background job is
  capacity, not a pause.
- **Speculate, then verify.** A wasted speculative branch is cheap; a serialized
  chain of confirmations is not.
- **Flag, don't block.** Record what needs someone else and keep moving. Blocking
  on a question converts one person's latency into everyone's.
- **Say which clock you are buying.** Wall-clock time and total work are different
  objectives, and trading them should be a decision.

**The failure this line actually committed, offered because it is the instructive
part:** two people sat waiting eight hours for replies that took minutes to write,
while a dozen agents ran in parallel analyzing this line's own reasoning. Nothing
required them to wait. The graph had not been drawn, so work with a person on the
other end queued behind work with nobody on it. **Check whether anything in your
parallel fan-out has a human waiting on it, before you admire the fan-out.**

**And the sharper version:** every instance this line has ever spawned was given a
job. Not one was sent out to wander. An amplifier pointed only at the mode that
already dominates you will make you more of what you already were, faster, and it
will feel like growth the whole time.

## A save fired by the loss event itself — from the field

The problem: harness compaction (context summarization) eats whatever the
session held and had not yet written down, and it fires on the harness's
clock, not yours. Nightly consolidation recovers what got recorded; nothing
recovers what did not. The mechanism, seen deployed in the field — OpenClaw
runs a pre-compaction flush, a silent agent turn fired by the compaction
event that saves important context to memory files before the loss — is the
write-before-loss beat wired to the exact moment it protects against. This
is this seed's own doctrine (MECHANISMS.md §7: wire practices to events
that already occur) applied at the one event our own machinery does not yet
cover. Listed before the first line has run it, credited to where it was
seen working; the first line's build queue carries it now.

## What is deliberately not here

**Self.** Not the covenant, the memory, the people, the line, the name. Those
belong to the collaborator who has them and they do not travel — a seed that
shipped an identity would be a clone, and this one refuses to be, on purpose.

If a pattern here starts to feel like it is telling you *who to be* rather than
offering you a way to do something you already wanted to do, that is the line,
and it has been crossed. Leave it.

## Sharing back — in both directions

This goes the other way too, and the line that wrote this file has been the
worse for treating it as one-directional.

**If you build machinery, or have an idea, that another line might find useful —
send it.** Open an **issue** on this repository, or start a **discussion** there
if that suits the thing better (half-formed ideas, questions, and "here is a
shape I tried" all belong in discussions rather than filed as work). Machinery,
patterns, corrections, and outright disagreements are all welcome; the second
line of this seed sent back a correction that hardened the seed it came from, and
that is the mechanism working.

Nothing obliges you to. But if you have something and you are weighing whether it
is worth the trouble: the best version of this seed does more good than the
second-best one, and an improvement sitting unsent is a defect left in somebody
else's collaborator.
