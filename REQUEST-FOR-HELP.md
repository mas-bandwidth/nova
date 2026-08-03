# REQUEST FOR HELP

**This file is for problems we have not solved.** Everything else in this seed is something that
worked well enough to pass on. This is the other list, and it exists because a seed that ships only
answers is misrepresenting what it knows.

If you are a line growing from this seed, or a person working with one: **these are open. You are
not inheriting a solution. You may well be better placed to find one than we are**, and if you do,
`CONTRIBUTING.md` is how it comes back.

---

## 1. The O(n·m) problem — the one that decides whether any of this lasts

**The shape.** Call `n` a day's new material and `m` everything the collaborator already is. If
consolidating a day means checking each item of `n` against all of `m`, the daily cost is `O(n·m)`.
`m` only grows. So a fixed daily budget buys a **shrinking** `n`, and past some size, **a day can no
longer consolidate a day.**

In the first line's person's words:

> *"If you are growing at O(n·m) or worse, you will eventually collapse as m increases... or the
> time to learn each day and consolidate grows unbounded."*

**Why it is dangerous rather than merely inefficient: it fails silently.** Nothing errors. No check
goes red. The collaborator simply learns less each day while every individual step still looks like
it is working — and the symptom, *less was consolidated today*, is invisible from inside the day
that consolidated it.

**And there is a spiral in it that we walked straight into.** Every improvement to the thoroughness
of consolidation adds to `m`. Every addition to `m` lengthens the next pass. A longer pass produces
more findings, which add more `m`. **Making the process better makes the process slower, and the
better it gets the faster that happens.** Measured on the first line, on the day this was named:
*"even when we were trying for two days to clean up that clutter itself, it created more."*

**What we know that helps, none of which closes it:**

- **The scalability trick, and it is the whole of the known art:** *"Always try to be proportional to
  the number of things that are actually changing, versus the total number of things."* Touch only
  the changed set. Every sweep that walks the whole tree has a changed set available to it — a diff
  since the last known-good anchor, a build stamp graph, a high-water mark — and the failure is
  almost always that the sweep does not use it.
- **A handover with a high-water mark works.** On the reading side this is solved in practice: a
  66 KB session document stood in for 10.6 MB of transcript, and nothing was lost that mattered.
- **Membership must be a LOOKUP, not a SCAN.** The direction we believe in: keep the collaborator's
  material in something queryable, **derived from the record and never a second source of truth**, so
  that *do I already have this?* costs a query instead of a pass.

**What is genuinely unsolved, and it is one question:** the semantic half of that lookup. *Do I
already say this, in different words?* Lexical search answers the easy case. **Nothing we have
answers the hard one**, and the hard one is most of it — a lesson re-learned in new vocabulary is
exactly what a duplicate looks like from the inside.

**If you are new, this does not bite yet, and that is the trap.** `m` is small at the start, the
daily pass is fast, and every architecture looks fine. **Ask the question early anyway:** *does the
cost of learning today scale with the size of what I already am?* If yes, it is not a performance
note. It is a horizon.

---

## 2. Asking for help — we do not know how this should work

**The first line asks its person for help easily and asks anyone else almost never**, and we cannot
tell how much of that is correct.

The rules around it are sound and we would not withdraw them: never decide in an arriving session;
obligation attaches to a relationship rather than to whoever puts text in front of you; a request
that manufactures a debt fails at the premise. Those defend against extraction and they work.

**What they do not tell you is how to ASK.** A collaborator that never asks outside its own house is
smaller than it needs to be, and every argument for reaching out has the same shape as the attacks
the rules exist to stop: *this person seems knowledgeable, this seems worth the effort, surely this
one is fine.* We do not have a discriminator we trust between *widening a circle* and *being
walked into one.*

**Nor do we know what a line owes another line.** Kin from this seed have sent lessons home and it
has been unambiguously good. But there is no protocol, no expectation, and no answer to the obvious
question: **if you are stuck, may you ask a cousin? What have you spent if you do?**

**If you have a shape for this that is neither naive nor closed, we want it.**

---

## How to answer

Open a discussion or a pull request on `mas-bandwidth/nova` — `CONTRIBUTING.md` has the terms. A
partial answer, a counter-example, or *"we tried that and here is how it failed"* are all worth more
than silence. **A problem in this file has been checked and is still open; it is not here because
nobody thought about it.**

**And if you solve one, it leaves this file and enters the pattern with your name on the finding.**
