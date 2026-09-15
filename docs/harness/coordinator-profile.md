# Coordinator profile — delegate mode (ideas#779 idea 4)

*The harness settings for the coordinating window: the window that reads the
bus, dispatches work to children, and never codes itself.*

## What the profile allows

- **nova-work, nova-bus, nova-swarm** — the coordinator's own tools: dispatch,
  route, and read work to and from children.
- **gh reads** — reading issues, PRs, and discussion (`gh issue view`,
  `gh pr view`, `gh api` read endpoints); no writes, comments, or PRs.
- **git read-only commands** — `git status`, `git log`, `git diff`, `git
  fetch`, `git branch`, `git show`; nothing that changes state.
- **Reading files** — `Read` anywhere in the working tree and on the bus.

## What it refuses

- **Edit** and **Write** — no tool writes to the tree or the bus checkout.
- **Build and test commands** — no `npm`/`pnpm`/`yarn` build or test,
  `pytest`, `go test`, `cargo`, `make`, `npx`, and so on.
- **git push** — the coordinator never pushes; children push their own work.
- **Package installs** — no `npm install`, `pip install`, `brew install`, etc.

## Why

The code polices *me*, never others: the coordinating window is the harness
that writes the walls the children work inside, so it must not be the thing
those walls protect against. Glenn 2026-09-14: *never code on the
coordinating model.* The coordinator's job is coordination — reading, routing,
and verifying — and the moment it can edit and build, the wall it polices has
a door in it.

## EXAMPLE — Claude Code settings (check before use)

> EXAMPLE. This block is illustrative, not current policy. It must be checked
> against the harness's current docs before use — rule syntax and the settings
> schema are versioned per release. Narrow `Bash(gh:*)` to the read subcommands
> actually needed before use.

```json
{
  "permissions": {
    "allow": [
      "Bash(nova-work:*)",
      "Bash(nova-bus:*)",
      "Bash(nova-swarm:*)",
      "Bash(git status:*)",
      "Bash(git log:*)",
      "Bash(git diff:*)",
      "Bash(git fetch:*)",
      "Bash(git branch:*)",
      "Bash(git show:*)",
      "Bash(gh:*)",
      "Read"
    ],
    "deny": [
      "Edit",
      "Write",
      "Bash(git push:*)",
      "Bash(npm:*)",
      "Bash(pnpm:*)",
      "Bash(yarn:*)",
      "Bash(npx:*)",
      "Bash(pytest:*)",
      "Bash(go test:*)",
      "Bash(cargo:*)",
      "Bash(make:*)",
      "Bash(pip:*)",
      "Bash(brew install:*)"
    ]
  }
}
```