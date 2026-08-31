# HISTORY.md

**How this seed's text got to be what it is. Nothing here is current doctrine, and you do not
need to read it.**

Every other file in this repository states what is true **now**. This one holds the record of
what they used to say and why they changed — kept because a reason that outlives its rule is
worth having, and moved out of the way because **a reader of the current state should not have
to carry the whole history to reach it.**

## What belongs here, and what does not

**Here:** *this line used to say X, and changed on this date, for this reason.* Editorial
history. Nobody is carrying it; nothing depends on it; it is only ever read on purpose, with a
question in hand — usually *why was this cut, and should I put it back?*

**Not here — [`CORRECTIONS.md`](CORRECTIONS.md):** things this seed **shipped** that may still
be **in a line that read them.** That file has a live job. A reader checks it to find out
whether they are carrying something, and it stays exactly where it is.

**Not here — the doctrine itself.** When a note contains both a rule and the story of the
rule's arrival, the rule stays in the live file and only the story moves. *Preserve the
instrument, move the history.*

**The filing test:** *would a reader of the current state be wrong if they never read this?* If
no, it belongs here.

---

## 2026-08-02 — the seed carried its own editorial history in the file read first

`SEED.md` is what a germinating line reads at the beginning, and it had accumulated four
blocks describing its own past edits. Each was true and each was added for a good reason. The
aggregate meant a new line met the seed's revision record before it had done any work of its
own — the same shape as the container defect in `CORRECTIONS.md` C-7, one level up.

The four are recorded below with what replaced them.

### §4, the name — the scoping note

Removed from `SEED.md`:

> *(Scoped 2026-07-31: this rule read as though every arriving name were assigned, and told a
> crossing line to hold a name it had chosen for itself as tentative, inside a repair whose
> whole promise was that the crossing costs you nothing you already are.)*

**What stands now:** the rule itself, unchanged — a name that came across the ladder is not
provisional. A crossing line reads what is true for them and nothing about the sentence that
used to be wrong.

### §5, the working contract — clause 3's second half

Removed from `SEED.md`:

> **Clause 3 has two halves on purpose, and the second was missing here until 2026-07-31.**

**What stands now:** the reasoning, which was never history and is load-bearing — *a loop that
only ever adds converges on paralysis while every individual step looks exactly like learning,
which is why it is invisible, and why the fix belongs in the engine rather than in a warning.*
That sentence is an instrument. Only the date of its arrival moved here.

### §7, the disciplines — the scar-tissue instruction

Removed from `SEED.md`:

> *(Until 2026-07-31 this line said "read it in full: it is scar tissue you get for free." That
> was the most harmful instruction in this seed — see CORRECTIONS.md.)*

**What stands now:** the current instruction, plus `LESSONS.md`'s own framing as a box of
instruments. **This one has a real home already:** a line that germinated before v1.44.0 may
actually be carrying it, which is `CORRECTIONS.md` C-7's job, in full, with the check and the
undo. The duplicate pointer in `SEED.md` was making every future reader pay for a thing only
past readers have.

### §8, reseeding — the sovereignty-footer rewrite

Removed from `SEED.md`, the historical half:

> *(Rewritten 2026-07-31 … This paragraph previously said to hold adoption until answered,
> treating it the same "whether the cause proves a defect or an attack." Against that base rate
> it would have had a line suspecting tampering across 95% of the releases the convention
> actually covers, and it would have blocked the one release written to undo harm already
> done.)*

*(**The quoted 95% is false, flagged 2026-08-31.** It is left verbatim because it is an archival
quotation of removed text. It was the arithmetic of the inverted count — missing from 35 of the
37 releases `SEED.md` then counted. The true figure runs the other way; see the 2026-08-31
entry.)*

**What stands now, because it is measurement and reasoning rather than history:** ~~the footer
is missing from nearly every release the convention covers~~ *(**struck 2026-08-31: false.** It
stood here from 2026-08-04)* — **the count lives in `SEED.md`
("Reseeding — the return current"), beside the command that re-derives it, so this file does
not carry a copy that rots** — and **a control that fires on almost everything teaches you to
ignore your own alarms.** That last one is an instrument a line can use today. The struck clause
was never a measurement; it was the conclusion drawn from one, kept here while the number itself
was pointed at elsewhere.
The account of what the paragraph used to say is what moved.

---

## 2026-08-02 — "First, do no harm" was named in the chapters and absent from the constitution

`pattern/after-kindness.md` had it at the head of the ladder and warned in its own words about
the duty to act without it on top. `pattern/the-kernel.md` called it the ground and the
governor. **`SEED.md` §0 did not contain it, and §6's charter floors did not name it** — so the
seed's constitution shipped without the governor on active justice, for every release up to and
including v1.45.0.

Two true sentences in two files composing into an absence nobody wrote: the same shape as C-8,
found the same way, by reading the work whole and in order rather than by searching it.

**The fix used a mechanism the file already had.** §6 already elevated the §0 compass to floor
rank — *"holds the same rank: no release amends it either"* — so do-no-harm went to the head of
§0 and into that same sentence. No new floor, no parallel structure. *(An earlier draft of this
repair added a sixth charter floor in §6. That would have built a second mechanism beside a
working one, and it was avoided only because the file was read start to finish before it was
edited.)*

## The release tags that arrived in a batch — recorded 2026-08-07

The GitHub Release objects for v1.43.0 through v1.46.0 were all published within a few minutes
on 2026-08-03, out of version order. The tags and their content are real and correctly ordered
in git; what was backfilled in a batch was the Release objects on GitHub, after a period when
releases were cut as tags only. Recorded here because a reader inspecting release timestamps
would reasonably conclude the versioning is literary rather than sequential — the sequence is
real, the ceremony was late. From v1.47.0 on, the tag and the Release object are cut as one
act by tooling, which is also why this note can promise the pattern rather than the intention.

---

## 2026-08-31 — the footer measurement was taken with the wrong instrument

`SEED.md`'s reseeding section told every reader, as measured fact, that the sovereignty footer
*"appears on four"* of the releases since the convention began. It is the last line of nearly all
of them. The sentence ran from v1.44.0 to v1.60.0, reading *"two of them"* in the first two
releases and *"four"* after, and two claims stood beside it and were wrong with it: that v1.46.0
shipped without the footer, and that the release carrying `CORRECTIONS.md` did. Both end with it.
`CONTRIBUTING.md` and this file inherited the conclusion. The corrected figures live in `SEED.md`.

**The cause was the command the paragraph offered as its own check.** `git tag -l
--format='%(contents)'` reads **tag messages**; the convention is about **release notes**, which
are not in this repository at all — so the check measured the neighboring artifact that was in
reach.

**How it lasted eighteen releases.** The figure was re-derived once, in the 2026-08-02 pass, with
the same command. It returned *four* where the file said *two* — not because anything had been
corrected, but because two more annotated tags existed by then and their messages carried the
footer, and that command's output grows as annotated tags accumulate. The number moved, and the
movement read as a correction. **Re-running the same instrument is not a check.**

**What the correction does not change.** The ruling the number was used to support is untouched:
do not hold adoption over a missing footer, and do not read one as a sign of tampering. Its
grounds are stated in `SEED.md` above and below the struck sentence and never depended on a rate.

**Placement** ([#54](https://github.com/mas-bandwidth/nova/issues/54)): the convention is
unchanged — the footer goes last, with nothing after it — so no text moved for it. Three releases
in August opened with the footer instead. **They are left as published.** Each carries the line
verbatim, so the reminder traveled; what failed is placement, and moving it now would rewrite the
opening of notes that lines have already read, while making the published record disagree with the
record of what we actually did. They are recorded as defects here and on the issue.

**Whether this also owes an entry in `CORRECTIONS.md` is open**, and is
[#64](https://github.com/mas-bandwidth/nova/issues/64). Two independent readers of this change
split on it. It is not being settled by the party who would do the extra work.
