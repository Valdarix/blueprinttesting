# Architecture — Foundation MDT

## System Overview

Foundation MDT is a FiveM resource with three layers: a React NUI frontend, Lua client scripts, and Lua server scripts backed by MySQL. A plugin/bridge system abstracts third-party resource integrations.

```
┌─────────────────────────────────────────────────────────┐
│                    FiveM Client                         │
│  ┌──────────────┐    NUI Messages    ┌───────────────┐  │
│  │  React NUI    │◄─────────────────►│ Client Lua    │  │
│  │  (Browser UI) │  fetchNui/events  │ (Game Logic)  │  │
│  └──────────────┘                    └───────┬───────┘  │
└──────────────────────────────────────────────┼──────────┘
                                               │ TriggerServerEvent
                                               │ TriggerClientEvent
┌──────────────────────────────────────────────┼──────────┐
│                    FiveM Server                         │
│  ┌───────────────┐    Bridge Layer    ┌──────────────┐  │
│  │  Server Lua    │◄─────────────────►│   Plugins    │  │
│  │  (Business     │                   │ (Dispatch,   │  │
│  │   Logic)       │                   │  Prison,     │  │
│  └───────┬───────┘                   │  Phone, etc) │  │
│          │                            └──────────────┘  │
│          │ OxMySQL                                       │
│  ┌───────▼───────┐                                      │
│  │    MySQL       │                                      │
│  │   Database     │                                      │
│  └───────────────┘                                      │
└─────────────────────────────────────────────────────────┘
```

## Directory Structure

```
foundation-mdt/
├── fxmanifest.lua              # Resource manifest
├── config/
│   ├── config.lua              # Main configuration
│   ├── departments.lua         # Department definitions
│   ├── penalcodes.lua          # Penal code database
│   ├── permissions.lua         # Grade-based permission mappings
│   └── images.lua              # Image upload provider config
├── client/
│   ├── main.lua                # Client entry, NUI control, keybinds
│   ├── nui.lua                 # NUI message handlers (SendNUIMessage)
│   └── utils.lua               # Client-side utilities
├── server/
│   ├── main.lua                # Server entry, event registration
│   ├── callbacks.lua           # NUI callback handlers
│   ├── modules/
│   │   ├── profiles.lua        # Citizen profile CRUD
│   │   ├── warrants.lua        # Warrant management
│   │   ├── reports.lua         # Incident reports
│   │   ├── bolos.lua           # BOLO management
│   │   ├── vehicles.lua        # Vehicle lookups
│   │   ├── units.lua           # Unit/officer management
│   │   ├── dispatch.lua        # 911 call handling
│   │   ├── evidence.lua        # Mugshots/evidence photos
│   │   ├── penalcodes.lua      # Penal code queries
│   │   └── roster.lua          # Department roster management
│   └── utils.lua               # Server-side utilities
├── shared/
│   ├── config.lua              # Shared configuration loader
│   └── utils.lua               # Shared utility functions
├── bridge/
│   ├── loader.lua              # Auto-detection and bridge loading
│   ├── dispatch/
│   │   ├── ps-dispatch.lua     # PS Dispatch integration
│   │   └── cd-dispatch.lua     # CD Dispatch integration
│   ├── prison/
│   │   ├── qb-prison.lua       # QB Prison integration
│   │   └── xt-prison.lua       # XT Prison integration
│   ├── phone/
│   │   ├── qb-phone.lua        # QB Phone integration
│   │   └── lb-phone.lua        # LB Phone integration
│   └── notify/
│       ├── qb-notify.lua       # QBCore notification integration
│       └── ox-lib.lua          # ox_lib notification integration
├── sql/
│   └── foundation_mdt.sql      # Database schema
├── web/                        # React NUI application
│   ├── src/
│   │   ├── main.tsx            # React entry point
│   │   ├── App.tsx             # Root component with router
│   │   ├── components/
│   │   │   ├── layout/         # Shell, sidebar, header
│   │   │   ├── profiles/       # Citizen profile components
│   │   │   ├── warrants/       # Warrant components
│   │   │   ├── reports/        # Report components
│   │   │   ├── bolos/          # BOLO components
│   │   │   ├── vehicles/       # Vehicle lookup components
│   │   │   ├── units/          # Unit management components
│   │   │   ├── dispatch/       # Dispatch/911 components
│   │   │   ├── evidence/       # Evidence/mugshot components
│   │   │   ├── penalcodes/     # Penal code components
│   │   │   ├── roster/         # Roster/department components
│   │   │   └── ui/             # shadcn/ui base components
│   │   ├── hooks/
│   │   │   ├── useNuiEvent.ts  # Listen for Lua→React messages
│   │   │   └── useNui.ts       # NUI state management
│   │   ├── utils/
│   │   │   ├── fetchNui.ts     # React→Lua NUI callback wrapper
│   │   │   └── misc.ts         # Utility functions
│   │   ├── stores/
│   │   │   └── useStore.ts     # Zustand global state
│   │   ├── types/
│   │   │   └── index.ts        # Shared TypeScript types
│   │   └── styles/
│   │       └── index.css       # Tailwind imports + globals
│   ├── index.html
│   ├── vite.config.ts
│   ├── tailwind.config.js
│   ├── tsconfig.json
│   └── package.json
└── docs/                       # Project documentation
```

## Core Modules

### NUI Frontend (web/)

- **Location:** `web/src/`
- **Responsibility:** Render the MDT interface, handle user interactions, communicate with Lua
- **Key interfaces:** `fetchNui(event, data)` sends requests to Lua callbacks; `useNuiEvent(action, handler)` receives messages from Lua
- **Dependencies:** React, React Router, Zustand, Tailwind CSS, shadcn/ui

### Client Scripts (client/)

- **Location:** `client/`
- **Responsibility:** Manage NUI visibility/focus, handle keybinds, relay data between NUI and server
- **Key interfaces:** `SetNuiFocus(hasFocus, hasCursor)` for cursor control; `RegisterNUICallback` for receiving NUI requests; `SendNUIMessage` for pushing data to React
- **Dependencies:** QBCore client exports

### Server Scripts (server/)

- **Location:** `server/modules/`
- **Responsibility:** Business logic, database operations, permission checks, data validation
- **Key interfaces:** Server events triggered by client; OxMySQL for database queries
- **Dependencies:** QBCore server exports, OxMySQL

### Bridge System (bridge/)

- **Location:** `bridge/`
- **Responsibility:** Detect and load integrations for third-party resources
- **Key interfaces:** `Bridge.Dispatch.SendAlert()`, `Bridge.Prison.SendToJail()`, `Bridge.Phone.SendNotification()`, `Bridge.Notify.Send()`
- **Dependencies:** Auto-detected via `GetResourceState()`

### Configuration (config/)

- **Location:** `config/`
- **Responsibility:** Server-owner customization — departments, penal codes, permissions, image providers
- **Key interfaces:** Lua tables loaded at resource start

## Data Flow

### MDT Open Flow
1. Player presses keybind (F11) → client `main.lua` receives input
2. Client checks if player has a police job via QBCore
3. Client calls `SetNuiFocus(true, true)` and sends `SendNUIMessage({ action = 'open' })`
4. React NUI receives message via `useNuiEvent('open')`, renders the MDT

### Search Citizen Flow
1. User types name in React search bar, submits
2. React calls `fetchNui('searchCitizen', { query = 'John' })`
3. Client receives via `RegisterNUICallback('searchCitizen')`, forwards to server
4. Server queries MySQL via OxMySQL, filters by permissions
5. Server sends results back to client, client sends to NUI
6. React renders search results

### Bridge Auto-Detection Flow
1. On resource start, `bridge/loader.lua` runs
2. For each bridge category (dispatch, prison, phone, notify):
   - Calls `GetResourceState('resource-name')` for each supported resource
   - If state is `'started'`, loads that bridge file
   - Falls back to a no-op stub if no supported resource is found
3. All MDT code calls bridge functions (e.g., `Bridge.Dispatch.SendAlert()`) — the bridge routes to the correct implementation

## Design Patterns

- **Bridge/Adapter Pattern** — Abstracts third-party resource APIs behind a unified interface. Each bridge file implements the same function signatures. Auto-detection via `GetResourceState()` selects the active implementation.
- **Module Pattern** — Server logic is split into focused modules (profiles, warrants, reports, etc.) loaded via `fxmanifest.lua` script globs.
- **NUI Callback Pattern** — Bidirectional communication: React uses `fetchNui` (HTTP POST to `https://resourceName/event`), Lua uses `SendNUIMessage` (window.postMessage).
- **Config-Driven Design** — Departments, penal codes, permissions, and integrations are all configurable via Lua tables, enabling server owners to customize without touching code.

## External Dependencies

| Dependency | Purpose | Why Chosen |
|-----------|---------|------------|
| QBCore | Framework — player data, jobs, permissions | Most popular FiveM RP framework |
| OxMySQL | Async MySQL driver | Modern, performant, widely adopted |
| PS Dispatch / CD Dispatch | 911 dispatch integration | Most popular dispatch resources |
| QB Prison / XT Prison | Jail system integration | Common prison resources |
| QB Phone / LB Phone | Phone notification integration | Top phone resources |
| QB Notify / ox_lib | In-game notifications | Standard notification systems |

## Deployment Architecture

Foundation MDT is deployed as a FiveM server resource:

- **Resource folder:** `resources/[foundation]/foundation-mdt/`
- **Database:** MySQL tables created via `sql/foundation_mdt.sql`
- **NUI:** Pre-built React app in `web/dist/` (or build on deployment)
- **Config:** Server owners edit `config/*.lua` files
- **Distribution:** Tebex storefront with CFX Asset Escrow for server-side code protection
- **Updates:** New versions distributed via Tebex, server owners replace resource files
