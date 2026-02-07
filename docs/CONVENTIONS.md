# Conventions — Foundation MDT

## Code Style

### Formatting

**Lua:**
- 4-space indentation
- No semicolons
- Single quotes for strings
- Lines under 120 characters

**TypeScript/React:**
- 2-space indentation
- Semicolons required
- Single quotes for strings
- Prettier for auto-formatting: `npm run format` in `web/`
- ESLint for linting: `npm run lint` in `web/`

### Naming

| Context | Convention | Example |
|---------|-----------|---------|
| Lua variables/functions | camelCase | `playerData`, `getPlayerInfo` |
| Lua constants | UPPER_SNAKE_CASE | `MAX_WARRANTS`, `DEFAULT_DEPARTMENT` |
| Lua event names | `foundation-mdt:scope:action` | `foundation-mdt:server:searchCitizen` |
| NUI callback names | camelCase | `searchCitizen`, `createWarrant` |
| TS/React components | PascalCase | `CitizenProfile`, `WarrantCard` |
| TS variables/functions | camelCase | `isVisible`, `handleSearch` |
| TS types/interfaces | PascalCase | `Citizen`, `WarrantData` |
| CSS classes | Tailwind utilities | `bg-zinc-900 text-white` |
| Config keys | camelCase | `enableDispatch`, `maxResults` |
| Database tables | snake_case, prefixed | `foundation_mdt_warrants` |
| Database columns | snake_case | `citizen_id`, `created_at` |
| Files (Lua) | kebab-case or descriptive | `main.lua`, `ps-dispatch.lua` |
| Files (React) | PascalCase for components | `CitizenProfile.tsx` |
| Files (utils/hooks) | camelCase | `fetchNui.ts`, `useNuiEvent.ts` |

### File Organization

- Co-locate related files: component + types in the same directory
- One React component per file (exception: small sub-components used only by parent)
- Lua modules in `server/modules/` — one file per feature domain
- Bridge implementations in `bridge/{category}/{resource}.lua`
- Config files in `config/` — one file per configuration domain

## Git Workflow

### GitHub Issue-Driven Workflow

All code changes start with a GitHub issue. Use the `gh` CLI for all GitHub operations.

### Branching Strategy

Branches link to GitHub issues:
- `feat/issue-N-description` — new features
- `fix/issue-N-description` — bug fixes
- `refactor/issue-N-description` — code restructuring
- `docs/issue-N-description` — documentation only

Create branches from issues: `gh issue develop <N> --branch type/issue-N-description`

### Commit Messages

Use conventional commits format:
- `feat(profiles): add criminal history search`
- `fix(warrants): resolve duplicate warrant creation`
- `refactor(bridge): extract common bridge utilities`

Include `Closes #N` or `Refs #N` in the commit body.

Always include:
```
Co-Authored-By: CornerstoneScripts <support@cornerstonescripts.dev>
```

### PR Process

1. Claim GitHub issue → create branch → plan approach (get lead approval)
2. Implement changes → write/update tests → commit
3. Create PR: `gh pr create --title "type(scope): description" --body "Closes #N"`
4. Code reviewer reviews via `gh pr review`
5. Address feedback → push fixes
6. After approval: `gh pr merge --squash --delete-branch`

## Component / Module Patterns

### Lua Server Modules

Each module in `server/modules/` follows this pattern:
- Register NUI callbacks at the top
- Validate permissions before any data operation
- Use OxMySQL with parameterized queries (never concatenate SQL)
- Return structured data: `{ success = true, data = ... }` or `{ success = false, message = '...' }`

### Lua Bridge Files

Each bridge file exports functions with identical signatures:
```lua
-- bridge/dispatch/ps-dispatch.lua
Bridge.Dispatch = {}
Bridge.Dispatch.SendAlert = function(data)
    -- PS Dispatch specific implementation
end
```

### React Components

- Function components with hooks — no class components
- Props interface defined directly above the component
- Use `fetchNui` for all server communication
- Use `useNuiEvent` for receiving push data from Lua
- Components under 200 lines — split when larger
- Zustand for cross-component state (active tab, user session, etc.)

### NUI Communication

- React → Lua: `fetchNui('callbackName', { data })` (HTTP POST)
- Lua → React: `SendNUIMessage({ action = 'actionName', data = ... })` (window.postMessage)
- Always return a response from NUI callbacks, even if empty `{}`

## Testing

### What to Test

- **NUI (React):** Component rendering, form validation, state management
- **Lua:** Manual in-game testing (FiveM does not have a standard test framework)
- **Integration:** End-to-end flows tested in a dev server environment

### Naming and Structure

- React test files co-located: `Component.test.tsx` next to `Component.tsx`
- Describe blocks by component name
- Test names describe behavior: `should show error when search returns empty`

### Coverage Targets

- React components: Focus on critical user flows (search, create, edit)
- Lua: Manual testing via in-game commands and debug prints
- No vanity coverage metrics — test what matters

## Documentation Standards

- Update `docs/DECISIONS.md` when making non-obvious architectural choices
- Lua functions that handle NUI callbacks should have a brief comment explaining the expected data shape
- React components do not need JSDoc unless the props interface is complex
- Config files should have inline comments explaining each option

## Error Handling

### Lua

- Wrap database operations in pcall where failure is non-fatal
- Return structured error responses: `{ success = false, message = 'Description' }`
- Log errors with `print('^1[Foundation MDT] Error: ' .. message .. '^0')`
- Never expose internal errors to the NUI — return user-friendly messages

### React

- Use try/catch around `fetchNui` calls
- Display error states in the UI (not just console.error)
- Show loading states during NUI callbacks

## Import Ordering (TypeScript)

1. React and React Router imports
2. External library imports (zustand, react-hook-form, zod)
3. Component imports
4. Hook imports
5. Utility imports
6. Type imports
7. Style imports

Blank line between each group.
