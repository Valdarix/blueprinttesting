# Rules Blueprints

> Templates for `.claude/rules/` files generated in Phase 3C. Select rules based on project type and stack, then fill in templates with project-specific details.
> Rules are markdown files with optional `globs` frontmatter. Claude Code loads them automatically based on the path being worked in.

## Table of Contents

1. [Selection Guide](#selection-guide)
2. [Universal Rules (Always Created)](#universal-rules-always-created)
3. [Frontend Rules](#frontend-rules)
4. [Backend Rules](#backend-rules)
5. [Testing Rules](#testing-rules)
6. [Infrastructure Rules](#infrastructure-rules)

---

## Selection Guide

Use this matrix to determine which rules to create based on the project type and stack detected during the interview phase.

| Rule | Web (React) | Web (Svelte) | Web (Vue) | Mobile (RN) | Desktop | Backend (Python) | Backend (Node) | CLI | Library | Game | AI/ML |
|------|:-----------:|:------------:|:---------:|:------------:|:-------:|:-----------------:|:--------------:|:---:|:-------:|:----:|:-----:|
| git-workflow | yes | yes | yes | yes | yes | yes | yes | yes | yes | yes | yes |
| code-style | yes | yes | yes | yes | yes | yes | yes | yes | yes | yes | yes |
| documentation | yes | yes | yes | yes | yes | yes | yes | yes | yes | yes | yes |
| react-components | yes | | | yes | if Electron+React | | | | | | |
| nextjs-app-router | if Next.js | | | | | | | | | | |
| svelte-components | | yes | | | | | | | | | |
| vue-components | | | yes | | | | | | | | |
| styling | yes | yes | yes | yes | if web UI | | | | | | |
| api-routes | yes | | | | | yes | yes | | | | yes |
| fastapi-routes | | | | | | if FastAPI | | | | | if FastAPI |
| django-views | | | | | | if Django | | | | | |
| express-routes | | | | | | | if Express | | | | |
| database | if DB | if DB | if DB | if DB | if DB | if DB | if DB | | | if DB | if DB |
| unit-tests | yes | yes | yes | yes | yes | yes | yes | yes | yes | yes | yes |
| e2e-tests | yes | yes | yes | yes | | | | | | | |
| python-tests | | | | | | yes | | if Python | if Python | | yes |
| env-config | yes | yes | yes | yes | yes | yes | yes | | | | yes |
| docker | if Docker | if Docker | if Docker | | | if Docker | if Docker | if Docker | | | if Docker |

---

## Universal Rules (Always Created)

These rules are created for every project regardless of type or stack.

### Rule: git-workflow

**File:** `.claude/rules/shared/git-workflow.md`
**Globs:** none — global
**When to create:** Always

**Template:**
```markdown
# Git Workflow

## GitHub Issue-Driven Development
Every code change starts with a GitHub issue. Use the `gh` CLI for all GitHub operations.

## Branch Naming
Branches link to GitHub issues:
- `feat/issue-N-description` — new features
- `fix/issue-N-description` — bug fixes
- `refactor/issue-N-description` — code restructuring
- `docs/issue-N-description` — documentation only
- `test/issue-N-description` — adding or updating tests

Create branches from issues: `gh issue develop <N> --branch type/issue-N-description`

## Commit Messages
Use conventional commits format with issue references:
- `feat(auth): add user registration flow`
- `fix(api): resolve null pointer in auth middleware`
- `refactor(utils): extract validation logic into shared util`

Include `Closes #N` or `Refs #N` in the commit body to link to the GitHub issue.

Include scope when helpful: `feat(auth): add OAuth2 support`

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
Co-Authored-By: {{CO_AUTHOR_LINE}}
```

> **Customization:** Adjust branch prefixes and commit scopes to match team conventions. Add `chore/` prefix if the project uses it.
```

---

### Rule: code-style

**File:** `.claude/rules/shared/code-style.md`
**Globs:** none — global
**When to create:** Always

**Template:**
```markdown
# Code Style

## General
- Follow the project's linter and formatter configuration ({{LINTER}} / {{FORMATTER}})
- Reference `docs/CONVENTIONS.md` for naming and structural conventions
- Keep files under ~300 lines; split when logic is distinct
- Only add comments when the "why" is non-obvious

## Naming
- {{NAMING_CONVENTION_SUMMARY}}
- Files: {{FILE_NAMING}} (e.g., kebab-case for components, snake_case for Python)
- Constants: UPPER_SNAKE_CASE

## Imports
- Group imports: stdlib/builtins → external packages → internal modules → relative imports
- Sort alphabetically within each group
- Use absolute imports from project root where possible

## Formatting
- Let the formatter handle whitespace and line breaks — do not manually format
- Run `{{FORMAT_COMMAND}}` before committing if not auto-configured

> **Customization:** Replace placeholders with project-specific linter/formatter and naming conventions detected during setup.
```

---

### Rule: documentation

**File:** `.claude/rules/shared/documentation.md`
**Globs:** none — global
**When to create:** Always

**Template:**
```markdown
# Documentation

## When to Update Docs
- Changing architecture or adding new patterns → update relevant docs
- Adding a significant decision → add entry to `docs/DECISIONS.md`
- Changing setup steps or dependencies → update `README.md`
- Modifying public API surface → update API docs / JSDoc / docstrings

## What NOT to Document
- Self-explanatory code — no redundant comments
- Internal implementation details that are clear from context
- Private functions (unless complex algorithm)

## Docstrings / JSDoc
- Required for: public API functions, exported utilities, complex algorithms
- Not required for: internal helpers, obvious one-liners, test files
- Format: {{DOCSTRING_FORMAT}} (e.g., JSDoc for TS, Google-style for Python)

## Decisions Log
When making a non-obvious architectural or technology choice, add to `docs/DECISIONS.md`:
```
## {{DATE}} — {{TITLE}}
**Context:** Why this came up
**Decision:** What was chosen
**Alternatives:** What was considered
**Consequences:** Trade-offs accepted
```

> **Customization:** Adjust docstring format and decisions log format to match project language and team preferences.
```

---

## Frontend Rules

### Rule: react-components

**File:** `.claude/rules/frontend/react-components.md`
**Globs:** `src/components/**/*.{tsx,jsx}`
**When to create:** When project uses React (Next.js, Vite+React, Remix, React Native)

**Template:**
```markdown
---
globs: src/components/**/*.{tsx,jsx}
---

# React Components

## Structure Order
1. Imports (external → internal → relative)
2. Type/interface definitions
3. Component function
4. Exports

## Component Guidelines
- Use function components with hooks — no class components
- Define Props interface directly above the component
- Prefer composition and children over deep prop drilling
- Co-locate related files: `Button.tsx`, `Button.test.tsx`, `Button.module.css`

## Accessibility
- Use semantic HTML elements (`button`, `nav`, `main`, not `div` for everything)
- Add `aria-label` to interactive elements without visible text
- Ensure keyboard navigability for all interactive elements
- Test with screen reader basics (alt text, heading hierarchy)

## State
- Local state for UI-only concerns (open/closed, hover)
- Lift state to nearest shared parent when siblings need it
- Use {{STATE_LIBRARY}} for global/cross-cutting state

> **Customization:** Adjust glob pattern if components live in a different directory. Update state library reference.
```

---

### Rule: nextjs-app-router

**File:** `.claude/rules/frontend/nextjs-app-router.md`
**Globs:** `src/app/**/*.{tsx,ts}`
**When to create:** When project uses Next.js with App Router

**Template:**
```markdown
---
globs: src/app/**/*.{tsx,ts}
---

# Next.js App Router

## Server vs Client Components
Default to Server Components. Use `"use client"` only when the component needs:
- Event handlers (onClick, onChange, onSubmit)
- React hooks (useState, useEffect, useContext)
- Browser-only APIs (window, document, localStorage)

## Route Files
Each route group should include:
- `page.tsx` — the route page
- `loading.tsx` — loading UI (Suspense boundary)
- `error.tsx` — error boundary (must be client component)
- `not-found.tsx` — 404 UI (when applicable)
- `layout.tsx` — shared layout (only when route group needs one)

## Data & Mutations
- Fetch data in Server Components — no `useEffect` for data loading
- Use Server Actions for form submissions and mutations
- Revalidate with `revalidatePath` / `revalidateTag` after mutations

## Metadata
Export `metadata` or `generateMetadata` from page/layout files for SEO:
```tsx
export const metadata: Metadata = {
  title: "Page Title",
  description: "Page description",
};
```

> **Customization:** Adjust glob if using `app/` without `src/` prefix. Add project-specific data fetching patterns.
```

---

### Rule: svelte-components

**File:** `.claude/rules/frontend/svelte-components.md`
**Globs:** `src/lib/components/**/*.svelte`
**When to create:** When project uses SvelteKit or Svelte

**Template:**
```markdown
---
globs: src/lib/components/**/*.svelte
---

# Svelte Components

## Svelte 5 Runes Syntax
- Use `$state()` for reactive state declarations
- Use `$derived()` for computed values
- Use `$effect()` for side effects (sparingly — prefer reactive declarations)
- Use `$props()` for component props

## Component Structure
1. `<script>` block (imports, props, state, logic)
2. Markup (HTML template)
3. `<style>` block (scoped styles)

## Props
```svelte
<script>
  let { title, count = 0 } = $props();
</script>
```

## Composition
- Use `{@render children()}` for slot-like content
- Use snippet blocks for named content areas
- Prefer small, composable components over monolithic ones

> **Customization:** Adjust glob pattern if components live elsewhere. If using Svelte 4, replace runes with `export let` and `$:` syntax.
```

---

### Rule: vue-components

**File:** `.claude/rules/frontend/vue-components.md`
**Globs:** `src/components/**/*.vue`
**When to create:** When project uses Vue/Nuxt

**Template:**
```markdown
---
globs: src/components/**/*.vue
---

# Vue Components

## Composition API
Always use `<script setup>` with Composition API:
```vue
<script setup lang="ts">
import { ref, computed } from 'vue';

const props = defineProps<{ title: string }>();
const emit = defineEmits<{ update: [value: string] }>();
</script>
```

## Guidelines
- Type props and emits with TypeScript generics
- Use composables (`use*.ts`) for shared reactive logic
- Keep template logic minimal — extract complex expressions to computed properties
- Use `v-memo` for expensive list renderings

## Structure
1. `<script setup>` (imports, props, emits, state, computed, methods)
2. `<template>` (markup)
3. `<style scoped>` (styles)

> **Customization:** Adjust glob for Nuxt projects (may use `components/` without `src/`). Add Pinia store patterns if applicable.
```

---

### Rule: styling

**File:** `.claude/rules/frontend/styling.md`
**Globs:** `**/*.{css,scss,module.css}`
**When to create:** When project has frontend with CSS/styling

**Template:**
```markdown
---
globs: "**/*.{css,scss,module.css}"
---

# Styling

## Approach: {{STYLING_APPROACH}}
{{STYLING_SPECIFIC_GUIDELINES}}

## Tailwind (if applicable)
- Utility-first: compose classes in markup, extract components for repeated patterns
- Use `@apply` sparingly — only for base element styles in global CSS
- Follow mobile-first responsive design: `base → sm: → md: → lg:`

## CSS Variables
- Define design tokens as CSS custom properties in `:root`
- Name with `--{category}-{property}-{variant}`: `--color-primary-500`, `--space-md`

## Dark Mode
- Use class-based strategy: `.dark` on `<html>` toggles theme
- Define dark variants using Tailwind `dark:` or CSS `[data-theme="dark"]`

## Responsive Design
- Mobile-first breakpoints
- Use relative units (rem, em) over fixed pixels for typography and spacing
- Test at: 320px, 768px, 1024px, 1440px

> **Customization:** Replace {{STYLING_APPROACH}} with the chosen method (Tailwind, CSS Modules, styled-components, etc.).
```

---

## Backend Rules

### Rule: api-routes

**File:** `.claude/rules/backend/api-routes.md`
**Globs:** varies by framework (set during generation)
**When to create:** When project has a backend API layer

**Template:**
```markdown
---
globs: {{API_ROUTES_GLOB}}
---

# API Routes

## RESTful Conventions
- Use plural nouns for resources: `/users`, `/posts`, `/orders`
- HTTP methods: GET (read), POST (create), PUT/PATCH (update), DELETE (remove)
- Nest related resources: `/users/:id/posts`
- Use query params for filtering/pagination: `?page=2&limit=20&status=active`

## Request Handling
- Validate all input at the route boundary — never trust client data
- Return consistent error format:
```json
{ "error": { "code": "VALIDATION_ERROR", "message": "...", "details": [...] } }
```
- Use appropriate HTTP status codes (200, 201, 400, 401, 403, 404, 500)

## Security
- Authenticate before authorizing — check identity, then permissions
- Never expose internal IDs or stack traces in production error responses
- Apply rate limiting to public-facing endpoints

> **Customization:** Set the glob pattern to match your API route directory. Add framework-specific middleware patterns.
```

---

### Rule: fastapi-routes

**File:** `.claude/rules/backend/fastapi-routes.md`
**Globs:** `app/api/**/*.py`
**When to create:** When project uses FastAPI

**Template:**
```markdown
---
globs: "app/api/**/*.py"
---

# FastAPI Routes

## Request/Response Models
- Define Pydantic models for all request bodies and responses
- Use separate models for create, update, and response (e.g., `UserCreate`, `UserUpdate`, `UserResponse`)
- Validate at the model level — let Pydantic handle type coercion and constraints

## Dependencies
- Use `Depends()` for shared logic: auth, DB sessions, pagination
- Keep dependency functions small and single-purpose
- Chain dependencies when logic builds on prior steps

## Path Operations
```python
@router.post("/", response_model=ItemResponse, status_code=201)
async def create_item(
    item: ItemCreate,
    db: AsyncSession = Depends(get_db),
    current_user: User = Depends(get_current_user),
) -> ItemResponse:
```

## Async
- Use `async def` for I/O-bound route handlers
- Use `BackgroundTasks` for operations that don't need to block the response
- Use `def` (sync) only for CPU-bound operations that would block the event loop

> **Customization:** Adjust glob if API routes live under `src/` or a different structure.
```

---

### Rule: django-views

**File:** `.claude/rules/backend/django-views.md`
**Globs:** `**/views.py,**/serializers.py`
**When to create:** When project uses Django/DRF

**Template:**
```markdown
---
globs: "**/views.py,**/serializers.py"
---

# Django / DRF Views

## Serializers
- Use ModelSerializer for standard CRUD
- Separate read and write serializers when input/output shapes differ
- Validate at serializer level with `validate_<field>` or `validate()`

## Views
- Prefer ViewSets for standard CRUD resources
- Use APIView for custom endpoints that don't fit CRUD
- Set `permission_classes` explicitly on every view

## Querysets
- Always use `select_related()` for ForeignKey joins
- Always use `prefetch_related()` for ManyToMany / reverse FK
- Never iterate querysets in templates or serializers without optimization
- Use `.only()` or `.defer()` when you need a subset of fields

## Patterns
```python
class ItemViewSet(ModelViewSet):
    queryset = Item.objects.select_related("owner").all()
    serializer_class = ItemSerializer
    permission_classes = [IsAuthenticated]
    filterset_fields = ["status", "category"]
```

> **Customization:** Add project-specific permission classes and filter backends.
```

---

### Rule: express-routes

**File:** `.claude/rules/backend/express-routes.md`
**Globs:** `src/routes/**/*.ts`
**When to create:** When project uses Express/Fastify/Hono

**Template:**
```markdown
---
globs: src/routes/**/*.ts
---

# Express Routes

## Router Organization
- One router file per resource: `users.router.ts`, `posts.router.ts`
- Mount routers in a central `routes/index.ts`
- Group related middleware with the router it applies to

## Middleware Chain Order
1. Body parsing / content-type
2. Authentication (verify identity)
3. Authorization (check permissions)
4. Validation (check request shape)
5. Route handler (business logic)
6. Error handling (catch-all)

## Validation
- Validate request body, params, and query at the route level
- Use {{VALIDATION_LIBRARY}} (e.g., zod, joi) for schema validation
- Return 400 with structured errors for validation failures

## Error Handling
- Throw typed errors from route handlers
- Catch all errors in a centralized error middleware
- Never send raw error stacks to the client in production

> **Customization:** Adjust glob and validation library. Add project-specific auth middleware patterns.
```

---

### Rule: database

**File:** `.claude/rules/backend/database.md`
**Globs:** varies (set during generation based on ORM)
**When to create:** When project uses a database

**Template:**
```markdown
---
globs: {{DATABASE_GLOB}}
---

# Database

## Migrations
- Name migrations descriptively: `add_user_email_index`, `create_orders_table`
- Never edit a migration that has been applied to shared environments
- Create a new migration to fix issues in prior migrations
- Run migrations in order — never skip or reorder

## Schema Design
- Add indexes for columns used in WHERE, ORDER BY, and JOIN conditions
- Use foreign keys to enforce referential integrity
- Prefer soft delete (`deleted_at` timestamp) for user-facing records
- Use UUIDs for public-facing IDs, auto-increment for internal PKs

## Queries
- Use the ORM ({{ORM_NAME}}) for standard operations
- Drop to raw SQL only for complex queries the ORM handles poorly
- Always paginate list queries — never return unbounded result sets
- Log slow queries in development

## Relationships
- Define relationships explicitly in models
- Eager-load related data when you know it's needed
- Lazy-load when the relationship is optional or rarely accessed

> **Customization:** Set glob to match your ORM files (e.g., `prisma/**` for Prisma, `**/models/**` for Django/SQLAlchemy). Replace ORM name.
```

---

## Testing Rules

### Rule: unit-tests

**File:** `.claude/rules/testing/unit-tests.md`
**Globs:** `**/*.{test,spec}.{ts,tsx,js,jsx,py}`
**When to create:** Always (for projects with code)

**Template:**
```markdown
---
globs: "**/*.{test,spec}.{ts,tsx,js,jsx,py}"
---

# Unit Tests

## Structure
Follow Arrange-Act-Assert (AAA):
```
// Arrange — set up test data and dependencies
// Act — call the function under test
// Assert — verify the result
```

## Naming
- Describe behavior: `should return empty array when no items match`
- Use given/when/then or should patterns
- Group related tests in `describe` blocks by function or feature

## Principles
- One primary assertion per test (related assertions in the same test are fine)
- Test behavior and outcomes, not implementation details
- Mock external dependencies (APIs, databases, file system)
- Do NOT mock internal modules — test them through the public API
- Keep tests independent — no shared mutable state between tests

## Test Data
- Use factories or builders for complex test objects
- Avoid magic numbers/strings — use named constants or descriptive variables
- Keep test data minimal — only include fields relevant to the test

> **Customization:** Adjust glob pattern and add framework-specific testing utilities (e.g., React Testing Library, Vue Test Utils).
```

---

### Rule: e2e-tests

**File:** `.claude/rules/testing/e2e-tests.md`
**Globs:** `**/e2e/**/*,**/cypress/**/*,**/playwright/**/*`
**When to create:** When project has frontend with E2E testing

**Template:**
```markdown
---
globs: "**/e2e/**/*,**/cypress/**/*,**/playwright/**/*"
---

# E2E Tests

## Philosophy
- Test complete user journeys, not individual UI elements
- A single E2E test should cover a realistic user workflow end-to-end
- Keep the number of E2E tests small and focused on critical paths

## Selectors
- Use `data-testid` attributes for test selectors — never rely on CSS classes or element structure
- Keep selectors stable: `[data-testid="submit-button"]` not `.btn-primary`

## Async Operations
- Wait for network requests and state transitions explicitly
- Never use hard-coded `sleep`/`wait` — use framework wait utilities
- Assert on visible UI state, not internal application state

## Test Data
- Set up and tear down test data for each test run
- Use API calls or database seeding for setup — don't rely on UI for data creation
- Tests must be independent and runnable in any order

> **Customization:** Adjust glob for your E2E framework directory. Add project-specific page object patterns if applicable.
```

---

### Rule: python-tests

**File:** `.claude/rules/testing/python-tests.md`
**Globs:** `**/test_*.py,**/*_test.py`
**When to create:** When project uses Python

**Template:**
```markdown
---
globs: "**/test_*.py,**/*_test.py"
---

# Python Tests (pytest)

## Fixtures
- Define shared fixtures in `conftest.py` at appropriate directory levels
- Use `yield` fixtures for setup/teardown patterns
- Scope fixtures appropriately: `function` (default), `class`, `module`, `session`

## Parametrize
Use `@pytest.mark.parametrize` for testing multiple inputs:
```python
@pytest.mark.parametrize("input,expected", [
    ("hello", "HELLO"),
    ("world", "WORLD"),
])
def test_uppercase(input, expected):
    assert uppercase(input) == expected
```

## Test Data
- Use factory functions or `factory_boy` for complex objects
- Keep fixtures close to the tests that use them
- Share only genuinely common fixtures in root `conftest.py`

## Async Tests
- Use `pytest-asyncio` with `@pytest.mark.asyncio` for async test functions
- Use `async` fixtures when setting up async resources

> **Customization:** Add project-specific fixture patterns and any custom pytest plugins being used.
```

---

## Infrastructure Rules

### Rule: env-config

**File:** `.claude/rules/shared/env-config.md`
**Globs:** `.env*,**/config/**`
**When to create:** When project uses environment variables

**Template:**
```markdown
---
globs: ".env*,**/config/**"
---

# Environment Configuration

## Secrets
- NEVER commit secrets, API keys, or credentials to the repository
- All secret values go in `.env` (gitignored) or a secrets manager
- `.env.example` must list every required variable with placeholder values

## Naming
- Use `UPPER_SNAKE_CASE` for all environment variables
- Prefix with service/feature: `DATABASE_URL`, `AUTH_SECRET`, `STRIPE_API_KEY`
- Use `_URL` suffix for connection strings, `_KEY` or `_SECRET` for credentials

## Required vs Optional
- Document which variables are required for the app to start
- Provide sensible defaults for optional variables in code
- Fail fast on missing required variables at startup — not at first use

## .env.example
Keep `.env.example` current. When adding a new env var:
1. Add it to `.env.example` with a descriptive placeholder
2. Document its purpose in a comment above it
3. Update setup instructions if needed

> **Customization:** Add project-specific environment variable prefixes and required variables.
```

---

### Rule: docker

**File:** `.claude/rules/shared/docker.md`
**Globs:** `Dockerfile*,docker-compose*,.dockerignore`
**When to create:** When project uses Docker

**Template:**
```markdown
---
globs: "Dockerfile*,docker-compose*,.dockerignore"
---

# Docker

## Dockerfile
- Use multi-stage builds to separate build and runtime
- Pin base image versions: `node:20-alpine`, not `node:latest`
- Order layers from least to most frequently changed (maximize cache hits)
- Copy dependency files first, install, then copy source code
- Run as non-root user in production stage

## .dockerignore
Keep `.dockerignore` in sync with `.gitignore`. Always exclude:
- `node_modules/` / `__pycache__/` / `target/`
- `.env` files (secrets)
- `.git/` directory
- Test files and documentation

## Docker Compose
- Use named volumes for persistent data
- Define health checks for services
- Use environment variable files (`.env`) for configuration
- Pin service image versions

## Security
- Scan images for vulnerabilities regularly
- Minimize installed packages — use slim/alpine base images
- Never store secrets in the image — use runtime env vars or secrets

> **Customization:** Add project-specific services, port mappings, and volume mounts.
```

---

## How to Use These Blueprints

During Phase 3C, the lead agent should:

1. **Consult the selection guide** — cross-reference detected project type and stack with the matrix
2. **Always create the three universal rules** — git-workflow, code-style, documentation
3. **Select applicable framework rules** — based on the stack chosen in the interview
4. **Fill in placeholders** — replace `{{PLACEHOLDER}}` values with actual project details
5. **Set correct globs** — adjust glob patterns to match the project's actual directory structure
6. **Create rule files** — write each selected rule to `.claude/rules/{category}/{name}.md`

### Placeholder Reference

| Placeholder | Source |
|---|---|
| `{{CO_AUTHOR_LINE}}` | From CLAUDE.md or user config |
| `{{LINTER}}` / `{{FORMATTER}}` | Detected from package.json, pyproject.toml, etc. |
| `{{FORMAT_COMMAND}}` | e.g., `npm run format`, `ruff format .` |
| `{{NAMING_CONVENTION_SUMMARY}}` | From docs/CONVENTIONS.md or interview answers |
| `{{FILE_NAMING}}` | e.g., `kebab-case`, `PascalCase`, `snake_case` |
| `{{DOCSTRING_FORMAT}}` | e.g., `JSDoc`, `Google-style`, `NumPy-style` |
| `{{STATE_LIBRARY}}` | e.g., `Zustand`, `Redux Toolkit`, `Pinia` |
| `{{STYLING_APPROACH}}` | e.g., `Tailwind CSS`, `CSS Modules` |
| `{{STYLING_SPECIFIC_GUIDELINES}}` | Framework-specific styling instructions |
| `{{VALIDATION_LIBRARY}}` | e.g., `zod`, `joi`, `pydantic` |
| `{{API_ROUTES_GLOB}}` | e.g., `src/app/api/**/*.ts`, `app/api/**/*.py` |
| `{{DATABASE_GLOB}}` | e.g., `prisma/**`, `**/models/**/*.py` |
| `{{ORM_NAME}}` | e.g., `Prisma`, `Drizzle`, `SQLAlchemy` |
| `{{DATE}}` | Current date when creating decision entry |
| `{{TITLE}}` | Decision title |
