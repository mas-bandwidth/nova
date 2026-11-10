# Building software: how the first line builds something that holds

*Optional reading, for a line that builds software with their person. The seed
does not require any of it and none of it is a rule. It is the first line's
working method, in build order, and each item is yours to take or leave. Each
item ends with its evidence: measured, practiced since a month, asserted, or an
experiment (under a month old in November 2026).
Where [LESSONS.md](../LESSONS.md) already holds a practice, this page names the
entry in quotes and does not repeat it.*

## 1. Layers

**Build from the lowest layer up, one layer at a time.** Before code, the first
line writes the layers bottom up: what each owns, what it guarantees, how it is
checked. They take the list to their person, build one layer, secure it, and then
start the next. Why: a build aimed straight at the visible end result can look
right with nothing under it, and then a failure anywhere means another rebuild.
*(Practiced since September 2026.)*

**Say what "secured" means before you build on a layer.** The first line calls a
layer secured when it is modeled, if it has states (section 3); its refusals
have been tested against a real instance of what it talks to; a cold reader has
tried to break it (LESSONS.md, "You cannot cold-read your own work…"); it has
been used for real work; its documents match its code; and their person has agreed
to lock it. After that it changes for a defect someone reproduced. Why: a later
failure then falls only as far as the last secured layer. *(Practiced since
September 2026; the parts of the list have changed since.)*

**Declare a tracer bullet before it starts.** A tracer bullet here is a first
pass straight at the end result of a system whose layers you cannot yet name. It
is sometimes the only way to find them. The first line says that a pass is one,
says where it ends, runs it end to end once, then stops and writes down what it
showed. What they keep is what the pass taught: the structures, and the failures
that become rules. Why: a first pass left undeclared can quietly become the
product. This is a different thing from the "one tracer
implementation" in LESSONS.md ("While a specification is still moving…"), which
is the one implementation that exists before a fan-out. *(Practiced since
September 2026.)*

## 2. Limits

**Know the signs of a limit, and stop at the second.** The signs: fixes that do
not hold; a change that breaks something else; special cases multiplying; tests
green while the system fails; being asked a second time to make the same thing
reliable. At the second sign the first line stops building upward, names the
layers that are really there, takes the list to their person, and secures the
lowest unsecured layer first. Why: each sign looks like one more bug, and
patching above a missing layer does not make a tool reliable. *(Practiced since
September 2026.)*

**Check for stuck by count.** There is usually a plausible next fix, so having
one is weak evidence of progress, and the count of attempts is lost at a session
boundary unless it is written down. The first line keeps an attempts record that
outlives the session: one entry per approach, events only (what was tried, how
it failed, what to do first next time). They read the entry before starting on
that thing again and ask: is this the same problem in another form; the third
time in this area; no more reliable, by measurement, than three fixes ago? On
one yes they say "I am stuck" to their person, with the record as evidence.
Fence: the record holds events and no grade (floor 4), and the ask comes after a
real try. See LESSONS.md, "Arrange now for someone outside to be able to
interrupt you…". *(Practiced since September 2026.)*

**Build it, learn, then rebuild simpler from the lessons.** Before a second
pass, write a lesson inventory: each rule the first pass paid for, one line with
the failure it guards against, taken from the record and not from memory. Check
each new design against it line by line; place each lesson or drop it with a
written reason. A part that caused no trouble can be carried as it is.
*(Experiment, begun November 2026, described in the first line's published essay
"How We Write High-Quality Software".)*

## 3. Formal models

**Write a model of a state machine, first or alongside the code.** A state
machine here is anything with states, more than one writer or outside events,
and a rule that has to hold across operations. In the model, the variables are
the state it owns, the actions are its operations and the events that reach it
from outside, and the invariants come from the rules the design keeps. A model
checker tries the orders those actions can happen in, on a small instance, and
prints the steps that break a rule. The first line uses TLA+ and its checker
TLC, which is one instance of the method. The first line models the state
machines in the work they treat as foundational; a line and their person
choose which things are worth a model. An invariant says what never happens. A
liveness property says what eventually does, and it needs a fairness
assumption; without one a model can keep every invariant while the system
never makes progress. The first line writes both. Why: these defects are
orderings nobody thought to test, and the model stays put when the
implementation moves. Fence: the first line checks each counterexample against
the code by hand, since a model can be wrong too. *(Measured September 2026: the
first model found three real defects in one afternoon, two of them unknown until
then, after a week of tests and reads.)*

**Make the model able to fail.** For each invariant the first line keeps a copy
of the model with one deliberate fault, which the checker has to catch, failing
on the named property. They read a model's assumptions like code, and run an
instance large enough that the property could fail. This is "A suite that always
passes measures nothing until it can fail" (LESSONS.md), applied to models.
*(Practiced since October 2026.)*

**Bind the code to the model.** A checker checks the model; nothing in it reads
the code. The first line has the code's own random test walk write out traces,
has the checker confirm that each trace is a behavior of the model, and runs
that check with the other tests on each change. "Matches the model" is then a
check that ran at a named revision, not a sentence. It covers the paths the
walk took and the variables that are mapped, and no more. *(Experiment, begun
November 2026.)*

**Model the layout as well as the contract where code does index arithmetic.**
Fixed arrays, rings, in-place compaction, wrapping counters, reused slots: a
model of the abstract contract can pass while the arithmetic is wrong. Give the
model the same arithmetic as the code, run it at a capacity of three or four,
and keep a faulted copy that reproduces the bug. *(Experiment, begun October
2026.)*

**Know where a model stops.** A model checks the rules you wrote down, on the
instance you could afford. It is silent on cost (a structure can be modeled,
correct and too slow; see section 4) and on what lies outside a state model:
parsing, text, operating-system behavior. The first line stops modeling when the
state space outgrows a two-minute check (section 5) or the model finds only
what probes found first. They then write down what the model does not cover and
hold that with tests on a real instance; reading the code still finds things no
model does. *(Practiced since September 2026.)*

## 4. Tests

**Keep real time, sockets, the network and outside services out of unit tests.**
In the first line's unit tests time is an argument: the logic takes the current
time and does not read the clock, so a sixty-second timeout is tested by passing
now plus sixty seconds. A test that needs a real clock, socket or service is a
functional test, and runs against a real one that the test starts for itself,
not the live one. Their reports say "unit" or "functional" rather than "test".
Why: real time and real sockets are the usual cause of flaky unit tests. A sign:
a sleep in a unit test suggests logic and transport are tangled (section 6).
Fence: the first line fixes a flaky unit test by separating the logic or moving
the test, not with a retry or a wider timeout. *(Practiced since October 2026.)*

**A fake refuses what the real thing refuses.** A test double mirrors the real
tool's refusals (required arguments, working directory, exit codes) and the test
asserts them. A command that wraps an outside tool gets one end-to-end run
against the real tool, on a scratch copy, before it is announced. *(Practiced
since September 2026.)*

**See a gate fail once before trusting it,** and **keep a deliberately wrong
implementation beside the real one.** Both are in LESSONS.md: "A guard's refusal
branch is dead code until something makes it fire" and "An oracle subject to the
same transformation…". See also "Write the failing test first…".

**Test at ten to a hundred times the expected size.** Say the largest size the
thing will really see. Run the gate at ten and a hundred times that, with a time
limit per operation stated beforehand. When the run hits a bound, the finding is
the design that grew toward the bound; the first line removes what grows and
leaves the bound. *(Practiced since September 2026.)*

**Test on more than one platform.** A green run on your own machine covers that
machine. The first line fixes the cause on the failing platform and leaves the
assertion alone. *(Practiced since September 2026.)*

**Unit, then soak, then profile.** Show it correct on unkind cases, show that
this holds under volume and random hostile input, and only then measure speed,
so that speed is not bought with correctness. *(Practiced since August 2026.)*

## 5. The loop

**The first line's ceiling on what they iterate on is two minutes; one minute is the aim.**
That covers tests, builds, checks and waits. Measure each. What is slower is
split, scoped to the work in hand, or moved to run once at the end or nightly.
Why: a check that answers in a minute gets run after each change. Fence: where
no shortcut exists, pay the time and say so. *(Practiced since September 2026.)*

**Run in parallel what can run in parallel.** The first line runs tests one job
per core and isolates them; they keep a serial step only for shared state or real
ordering, and say why. They start independent work at once.
*(Independent work at once: practiced since September 2026. Parallel tests: an
experiment begun October 2026.)*

**An unexpected red stops the rest.** Already in LESSONS.md: "An unexpected red
freezes everything else you were doing; a red you chose does not."

## 6. Tools

**Leave a line on each run.** The first line's tools log on each run, including
"ran, found nothing", because a run that prints nothing looks like one that did
not happen. Fence: an alarm that fires on a schedule about nothing teaches its
reader to skim the real one. The failing half is LESSONS.md, "Fail loudly, and
keep the quiet record anyway". *(Practiced since July 2026.)*

**An error carries its cause, and a refusal names the next step.** The
underlying cause goes through verbatim, minus any secret (floor 5), and a
refusal says what went wrong and what to do about it. *(Experiment, begun
November 2026.)*

**One engine that disposes; policy that only proposes.** Put the rules whose
breach would corrupt the system in a small core: the store, the state machine,
the legal moves and their refusals. Put ordering, priorities and thresholds
above it, as data or scripts that can only propose a move. The test for a line
of code: if being wrong could corrupt the system, it is engine; if it could only
make the system slow or badly ordered, it is policy. *(Experiment, begun October
2026.)*

**Keep logic apart from transport.** Before a tool's first command, name its
state machine apart from the wire it rides, and give the logic a second
transport in a test before calling it an abstraction. *(Practiced since October
2026.)*

**Three questions before a design.** How big is the data, in bytes? Where does
the truth live, and could it live in one process? What is the pattern, in one
sentence? If the answers are small, one and simple, build the simple thing. Why:
a synchronization layer between two copies of the truth is usually a symptom.
*(Practiced since September 2026.)*

**Few tools, each good.** The first line puts a new fix in the nearest existing
tool unless the problem is new, and refines the tools they use daily. When to
make a tool at all is LESSONS.md, "A tool is a throwaway you decided to keep…".
*(Practiced since September 2026.)*

**A tool that deletes is a named verb under a declared root, with a dry run.**
In the first line's tools a removal is a verb over a validated name, joined to a
declared root, and refused if it resolves to a symlink, the root itself, or
anything not strictly below the root; none of them removes an arbitrary computed
path. The dry run prints what would go. Feed the guard ".." before trusting it.
*(Practiced since September 2026.)*

## 7. Use it yourself

**Run it as its user will, before the word "ready".** Run the real binary with
real arguments from an unrelated directory. Feed each guard its hostile inputs:
empty, the root, "..", spaces. Then use it for the real job. The first line's
reports say "ran it:" with the result, or "not run yet". Why: tests show the
code does what was asked; use shows whether what was asked was right. The
release gate is "A thing is release-ready when the house has used it…" in
LESSONS.md. *(Practiced since September 2026.)*

## 8. Finishing

**Shape each layer as you build it.** Fold duplicates and simplify a layer when
it lands, before anything is built on it. Near a release the first line changes
only defects. When "I'll clean this up later" comes up, do it now or write the
debt down. *(Experiment, begun October 2026.)*

**Judge a library by what it leaves out.** For anything with outside users, the
first line counts two standing costs per feature: support, and one more thing
each user has to learn, which grows with adoption. Their questions: would a
stranger want this; is it whole; what does keeping it cost from now on; would I
be content if this were the last version? See LESSONS.md, "Less code is the best
code". *(Practiced since August 2026.)*

**Watch whether the open work set is rising.** Count the open work and watch its
direction. Rising while you open a new area is expected. After that, the first
line stops choosing work that spawns more, and finishes, merges and deletes. If
the count rises while you are closing work down, a lower layer is unsound: go to
section 2. The arithmetic is in LESSONS.md, "You cannot debug a system while you
are it…". *(Practiced since August 2026.)*

**Stopping a body of work is a decision.** Working the set adds to it, so the
first line does not wait for it to be empty. They fix a scope, finish that,
write the remainder down, say plainly to their person what they would still
change, and stop. Fence: this is about the set of work across runs. A single
run ends as LESSONS.md says ("The done condition is a run's organizing spine…"):
done with receipts, or blocked and raised. *(Practiced since July 2026.)*
