# Git Workflow

## GitHub Issue-Driven Development
Every code change starts with a GitHub issue. Use the `gh` CLI for all GitHub operations.

## Branch Naming
Branches link to GitHub issues:
- `feat/issue-N-description` — new features
- `fix/issue-N-description` — bug fixes
- `refactor/issue-N-description` — code restructuring
- `docs/issue-N-description` — documentation only

Create branches from issues: `gh issue develop <N> --branch type/issue-N-description`

## Commit Messages
Use conventional commits format with issue references:
- `feat(profiles): add criminal history search`
- `fix(bridge): resolve dispatch detection for cd_dispatch`
- `refactor(nui): extract shared form components`

Include `Closes #N` or `Refs #N` in the commit body.

## Issue Workflow
1. Claim the GitHub issue: `gh issue edit <N> --add-assignee @me`
2. Create a branch from the issue: `gh issue develop <N> --branch type/issue-N-description`
3. Make focused, atomic commits
4. Push branch and create PR: `gh pr create --title "type(scope): description" --body "Closes #N"`
5. Wait for code review
6. Address review feedback
7. Merge after approval: `gh pr merge --squash --delete-branch`

## PR Conventions
- PR title follows conventional commits: `type(scope): description`
- PR body must include `Closes #N` to auto-close the linked issue on merge
- Request review from code-reviewer
- Never push directly to main
- Never merge your own PR without code review

## Co-Author
When Claude assists with commits, include:
```
Co-Authored-By: CornerstoneScripts <support@cornerstonescripts.dev>
```
