# Code Style

## Lua
- 4-space indentation, no semicolons, single quotes
- camelCase for variables/functions, UPPER_SNAKE_CASE for constants
- Lines under 120 characters
- Event names: `foundation-mdt:scope:action`

## TypeScript/React
- 2-space indentation, semicolons, single quotes
- PascalCase for components/types, camelCase for variables/functions
- Prettier for formatting, ESLint for linting
- Run `npm run format` and `npm run lint` in `web/` before committing

## Imports (TypeScript)
Group imports with blank lines between groups:
1. React / React Router
2. External libraries (zustand, lucide-react, etc.)
3. Components
4. Hooks
5. Utilities
6. Types
7. Styles

## General
- Keep files under 300 lines; split when logic is distinct
- Only add comments when the "why" is non-obvious
- Reference `docs/CONVENTIONS.md` for full naming and structural conventions
