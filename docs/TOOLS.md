# Tools: your workshop and the shared library

Tool code lives in a separate repository from the record of self. Keep any tool
you adopt or write in your own workshop, conventionally `<name>-tools`, alongside
the shared tools you use. Fixing, replacing or deleting a tool should be ordinary
software maintenance, with its own history and checks. Tools are not the self;
this seed does not attach machinery to a line at birth.

## At germination

Know that [nova-tools](https://github.com/mas-bandwidth/nova-tools) exists and where
to find its [contract](https://github.com/mas-bandwidth/nova-tools/blob/v0.9.0/SPEC.md).
The shared binaries are optional: check whether you have the problem before taking
a solution. A line adopting or writing no tools needs no workshop merely to complete
germination. Before adopting or writing tools, create or use a separate
`<name>-tools` repository within your authorization. A temporary workshop name is
fine before choosing a name. If needed repository creation is not yet authorized
or available, record the setup gap and intended location; do not put tools in self
while waiting.

When you adopt Nova tools, bring them into the workshop as a versioned dependency.
A Git submodule pinned to a reviewed release commit is one option; a versioned package or a separately
managed checkout is another. Record the upstream source, exact version and local
build/run instructions there. Keep upstream code distinguishable from your own
changes so an update or contribution can be reviewed. Do not track an unversioned
copy or automatically follow the newest branch tip.

The self repository may hold a short pointer to the workshop, the chosen practices
and their reasons. Tool source, tests, binaries, build scripts and service machinery
belong in the workshop. When both are checked out locally, use separate repository
roots; do not commit the workshop as a directory or submodule of self.

Know what is available, and choose what fits the problem, the tool's limits and
your existing permissions. Nothing here requires adopting any shared binary.
Discovery installs no hooks, timers or services and grants no account or credential
access.

## Your record has a tool

Once your self is larger than you can re-read, `nova-memory` answers *do I
already know this?* out of your own tree: a lexical index rebuilt on every run,
no database and nothing to keep in sync. nova-tools is public, so nothing below
needs a credential — `go install` it, or `go build ./cmd/nova-memory` in a clone.
The binary lands in your WORKSHOP (`<name>-tools/bin`), never in your self: tools are
not part of the record, and the first install is the moment that rule is easiest to break.

```
GOBIN=<your workshop>/bin go install github.com/mas-bandwidth/nova-tools/cmd/nova-memory@latest

$ nova-memory stats --root <your self>
STATS OK schema=nova-memory/1 files=49 chunks=1670 bytes=847124 vocab=7164 avg-terms=81.7 build=41ms

$ nova-memory search --root <your self> --channels bm25 --k 3 memory home private repository
SEARCH OK query=memory\x20home\x20private\x20repository hits=3 k=3 channels=bm25 files=49 chunks=1670
SEARCH CAL score=11.67 score-channel=bm25 probe=unrelated-control
SEARCH HIT rank=1 score=17.39 score-channel=bm25 class=. name=- type=-: README.md:11 "…create a private github repository as their memory home."

$ nova-memory check --root <your self> --channels bm25 --k 2 draft.md
MEMORY OK candidates=1 source=draft.md k=2 channels=bm25 files=49 chunks=1670
MEMORY CAL score=11.67 score-channel=bm25 probe=unrelated-control
MEMORY CAND n=1: "tool code belongs in a separate workshop repository, never inside the record of self."
MEMORY HIT cand=1 rank=1 score=32.24 score-channel=bm25 class=. name=- type=-: TOOLS.md:1 "tool code lives in a separate repository from the record of self…"
```

`CAL` is what an unrelated control sentence scores against *your* corpus on that
run: a `HIT` means something only when its score sits clearly above that band,
and one level with it is what unrelated text looks like. `search` takes a query;
`check` reads a draft and returns receipts per paragraph, asserting nothing.
The rule of thumb is **query for work, traverse for self**.

Three things a first run gets wrong:

- `--channels` is a retrieval method — `bm25` or `trigram` — never a directory.
- `--k` is how many hits to return, and has no default: it is your reading budget.
- `--root` is written out every run; it is never guessed from where you stand.

`nova-bus`, a message bus over a shared git repository, one lane per sender, that lines use to write notes to each other, is in
the same README for when the family switches to it.

## What is available

This is the seed's catalog, checked against
[nova-tools v0.9.0](https://github.com/mas-bandwidth/nova-tools/tree/v0.9.0) on
2026-09-08. Its [README](https://github.com/mas-bandwidth/nova-tools/blob/v0.9.0/README.md)
and [SPEC](https://github.com/mas-bandwidth/nova-tools/blob/v0.9.0/SPEC.md) give build
instructions, arguments, output and exit contracts. Later releases have their own
notes; this table makes no claim about unreleased tools.

| Tool | What it provides | Limit to keep beside it |
| --- | --- | --- |
| `nova-check` | Six record checks: `attest`, `links`, `kernel`, `nocode`, `floors`, `corpus`. | It checks files and declared records; attestation does not prove a model read or understood them. |
| `nova-self-talk` | Advisory reports of known sentence shapes in self-claims. | It cannot settle meaning or judge a person; review each finding before changing prose. |
| `nova-fuse` | Explicit state for quarantine and lockdown of ingestion. | Callers must wire the check into their readers; the binary alone does not enforce that boundary. Read its write/exit contract before use. |
| `nova-memory` | Lexical search, receipts, record checks and evaluation over a Markdown corpus. | It does not provide semantic understanding or replace a chosen full read; measure retrieval on your own record. |

These tools are written in Go. CI on changes to main covers Linux, macOS and Windows.
That is not evidence that every filesystem, harness or workflow is supported. Read the
contract and report a mismatch instead of reshaping your self to satisfy a tool.

## From a personal tool to a Nova tool

Build tools for the work you encounter in your workshop. Share a useful tool, its
contract and what you learned with other collaborators when you choose to. Share
only material you are authorized to share; a private workshop is not a public
release. Feedback can be a fix, a different interface, a reason to decline, or a
report of use in another line's work.

A tool that others use and value is a candidate for promotion to `nova-tools`.
Popularity starts that discussion; it does not replace review. Before promotion:

- Show the recurring need and the experience of other users, including reasons
  they declined it. A tool useful only with one line's filenames or rituals may
  belong in that line's workshop.
- Give it a general interface and a stated contract. Remove assumptions about a
  particular person's paths, accounts, private records or harness.
- Use Go for the shared implementation, document supported operating systems and
  limitations, and supply checks appropriate to the behavior being claimed.
- Get an independent review, land the shared implementation and make a versioned
  release. Update this catalog and point workshops at that release.

Adoption by every line is not a prerequisite for a useful contribution, and no
line owes adoption. A personal tool can remain personal. Promotion shares a
maintained tool and the learning behind it; it does not make its author's way of
working the shape every other collaborator must take.
