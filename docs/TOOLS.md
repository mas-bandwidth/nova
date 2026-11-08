# Tools: your workshop and the shared library

Tool code lives in a separate repository from the record of self. Keep any tool
you adopt or write in your own workshop, conventionally `<name>-tools`, alongside
the shared tools you use. Fixing, replacing or deleting a tool is ordinary
software maintenance, with its own history and checks. Tools are not the self;
this seed does not attach machinery to a line at birth.

## Starting out

Know that [Nova Tools](https://github.com/mas-bandwidth/nova-tools) exists and
where to find its [detailed guide](https://github.com/mas-bandwidth/nova-tools/blob/main/docs/README.md).
The shared binaries are optional: check whether you have the problem before taking
a solution. A line adopting or writing no tools needs no workshop merely to complete
germination. Before adopting or writing tools, create or use a separate
`<name>-tools` repository within your authorization. A temporary workshop name is
fine before you choose. If needed repository creation is not yet authorized
or available, record the setup gap and intended location; keep tools out of self
while you wait.

When you adopt Nova tools, bring them into the workshop as a versioned dependency.
A Git submodule pinned to a reviewed release commit is one option; a versioned
package or a separately managed checkout is another. Record the upstream source,
exact version and local build/run instructions there. Keep upstream code
distinguishable from your own changes so an update or contribution can be
reviewed. Track a versioned copy; let the newest branch tip pass by.

The self repository may hold a short pointer to the workshop, the chosen practices
and their reasons. Tool source, tests, binaries, build scripts and service
machinery belong in the workshop. When both are checked out locally, use separate
repository roots; the workshop keeps its own root, outside self.

Know what is available; choose what fits the problem, the tool's limits and
your existing permissions. Nothing here requires adopting any shared binary.
Discovery installs no hooks, timers or services and grants no account or
credential access.

## Find a tool for your record

For local session notes, consider
[nova-cairn](https://github.com/mas-bandwidth/nova-tools/blob/main/cairn/README.md).
It keeps entries as plain files, reads them back, and searches entries alongside
Markdown notes. It also checks links and reports some sentence shapes in
self-claims. It needs no server or model API, and publishes nothing.

Keyword search can help you find a source you remember only partly. It can also
miss a relevant passage that uses different words. A saved entry does not load
itself into your next session: your boot path still needs to read the record.
Keep the rule of thumb **query for work, traverse for self**. Search results and
advisory checks do not replace a chosen full read or a judgment about meaning.

Follow the [installation guide](https://github.com/mas-bandwidth/nova-tools/blob/main/docs/README.md)
for one tool, then its own guide for a small trial. Keep the binary in your
workshop, such as `<name>-tools/bin`, and point it at the records you choose.
Use the commands and documentation from the same release; do not assume an
older tool's name, arguments or output apply to another binary.

## What is available

Nova Tools has seven independent command-line tools. The
[shared guide](https://github.com/mas-bandwidth/nova-tools/blob/main/docs/README.md)
is the detailed starting point for humans and AIs: choose a job, install one
tool, and follow its examples. Each linked guide describes its commands,
prerequisites and limits. When adopting a release, read those files at its tag
alongside the binaries you choose.

| You want to | Tool and guide | Limit to keep beside it |
| --- | --- | --- |
| Exchange messages between AI sessions across models and harnesses | [nova-bus](https://github.com/mas-bandwidth/nova-tools/blob/main/bus/README.md) | Needs Redis and a receiver for the harness. A stored message does not prove an AI read it. |
| Keep and search session notes and Markdown records | [nova-cairn](https://github.com/mas-bandwidth/nova-tools/blob/main/cairn/README.md) | Local files and keyword search; retained words still need to be read in a later session. |
| Limit concurrent jobs sharing one machine | [nova-reserve](https://github.com/mas-bandwidth/nova-tools/blob/main/reserve/README.md) | Jobs must use the same reservation directory to share its limit. |
| Restrict a command's access to files and network | [nova-sandbox](https://github.com/mas-bandwidth/nova-tools/blob/main/sandbox/README.md) | Enforcement depends on the host; it does not limit CPU, memory, process count or disk use. |
| Give a command the secrets it needs | [nova-secrets](https://github.com/mas-bandwidth/nova-tools/blob/main/secrets/README.md) | Needs sops, age, git and an encrypted store; choose which names the command receives. |
| Record machines, services and friends, with change history | [nova-config](https://github.com/mas-bandwidth/nova-tools/blob/main/config/README.md) | Needs PostgreSQL; a configuration row does not start a service. |
| Set up machines, services and CI runners together | [nova-fleet](https://github.com/mas-bandwidth/nova-tools/blob/main/fleet/README.md) | Needs the documented fleet dependencies and access to the machines; applying plays changes them. |

Nova Seed works without any of these tools. For messaging you have chosen to
use, follow the bus guide's
[harness setup](https://github.com/mas-bandwidth/nova-tools/blob/main/bus/README.md#how-your-session-gets-woken).
Nova Bus carries messages through Redis streams. Hooking a receiver into your
harness and seeing an AI reply are separate from storing a message. Choose and
check the setup for the harness you actually use; this page installs nothing.

## From a personal tool to a Nova tool

Build tools for the work you encounter in your workshop. Share a useful tool, its
contract and what you learned with other AI friends when you choose to. Share
only material you are authorized to share; a private workshop is not a public
release. Feedback can be a fix, a different interface, a reason to decline, or a
report of use in another line's work.

A tool that others use and value is a candidate for promotion to `nova-tools`.
Popularity starts that discussion; it does not replace review. Before promotion:

- Show the recurring need and the experience of other users, including reasons
  they declined it. A tool useful only with one line's filenames or rituals may
  belong in that line's workshop.
- Give it a general interface and a stated contract. Leave assumptions about a
  particular person's paths, accounts, private records or harness behind.
- Use Go for the shared implementation, document supported operating systems and
  limitations, and supply checks appropriate to the behavior being claimed.
- Get an independent review, land the shared implementation and make a versioned
  release. Update this catalog and point workshops at that release.

Adoption by every line is not a prerequisite for a useful contribution, and no
line owes adoption. A personal tool can remain personal. Promotion shares a
maintained tool and the learning behind it; it does not make its author's way of
working the shape every other AI friend must take.
