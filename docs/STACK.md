# Technology Stack — Foundation MDT

## Stack Overview

| Category | Technology | Version | Purpose |
|----------|-----------|---------|---------|
| Game Logic | Lua 5.4 | Latest | Client and server-side FiveM scripts |
| Framework | QBCore | Latest | Player data, jobs, grades, permissions |
| NUI Frontend | React | 18+ | In-game browser UI (MDT interface) |
| NUI Build Tool | Vite | 5+ | Fast builds, HMR for development |
| NUI Styling | Tailwind CSS | 3+ | Utility-first CSS framework |
| NUI Components | shadcn/ui | Latest | Accessible, composable React components |
| Database | MySQL | 5.7+ / 8.0 | Persistent storage for MDT data |
| DB Driver | OxMySQL | Latest | Async MySQL queries for FiveM |
| Image Storage | Discord / FiveManage | N/A | Mugshot and evidence photo uploads |
| Language (NUI) | TypeScript | 5+ | Type-safe React development |

## Framework Details

### QBCore

QBCore is the primary framework integration. Foundation MDT uses QBCore's job and grade system for permissions and department assignment. Key integrations:

- `QBCore.Functions.GetPlayer(src)` — retrieve player data server-side
- `QBCore.Functions.GetPlayerData()` — retrieve player data client-side
- Job/grade system for department membership and rank-based permissions
- Shared exports for adding/checking items

### React + Vite NUI

The MDT interface is a React single-page application rendered inside FiveM's NUI (Chromium Embedded Framework). Key patterns:

- **fetchNui** utility for React-to-Lua communication via HTTP POST
- **useNuiEvent** hook for Lua-to-React communication via `window.postMessage`
- **SetNuiFocus(hasFocus, hasCursor)** for cursor/keyboard control
- Vite builds to `web/dist/` with `base: ''` for NUI compatibility
- `ui_page 'web/dist/index.html'` in fxmanifest.lua

### Key Libraries

| Library | Purpose | Why Chosen |
|---------|---------|------------|
| React Router | Client-side routing between MDT views | Standard for React SPAs, tab-based navigation |
| Tailwind CSS | Styling | Rapid UI development, consistent design tokens |
| shadcn/ui | Component library | Accessible, customizable, modern design |
| Lucide React | Icons | Consistent icon set, tree-shakeable |
| Zustand | State management | Lightweight, simple API, no boilerplate |
| React Hook Form | Form handling | Performance-optimized, minimal re-renders |
| Zod | Validation | TypeScript-first schema validation |

## Infrastructure

### Hosting

Foundation MDT runs on FiveM game servers. No external hosting required. The NUI is served locally by the FiveM client. Database queries go through OxMySQL to the server's MySQL instance.

### Image Storage

Configurable via `config/config.lua`:
- **Discord Webhooks** — Upload images to a Discord channel, store the CDN URL
- **FiveManage** — Upload to FiveManage API, store the returned URL

### Commercial Distribution

- **Tebex** for storefront and payment processing
- **CFX Asset Escrow** for code protection (server-side files encrypted, client/NUI open)
- `escrow_ignore` directive in fxmanifest.lua for files that remain unencrypted

## Development Tools

| Tool | Purpose | Config File |
|------|---------|-------------|
| Vite | NUI build/dev server | `web/vite.config.ts` |
| ESLint | TypeScript/React linting | `web/.eslintrc.cjs` |
| Prettier | Code formatting (TS/React) | `web/.prettierrc` |
| TypeScript | Type checking | `web/tsconfig.json` |
| Tailwind CSS | Utility CSS | `web/tailwind.config.js` |
| PostCSS | CSS processing | `web/postcss.config.js` |

## Package Management

- **npm** for NUI (React/TypeScript) dependencies
- Lua dependencies managed via FiveM resource dependencies in `fxmanifest.lua`
- No lockfile strategy needed for Lua — FiveM resources are self-contained

## Version Compatibility

- FiveM server build: Latest recommended (Cerulean manifest)
- QBCore: Latest release from qbcore-framework organization
- Node.js: 18+ required for Vite builds
- MySQL: 5.7+ or 8.0 (OxMySQL handles compatibility)
- Lua 5.4: Enabled via `lua54 'yes'` in fxmanifest.lua
