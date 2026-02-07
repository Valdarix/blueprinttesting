# Documentation

## When to Update Docs
- Changing architecture or adding new patterns → update `docs/ARCHITECTURE.md`
- Adding a significant decision → add entry to `docs/DECISIONS.md`
- Changing setup steps or dependencies → update `docs/PROJECT.md`
- Adding new bridge integrations → update `docs/ARCHITECTURE.md` bridge section
- Modifying config options → update inline comments in config files

## What NOT to Document
- Self-explanatory code — no redundant comments
- Internal implementation details clear from context
- Private Lua functions unless complex algorithm

## Decisions Log
When making a non-obvious architectural or technology choice, add to `docs/DECISIONS.md`:
```
## [DATE] — Title
**Context:** Why this came up
**Decision:** What was chosen
**Alternatives:** What was considered
**Rationale:** Trade-offs accepted
```
