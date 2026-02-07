# Decision Log — Foundation MDT

Architectural decisions and their rationale. Newest entries first.

| Date | Decision | Context | Rationale |
|------|----------|---------|-----------|
| 2026-02-07 | Bridge/plugin architecture for integrations | Need to support multiple dispatch, prison, phone, and notify resources | Decouples MDT from specific third-party resources; server owners don't need to modify code |
| 2026-02-07 | Auto-detect integrations via GetResourceState | Bridge files need to know which resource is running | FiveM provides `GetResourceState()` natively; avoids manual config for server owners |
| 2026-02-07 | Modular Lua config (main + per-module) | Commercial product needs flexible configuration | One main config + specialized configs per module prevents a single monolithic config file |
| 2026-02-07 | Discord webhooks + FiveManage for images | Need mugshot/evidence photo storage | Both are popular in FiveM; configurable lets server owners choose based on their setup |
| 2026-02-07 | QBCore job/grade system for permissions | Need department-based access control | Native integration avoids custom permission systems; leverages existing server configuration |
| 2026-02-07 | React + Vite for NUI | Need a modern, performant MDT interface | React ecosystem, component reusability, Vite HMR for fast development |
| 2026-02-07 | Tailwind CSS + shadcn/ui for styling | Need modern, clean UI with accessible components | Utility-first CSS + composable component library for consistent design |
| 2026-02-07 | OxMySQL for database access | Need async MySQL queries | Modern, performant, prepared statements, widely adopted in QBCore ecosystem |
| 2026-02-07 | Lua 5.4 for game logic | FiveM supports Lua 5.4 with performance improvements | Better performance, modern Lua features, standard for new FiveM resources |
| 2026-02-07 | Commercial distribution via Tebex + CFX Escrow | Product will be sold to server owners | Industry standard for FiveM script sales; escrow protects server-side code |
| 2026-02-07 | Multi-department support via QBCore jobs | Police departments like LSPD, BCSO, SASP need separate management | QBCore already has per-job configuration; MDT maps jobs to departments |
| 2026-02-07 | Zustand for React state management | Need lightweight global state | Minimal API, no providers/context wrappers, great TypeScript support |

---

## Detailed Entries

### 2026-02-07 — Bridge/Plugin Architecture for Third-Party Integrations

**Context:** Foundation MDT needs to integrate with dispatch, prison, phone, and notification resources. Different servers use different resources (PS Dispatch vs CD Dispatch, QB Prison vs XT Prison, etc.).

**Decision:** Implement a bridge/plugin pattern where each integration category has a subfolder (`bridge/dispatch/`, `bridge/prison/`, etc.) with one Lua file per supported resource. A `loader.lua` auto-detects which resources are running via `GetResourceState()` and loads the appropriate bridge file.

**Alternatives considered:**
- Single config option to select integration — requires manual configuration, error-prone
- Direct API calls throughout codebase — couples MDT to specific resources, breaks when swapped
- External bridge resource (like community_bridge) — adds a dependency, less control over API surface

**Rationale:** Auto-detection eliminates manual configuration. The bridge pattern means MDT code calls `Bridge.Dispatch.SendAlert()` everywhere — swapping dispatch resources requires zero code changes. New integrations are added by creating a new bridge file without touching existing code.

### 2026-02-07 — Modular Configuration System

**Context:** A commercial MDT with 10+ features needs extensive configuration. A single config file would become unwieldy.

**Decision:** Use a main `config/config.lua` for global settings plus specialized config files: `departments.lua`, `penalcodes.lua`, `permissions.lua`, `images.lua`.

**Alternatives considered:**
- Single `config.lua` — gets too large, hard to navigate
- JSON/YAML config — non-standard for FiveM, harder for server owners
- In-game admin panel — complex to build, not needed for MVP

**Rationale:** Lua configs are the FiveM standard. Modular files let server owners focus on what they need (e.g., only edit penal codes without touching department config). The main config handles global toggles and defaults.

### 2026-02-07 — React + Vite + Tailwind + shadcn/ui for NUI

**Context:** The MDT needs a modern, clean interface with multiple views (profiles, warrants, reports, etc.) and complex interactions.

**Decision:** Use React with Vite for the NUI, styled with Tailwind CSS and shadcn/ui components.

**Alternatives considered:**
- Vue.js — viable but smaller FiveM community adoption for NUI
- Svelte — great performance but less component library ecosystem
- Raw HTML/CSS/JS — too slow for a complex MDT interface

**Rationale:** React has the largest ecosystem, best tooling, and most FiveM NUI community examples. Vite provides fast builds and HMR. Tailwind + shadcn/ui enable rapid development of a polished, accessible interface. The frontend-design skill will ensure high design quality.

### Template for New Entries

```
## [YYYY-MM-DD] Decision Title

**Context:** Why this decision was needed.

**Decision:** What was decided.

**Alternatives considered:**
- Alternative A — tradeoffs
- Alternative B — tradeoffs

**Rationale:** Why this option was chosen over the alternatives.
```
