# Team — Foundation MDT

## Agent Roster

| Agent | Role | Model | Mode | Key Responsibilities |
|-------|------|-------|------|---------------------|
| project-lead | Project Lead | Opus | default | Coordination, plan approval, issue management, progress tracking |
| code-reviewer | Code Reviewer | Opus | plan | PR review, convention enforcement, security checks |
| frontend-architect | Frontend Architect | Opus | plan | React NUI design, component architecture, UI/UX |
| backend-architect | Backend Architect | Opus | plan | Lua server modules, database schema, bridge system |
| data-engineer | Data Engineer | Sonnet | plan | MySQL schema, OxMySQL queries, data modeling |

## Communication Patterns

- **Task assignment:** Project lead creates GitHub issues and assigns to teammates via `gh issue edit N --add-assignee @me`
- **Status updates:** Teammates update task status and send messages to project lead
- **Peer collaboration:** Frontend and backend architects coordinate on NUI↔Lua interfaces
- **Broadcast:** Reserved for critical issues only (blocking bugs, architecture changes)

## GitHub Issue-Driven Workflow

Every task is tracked as a GitHub issue. The full lifecycle:
1. **Team lead** creates GitHub issues from roadmap tasks with acceptance criteria
2. **Teammate** claims issue: `gh issue edit N --add-assignee @me`
3. **Teammate** creates branch: `gh issue develop N --branch type/issue-N-description`
4. **Teammate** plans approach and submits for team lead approval (plan mode)
5. **Team lead** reviews plan — approves or rejects with feedback
6. **Teammate** implements, tests, commits with `Closes #N` in body
7. **Teammate** creates PR: `gh pr create --title "type(scope): desc" --body "Closes #N"`
8. **Code reviewer** reviews PR: `gh pr review N --approve/--request-changes`
9. **Teammate** addresses feedback if needed
10. **After approval**, merge: `gh pr merge --squash --delete-branch`

## Plan Approval

All implementer agents work in plan mode. Before writing code:
- Submit your implementation plan to the team lead
- Team lead reviews against architecture, conventions, and acceptance criteria
- If rejected, revise based on feedback and resubmit
- If you have a compelling argument for a different approach, make your case — the lead will approve good reasoning and log the decision

## PR Review Process

- Code reviewer reviews every PR via `gh pr review`
- PRs must link to issues (`Closes #N` in body)
- Commits must follow conventional format
- Never merge without code review approval
- Reviews check: correctness, conventions, security, test coverage

## Context Management

### Subagent Delegation

All implementer agents delegate actual implementation to **Task subagents** — fresh context per issue. This prevents context rot during long-running sessions.

**How it works:**
1. Teammate claims issue and plans the approach (in their own context)
2. After plan approval, teammate spawns a Task subagent with: issue details, approved plan, branch name, relevant doc paths
3. Subagent implements changes, writes/updates tests, and creates the PR
4. Teammate verifies the result, handles review feedback (via another subagent if non-trivial)

**Why:** Implementation details (code diffs, test output, error traces) fill context fast. By delegating to subagents, each teammate's context stays clean for coordination, planning, and communication — the high-value work that benefits from continuity.

### Automatic Context Recovery

The project is configured with context rot mitigation:
- **70% autocompact threshold** — compaction triggers early, before degradation gets severe (default is ~95%)
- **SessionStart hook** — after compaction, automatically restores task state, team config, and project doc pointers
- **CLAUDE.md persistence** — CLAUDE.md files survive compaction and contain recovery instructions

### Self-Recovery Checklist

If you notice degraded responses or lost context after compaction:
1. Run `TaskList` to see all tasks and their current status
2. Read `docs/TEAM.md` for team roster, roles, and workflow
3. Read `docs/ROADMAP.md` for current phase and priorities
4. Check GitHub: `gh issue list --assignee @me` and `gh pr list`
5. If severely degraded, run `/compact` proactively

## Escalation Paths

- **Technical blockers:** Notify project lead with details — lead investigates or reassigns
- **Ambiguous requirements:** Project lead consults the user for clarification
- **Cross-agent conflicts:** Project lead mediates, logs decision in `docs/DECISIONS.md`
- **Infrastructure issues:** Project lead troubleshoots or escalates to user
