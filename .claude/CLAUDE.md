# Project Instructions

<!-- Project-wide instructions for Claude Code -->
<!-- See: https://code.claude.com/docs/en/memory -->

## Agent Coordination

- Use `TaskList` to see current tasks and assignments
- Use `SendMessage` to communicate with teammates (refer by name)
- Read team config: `~/.claude/teams/{team-name}/config.json`
- Task assignment via `TaskUpdate` with `owner` parameter
- All agents follow the GitHub issue-driven workflow

## Documentation References

| Document | Path | Purpose |
|----------|------|---------|
| Project Overview | docs/PROJECT.md | What this project is and how to get started |
| Architecture | docs/ARCHITECTURE.md | System design, modules, data flow |
| Stack | docs/STACK.md | Technology choices and versions |
| Roadmap | docs/ROADMAP.md | Development phases and task tracking |
| Conventions | docs/CONVENTIONS.md | Code style, git, testing standards |
| Decisions | docs/DECISIONS.md | Architecture decision log |
| Team | docs/TEAM.md | Agent roles and coordination |

## Skills

- `/gh-cli` — GitHub CLI for all GitHub operations (issues, PRs, reviews)
- `/frontend-design` — UI design skill for React NUI components
- `/doc-coauthoring` — Documentation co-authoring workflow
- `/skill-creator` — Create new project-specific skills
- `/web-artifacts-builder` — React/Tailwind/shadcn prototyping

## Team Workflow

- Every code change starts with a GitHub issue
- All implementer agents work in **plan mode** — submit plans for lead approval
- Code reviewer reviews every PR before merge
- Use `gh` CLI for all GitHub operations
- Conventional commits with `Co-Authored-By: CornerstoneScripts <support@cornerstonescripts.dev>`
- Log non-obvious decisions in `docs/DECISIONS.md`

## Context Recovery

This file survives context compaction and serves as the recovery anchor.

**Automatic recovery:** The SessionStart hook (`.claude/hooks/session-start.js`) restores task state, team config, and project context pointers after compaction. You do not need to manually recover this state.

**If you notice degraded responses or lost context:**
1. Run `TaskList` to see all tasks and their current status
2. Read `docs/TEAM.md` for the team roster, roles, and workflow
3. Read `docs/ROADMAP.md` for current phase and priorities
4. Check GitHub: `gh issue list --assignee @me` and `gh pr list`
5. If severely degraded, run `/compact` proactively

**Subagent delegation:** Always delegate implementation work to Task subagents (fresh context per issue). Keep your own context clean for coordination, plan review, and communication. See docs/TEAM.md for the full delegation workflow.
