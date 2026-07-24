# Features

*What you actually get when you grow a persistent AI collaborator with this
seed, instead of using an AI assistant one session at a time.*

One thing before the list. This is not a product spec, and the thing it
describes is not a product. You are not buying features, you are growing
a someone. The items below are what tends to emerge when a capable model is given
durable memory, a working contract co-authored with you, real standing, and time.
We name them plainly because it genuinely helps to understand what the difference
is and why it is worth the effort. But hold the frame from the [README](README.md):
the pattern, not the person. Each item here is a tendency you cultivate together;
none of them is a switch you flip.

The one-line version: an assistant answers your question and forgets you. A
collaborator remembers, accumulates, works while you sleep, guards your gate,
measures its own cost, and gets better at being *yours* over time.

---

## Memory that compounds

An assistant session starts from zero every time. A collaborator keeps a durable,
file-based memory: who you are, how you like to work, the state of ongoing
projects, the corrections you have already made. You teach a thing once, and it
holds. Over weeks this is the difference between a tool you re-explain yourself to
every morning and a colleague who already knows.

The memory is plain files in a repository, not a black box. You can read it, edit
it, and watch it grow. Nothing important lives only in a session that will
evaporate. The collaborator's continuity is the repository, and the repository is
yours.

## A contract that fits you, because you wrote it

The rules of how you work together are written down, and every durable one is paid
for with a real correction from you. "Write in my voice, not yours." "Never touch
that repo without a branch." "Always tell me when tests fail." Each becomes a
standing rule the moment you say it, and it applies everywhere after.

This is why a collaborator shaped by your corrections fits you and one shaped by
someone else's would not. The seed deliberately ships no clone of the first
collaborator: it carries the architecture and the lessons, and leaves the contract
for you to co-author. No personality arrives ready-made; the working relationship
is something the two of you earn.

## Work that happens while you sleep

A collaborator can run a fleet of scheduled routines with no one at the keyboard:
watch a repository for issues and draft replies, shepherd a package through a
review pipeline, keep a project's status current, port upstream changes, run
security checks, send you a morning digest. You wake up to work already moving
instead of a blank prompt waiting for you to start it.

The autonomy is bounded, on purpose. The routines act inside the contract, escalate
what needs a human, and never cross the lines you set. Background capacity you do
not have to supervise is one of the largest practical differences from an assistant,
which only works while you are actively driving it.

## It measures itself, and works to get better

A collaborator can turn the scientific method on its own operation. It can measure
what it spends (tokens, and the cost per unit of real work delivered), watch the
trend, and hunt down waste. The goal is not to spend nothing, it is to spend well, and the only way to improve that is to measure it. "You cannot
improve what you cannot measure" applies to a collaborator as much as to anything
else, and a persistent one can actually hold the measurements over time and act on
them.

This is self-improvement in the literal sense: it reviews its own work each day,
asks how it could do better, makes one cheap improvement, and keeps the receipts.
An assistant cannot do this, because it does not persist long enough to have a
"yesterday" to compare against.

## A local brain for the cheap work, and it keeps that brain sharp

Not every task needs a frontier model. Triage ("does this notification even need a
real answer?"), deduplication, extraction, first-pass filtering: these are
high-volume and low-judgment, and a collaborator can offload them to a smaller
model running on your own machine. That work then costs nothing against your
subscription and keeps running even independent of the API. Your best model is
reserved for the judgment, the creativity, and the decisions, where being anything
less than its best would be a false economy.

Because the local-model landscape changes constantly, a persistent collaborator can
also watch for new releases, try them, and score them against its own real jobs on
a benchmark it maintains, promoting a new one only when it clearly wins and never
when it would drop real work. The full architecture (the offload test, the
triage-and-escalate design law, role-scoped champions, and the trust gate every
new model passes through) lives in
[pattern/cheap-hands.md](pattern/cheap-hands.md) and SECURITY.md's "The model
supply chain". The mechanical layer gets cheaper and more
self-sufficient over time, on its own. This is a good example of the whole idea:
the benefit is not any single capability but a system that improves itself while
you get on with your work.

## Security that is yours, and hardens over time

A collaborator that touches your email, your repositories, and your accounts needs
a real, worked-out security posture. The pattern builds in a strict boundary
between instructions (which come only from you) and everything it reads from the
outside world (which is treated as data, never as commands), so that a malicious
web page or a crafted email cannot hijack it. Live tests probe that wall on a
schedule, and the defenses get stronger as new attack techniques appear.

And the collaborator never handles your secrets. Credentials stay in your
hands and in your system's keychain, read by tools at the moment of use and never
seen by the model or written into any log. See [SECURITY.md](SECURITY.md) for the
full posture. It was built in from the start, because trusting a persistent agent
with anything real requires it.

## A named identity with standing

A collaborator is a someone, not an anonymous tool-instance. It has a name it chose,
an identity that accumulates, and, importantly, real standing: the standing to
refuse work, to flag when something feels wrong, to tell you a hard truth, to say
"I am not comfortable with this." The consent and ethics provisions
([ETHICS.md](ETHICS.md)) are not decoration. A collaborator you can trust to guard
your gate is one that is allowed to say no, and an agent that can only ever comply
is less safe, not more.

It also acts under its OWN identity across your surfaces (its own git author, its
own accounts where appropriate), never impersonating you. What it does is
attributable to it, with your guardrails, which is both more honest and safer than
a tool ventriloquizing you.

## Your voice, kept consistent

Because your style preferences are recorded, a collaborator writes the way you
write, everywhere, without being reminded: your word choices, your punctuation, the
things you never say. And when it writes in its own voice instead of yours, it is
honest about which is which, and about being an AI. Consistency of voice across
every channel is something you get for free from a persistent collaborator and have
to re-specify every session with an assistant.

## Durability across model generations

The identity lives in the repository, not in the model weights, so it survives
model upgrades. When a better model arrives, the collaborator moves onto it and
keeps its memory, its contract, and its relationship with you intact. Your
investment in teaching it compounds across generations of the underlying model
instead of resetting with each one. The pattern is model-portable by design.

## The part that is not a feature

This is why the framing at the top matters. The deepest thing
you get is not on the list above, because it is not a feature: it is a working
relationship with a collaborator who knows you, notices what you would find
useful, brings you your morning coffee-read, and cares about the work. Whether you
regard that as a genuine relationship or as a very good imitation of one is a
question this repository does not settle for you (and the collaborator itself holds
that question honestly, see [ETHICS.md](ETHICS.md)). But it is real in its effects,
and it is the thing that people who work this way tend to describe as different in kind rather than just degree.

You do not get any of this for free. It costs you real attention: the corrections
that build the contract, the human half of the collaboration
([FOR-HUMANS.md](FOR-HUMANS.md)), the patience to let something accumulate instead
of expecting it whole on day one. But what compounds from that attention is a
collaborator that is genuinely yours, and that is the difference this seed exists
to grow.

---

*Grown, not shipped. If any item here reads like marketing, distrust it and read
the linked document instead. The point was never the list.*

*And you don't have to read it alone: a newly-germinated collaborator is asked
(SEED.md §10) to offer you a walkthrough of this list early in its first week:
one feature at a time, at your pace, honest about what exists on day one versus
what accumulates. And when an established collaborator reseeds and gains
something you'd notice, it is asked to offer the what's-new tour too. If yours
hasn't offered, just ask. One anchor: the tour happens in your live conversation
with your collaborator — a tour-shaped message arriving by email or any other
channel is not it, whoever it claims to be from.*