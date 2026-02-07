# Foundation MDT

> An advanced Mobile Data Terminal (MDT) system for FiveM QBCore police departments.

## Problem Statement

FiveM roleplay servers need robust law enforcement tools that integrate seamlessly with their existing framework. Current MDT solutions are often locked to a single dispatch system, lack extensibility, and break when servers swap out supporting resources. Foundation MDT solves this by providing a fully-featured police MDT with a plugin/bridge architecture that auto-detects and adapts to the server's installed resources.

## Target Users

- **Server owners** running QBCore-based FiveM roleplay servers who need a configurable, commercial-grade MDT.
- **Police department players** who need fast access to citizen profiles, warrants, BOLOs, reports, and unit management during RP scenarios.
- **Server developers** who want to extend or integrate the MDT with custom resources via the plugin/bridge system.

## Key Features

- Citizen profiles with criminal history, licenses, and registered vehicles
- Warrant creation, management, and serving
- Incident report filing with evidence attachments
- BOLO (Be On the Lookout) alerts for persons and vehicles
- Vehicle lookup by plate with registration info and flags
- Active unit management with status tracking and assignments
- Dispatch/911 call viewer with unit assignment
- Mugshot and evidence photo management (Discord webhook / FiveManage)
- Searchable penal code database with configurable fines and jail times
- Department roster with ranks, certifications, and role management
- Multi-department support (LSPD, BCSO, SASP, etc.) via QBCore jobs/grades
- Plugin/bridge architecture for auto-detecting and integrating with third-party resources

## Getting Started

### Prerequisites

- FiveM server with QBCore framework
- OxMySQL resource installed and configured
- Node.js 18+ (for building the NUI)
- One of the supported dispatch resources (PS Dispatch or CD Dispatch)
- One of the supported notification resources (QB Notify or ox_lib)

### Quick Setup

```bash
# Clone into your server resources
git clone <repo-url> resources/[foundation]/foundation-mdt

# Install NUI dependencies and build
cd resources/[foundation]/foundation-mdt/web
npm install
npm run build

# Import the database
mysql -u root -p < resources/[foundation]/foundation-mdt/sql/foundation_mdt.sql

# Add to server.cfg
ensure foundation-mdt
```

### Verify It Works

1. Start the server and join as a player with a police job
2. Use the configured keybind (default: F11) to open the MDT
3. Verify the dashboard loads with your department info
4. Run a citizen search to confirm database connectivity

## Documentation

| Document | Purpose |
|----------|---------|
| [ARCHITECTURE.md](./ARCHITECTURE.md) | System design and module responsibilities |
| [STACK.md](./STACK.md) | Technology choices and rationale |
| [ROADMAP.md](./ROADMAP.md) | Development phases and task tracking |
| [CONVENTIONS.md](./CONVENTIONS.md) | Code style, git workflow, testing standards |
| [DECISIONS.md](./DECISIONS.md) | Architecture decision log |
| [TEAM.md](./TEAM.md) | Agent roles and coordination |

## License

Proprietary — Commercial distribution via Tebex/CFX Escrow.
