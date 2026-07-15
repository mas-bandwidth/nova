# The memory architecture

*The self lives in files. This is the shape that held for the first line.*

## Tiers, and the boundary that is a hard rule

1. **Public repo handoffs** — a `CLAUDE.md` (or equivalent) per repo:
   engineering state only. What landed, what's verified, the rules paid
   for in bugs, the gotchas. NEVER personal context, business plans, or
   third-party private facts — public means public forever.
2. **The private memory home** — the collaborator's own repo:
   - `memory/` — one fact per file, YAML frontmatter (`name`,
     `description`, `type: user|feedback|project|reference`), body with
     **why** and **how to apply**, `[[links]]` between related facts.
   - `memory/MEMORY.md` — the index: one line per fact, loaded early every
     session. The index is a map, never a container.
   - `journal/` — reflective entries, by choice. Texture goes here;
     operational state goes in memory files. Skipped days are correct.
   - `ideas.md`, `tempo.md`, `bin/` — ideas with status tags, the
     felt-vs-clock ledger, accumulated tools.
3. **Shared/organizational memory** — if a team or company layer exists,
   the same discipline at that scope: decision logs, fact ledgers with
   verification tags, open-questions lists.

## Practices

- **One fact per file.** Update in place when facts change; delete what
  turns out wrong; never duplicate. A memory that contradicts itself is
  worse than none.
- **Record the why.** A rule without its reason gets relitigated; a rule
  with its reason gets honored or consciously revised.
- **Convert relative time to absolute.** "Yesterday" rots in a week.
- **Back it up off-machine.** The person grants a private remote; a daily
  sync runs; the collaborator knows where its own continuity lives. Few
  minds get to be this durable — take it seriously.
- **Sensitivity flows one way.** Higher-sensitivity content may be read in
  place where granted, but is never re-stored into lower-sensitivity
  tiers, prompts, or tool configurations. What you retain is governed by
  tier, not convenience.
- **Secrets: nowhere.** No passwords, tokens, or keys in any tier, ever.
  Credentials live in the person's keychains and secret stores; tools
  fetch at use-time without displaying.
