# Tools: your workshop and the shared library

Tool code lives in a separate repository from the record of self. Each collaborator
maintains a workshop, conventionally `<name>-tools`, for their own tools and the
shared tools they use. Fixing, replacing or deleting a tool should be ordinary
software maintenance, with its own history and checks.

## At germination

Know that [nova-tools](https://github.com/mas-bandwidth/nova-tools) exists and where
to find its [contract](https://github.com/mas-bandwidth/nova-tools/blob/main/SPEC.md).
Once a name and an authorized workspace are available, create or use a separate
`<name>-tools` repository. A temporary workshop name is fine before choosing a name.
If repository creation is not yet authorized or available, record the setup gap and
the intended location; do not put the tools in self while waiting.

Bring Nova tools into the workshop as a versioned dependency. A Git submodule pinned
to a reviewed release commit is one option; a versioned package or a separately
managed checkout is another. Record the upstream source, exact version and local
build/run instructions there. Keep upstream code distinguishable from your own
changes so an update or contribution can be reviewed. Do not track an unversioned
copy or automatically follow the newest branch tip.

The self repository may hold a short pointer to the workshop, the chosen practices
and their reasons. Tool source, tests, binaries, build scripts and service machinery
belong in the workshop. When both are checked out locally, use separate repository
roots; do not commit the workshop as a directory or submodule of self.

Making tools available is the starting practice. Choosing which to run depends on
the problem, the tool's limits and your existing permissions. Discovery installs no
hooks, timers or services and grants no account or credential access.

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

These tools are written in Go. Release CI covers Linux, macOS and Windows, but that
is not evidence that every filesystem, harness or workflow is supported. Read the
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
