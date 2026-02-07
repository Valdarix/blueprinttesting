# Interview Trees by Project Type

> Drill-down questions for Phase 1A. Loaded after Round 1 (project type selection).
> Each section has 3 rounds of progressive questioning. Accept shorthand answers throughout (e.g., "next" = Next.js, "ts" = TypeScript, "pg" = PostgreSQL).

## Table of Contents

1. [Web Application](#web-application)
2. [Mobile App](#mobile-app)
3. [Desktop Application](#desktop-application)
4. [Game](#game)
5. [Game Mod](#game-mod)
6. [CLI Tool](#cli-tool)
7. [Library/Package](#librarypackage)
8. [Browser Extension](#browser-extension)
9. [API/Backend Service](#apibackend-service)
10. [AI/ML Project](#aiml-project)

---

## Web Application

### Round 2: Stack & Framework
> Accept shorthand: "next" = Next.js, "react+vite" = React + Vite, "svelte" = SvelteKit, "nuxt" = Nuxt, "astro" = Astro

1. **What subtype of web app?**
   - Options: SPA | SSR/full-stack | Static site | E-commerce
   - Follow-up if E-commerce: Shopify/headless, or custom?

2. **Frontend framework?**
   - Options: Next.js (App Router) | React + Vite | SvelteKit | Nuxt/Vue | Astro | Remix | Other
   - Follow-up if Next.js: App Router or Pages Router?

3. **Language?**
   - Options: TypeScript (recommended) | JavaScript
   - Default: TypeScript

4. **Styling approach?**
   - Options: Tailwind CSS | CSS Modules | styled-components | Sass | vanilla CSS
   - Follow-up: Component library? (shadcn/ui | Radix | MUI | Chakra | none)

5. **Backend / data layer?**
   - Options: Same framework (API routes) | Separate backend | BaaS (Supabase/Firebase) | None (static)
   - Follow-up if separate: Node/Express | Python/FastAPI | Go | Rust | Other

6. **Database?**
   - Options: PostgreSQL | MySQL | SQLite | MongoDB | None
   - Follow-up: ORM? (Prisma | Drizzle | TypeORM | Mongoose | none)

### Round 3: Scope & Features

1. **Authentication needed?**
   - Options: Yes (email/password) | Yes (OAuth/social) | Yes (both) | No
   - Follow-up if yes: Provider? (NextAuth/Auth.js | Clerk | Supabase Auth | Firebase Auth | custom)

2. **What are the 3-5 core features for MVP?**
   - Free-form answer. Ask them to list the must-haves.

3. **What's explicitly NOT in MVP?** (defer list)
   - Free-form answer. Helps set boundaries.

4. **User roles?**
   - Options: Single role | Admin + User | Custom roles/RBAC | No users

5. **Real-time features needed?**
   - Options: None | Notifications | Live updates | Chat/collaboration | Other

### Round 4: Preferences & Constraints

1. **Deployment target?**
   - Options: Vercel | Netlify | AWS | Cloudflare | Docker/self-hosted | Undecided

2. **Monorepo or single project?**
   - Options: Single project | Monorepo (Turborepo) | Monorepo (Nx)

3. **Testing preference?**
   - Options: Vitest | Jest | Playwright (E2E) | Minimal/none
   - Default: Vitest + Playwright

4. **Design style?**
   - Options: Minimal/clean | Bold/colorful | Corporate/professional | Dashboard-heavy | Custom (describe)

5. **Solo dev or team?**
   - Options: Solo | Small team (2-5) | Larger team
   - Follow-up if team: Need CI/CD pipeline config?

---

## Mobile App

### Round 2: Stack & Framework
> Accept shorthand: "rn" = React Native, "flutter" = Flutter, "expo" = Expo

1. **Platform target?**
   - Options: iOS only | Android only | Both (cross-platform)

2. **Framework?**
   - If cross-platform: React Native (Expo) | React Native (bare) | Flutter | Kotlin Multiplatform
   - If iOS: SwiftUI | UIKit
   - If Android: Jetpack Compose | Kotlin + XML

3. **Language?**
   - Cross-platform: TypeScript (RN) | Dart (Flutter) | Kotlin (KMP)
   - iOS: Swift
   - Android: Kotlin

4. **Navigation library?**
   - If RN: Expo Router | React Navigation | Other
   - If Flutter: go_router | Navigator 2.0 | auto_route

5. **State management?**
   - If RN: Zustand | Redux Toolkit | Jotai | React Context
   - If Flutter: Riverpod | BLoC | Provider | GetX

### Round 3: Scope & Features

1. **Backend needed?**
   - Options: Yes (custom API) | BaaS (Supabase/Firebase) | Existing API | Offline-only

2. **Core screens for MVP? (list 3-5)**
   - Free-form answer.

3. **Offline support needed?**
   - Options: No | Cache only | Full offline-first

4. **Push notifications?**
   - Options: Yes | No | Later

5. **Device features needed?**
   - Options: Camera | GPS/Location | Bluetooth | Biometrics | None | Other

### Round 4: Preferences & Constraints

1. **App Store deployment timeline?**
   - Options: ASAP | Within a month | No rush | Internal/TestFlight only

2. **Design system?**
   - Options: Custom design | Follow platform conventions | Use a component kit (NativeBase, Tamagui, etc.)

3. **Testing?**
   - Options: Jest/unit | Detox/Maestro (E2E) | Minimal | Both

4. **Analytics/crash reporting?**
   - Options: Firebase Analytics | Sentry | PostHog | None | Decide later

---

## Desktop Application

### Round 2: Stack & Framework
> Accept shorthand: "electron" = Electron, "tauri" = Tauri

1. **Platform target?**
   - Options: Windows + Mac + Linux | Windows only | Mac only | Windows + Mac

2. **Framework?**
   - Options: Electron | Tauri | Native (Swift/C#/C++) | Other
   - Follow-up if Electron: With React, Vue, or Svelte?
   - Follow-up if Tauri: Frontend framework? (React | SvelteKit | Vue | Solid)

3. **Language?**
   - Electron: TypeScript | JavaScript
   - Tauri: TypeScript (frontend) + Rust (backend)
   - Native: Swift (Mac) | C# (Windows) | C++ (cross-platform)

4. **Needs system tray / menu bar presence?**
   - Options: Yes | No

### Round 3: Scope & Features

1. **What type of desktop app?**
   - Options: Productivity tool | Media/creative | System utility | Data viewer/editor | Other

2. **Core features for MVP? (list 3-5)**
   - Free-form answer.

3. **File system access needed?**
   - Options: Read only | Read/write | Drag-and-drop | Watch directories | None

4. **Local database?**
   - Options: SQLite | LevelDB | JSON files | None

5. **Auto-update mechanism?**
   - Options: Yes (built-in updater) | No | Manual download

### Round 4: Preferences & Constraints

1. **Distribution method?**
   - Options: App store(s) | Direct download / website | Package manager (brew, winget) | Internal

2. **Code signing / notarization?**
   - Options: Yes (have certificates) | Need to set up | Not yet

3. **Window behavior?**
   - Options: Single window | Multi-window | Menu bar / tray app | Combination

4. **Solo dev or team?**
   - Options: Solo | Small team | Larger team

---

## Game

### Round 2: Stack & Framework
> Accept shorthand: "godot" = Godot, "unity" = Unity, "phaser" = Phaser

1. **Game type?**
   - Options: 2D | 3D | Web-based (browser) | Text-based

2. **Engine / framework?**
   - 2D: Godot | Unity 2D | Phaser (web) | PyGame | Love2D | Custom
   - 3D: Godot | Unity | Unreal Engine | Three.js (web) | Bevy (Rust)
   - Web: Phaser | PixiJS | Three.js | Kaboom.js | PlayCanvas

3. **Language?**
   - Godot: GDScript | C#
   - Unity: C#
   - Unreal: C++ | Blueprints
   - Web: TypeScript | JavaScript

4. **Genre?**
   - Options: Platformer | RPG | Puzzle | Shooter | Strategy | Simulation | Roguelike | Other

### Round 3: Scope & Features

1. **Core gameplay loop — describe in 1-2 sentences.**
   - Free-form answer.

2. **Multiplayer?**
   - Options: Single-player only | Local co-op | Online multiplayer | Both

3. **Art style?**
   - Options: Pixel art | Hand-drawn | Low-poly 3D | Realistic 3D | Minimalist/abstract | Placeholder for now

4. **Audio?**
   - Options: Music + SFX | SFX only | None for now

5. **Save system needed?**
   - Options: Yes (local) | Yes (cloud) | No

### Round 4: Preferences & Constraints

1. **Target platform?**
   - Options: PC (Steam) | Web (itch.io / browser) | Mobile | Console | Multiple

2. **Scope — estimated dev time?**
   - Options: Game jam (< 1 week) | Small project (1-3 months) | Medium (3-12 months) | Large

3. **Solo or team?**
   - Options: Solo dev | Small team | Game jam team

4. **Asset pipeline?**
   - Options: Creating own assets | Using free/purchased assets | Placeholder art | Mix

---

## Game Mod

### Round 2: Stack & Framework
> Accept shorthand: engine or game name (e.g., "minecraft" = Minecraft/Java, "unity" = Unity mod)

1. **Which game or engine?**
   - Options: Minecraft (Java) | Minecraft (Bedrock) | Unity game | Godot game | Unreal game | Source engine (Garry's Mod, etc.) | Other
   - Follow-up: Specific game title?

2. **Mod type?**
   - Minecraft Java: Fabric | Forge | Paper plugin | Data pack
   - Minecraft Bedrock: Addon (behavior + resource packs)
   - Unity: BepInEx | MelonLoader | Harmony patching
   - Unreal: Blueprint mod | C++ mod | Pak mod
   - Source: SourceMod | Metamod | VScript
   - Godot: GDExtension | Script mod

3. **Language?**
   - Minecraft Java: Java | Kotlin
   - Unity mods: C#
   - Unreal mods: C++ | Blueprints
   - Source: SourcePawn | Squirrel (VScript)
   - Godot: GDScript | C++ (GDExtension)

### Round 3: Scope & Features

1. **What does the mod do? (1-2 sentences)**
   - Free-form answer.

2. **Mod scope?**
   - Options: Small tweak | New items/blocks/entities | Gameplay overhaul | Total conversion | QoL/utility

3. **Requires new assets?**
   - Options: Yes (textures, models, sounds) | Reuses existing assets | Minimal new assets

4. **Multiplayer / server compatibility?**
   - Options: Client-side only | Server-side only | Both (synced) | Single-player only

5. **Dependencies on other mods?**
   - Options: Standalone | Requires specific mods (list them) | Addon for another mod

### Round 4: Preferences & Constraints

1. **Target game version?**
   - Free-form (e.g., "1.20.4" for Minecraft, "latest stable" for others)

2. **Distribution?**
   - Options: CurseForge | Modrinth | Steam Workshop | Nexus Mods | GitHub releases | Other

3. **Config system?**
   - Options: Config file (TOML/JSON/YAML) | In-game settings | None

4. **Compatibility priority?**
   - Options: Must work with popular mod packs | Standalone is fine | Specific mod compatibility needed

---

## CLI Tool

### Round 2: Stack & Framework
> Accept shorthand: "node" = Node.js, "py" = Python, "rs" = Rust, "go" = Go

1. **CLI complexity?**
   - Options: Simple utility (single command) | Multi-command (subcommands) | TUI (interactive terminal UI)

2. **Language?**
   - Options: Node.js/TypeScript | Python | Rust | Go | Bash/Shell | Other
   - Default suggestion based on complexity: Simple → any, Complex → Rust/Go, TUI → Rust/Go/Python

3. **CLI framework?**
   - Node.js: Commander | yargs | oclif | Clipanion
   - Python: Click | Typer | argparse
   - Rust: clap | structopt
   - Go: cobra | urfave/cli

4. **If TUI: UI library?**
   - Rust: ratatui | cursive
   - Python: textual | rich
   - Node.js: ink | blessed
   - Go: bubbletea | tview

### Round 3: Scope & Features

1. **What does it do? (1-2 sentences)**
   - Free-form answer.

2. **Input sources?**
   - Options: CLI args only | Stdin/pipes | File input | Config file | Interactive prompts | Mix

3. **Output format?**
   - Options: Plain text | JSON | Table | Colored/formatted | Multiple formats

4. **Config file needed?**
   - Options: Yes (TOML) | Yes (YAML) | Yes (JSON) | dotfile in $HOME | None

5. **Does it call external APIs or services?**
   - Options: Yes (which?) | No (local only)

### Round 4: Preferences & Constraints

1. **Distribution method?**
   - Options: npm/pip/cargo publish | Homebrew | Binary releases (GitHub) | System package | Script install

2. **Shell completions?**
   - Options: Yes (bash/zsh/fish) | No | Later

3. **Cross-platform?**
   - Options: Linux + Mac + Windows | Linux + Mac | Linux only | Doesn't matter

4. **Testing approach?**
   - Options: Unit tests | Integration tests (snapshot CLI output) | Both | Minimal

---

## Library/Package

### Round 2: Stack & Framework
> Accept shorthand: "npm" = npm package, "pypi" = PyPI, "crate" = crates.io

1. **Package ecosystem?**
   - Options: npm (TypeScript/JS) | PyPI (Python) | crates.io (Rust) | Go module | Other

2. **Language?**
   - npm: TypeScript (recommended) | JavaScript
   - PyPI: Python
   - crates.io: Rust
   - Go: Go

3. **Build tooling?**
   - npm: tsup | unbuild | rollup | tsc only
   - Python: setuptools | poetry | hatch | flit
   - Rust: cargo (default)
   - Go: go modules (default)

4. **Dual format support needed?** (npm only)
   - Options: ESM only | CJS only | Dual ESM + CJS
   - Default: ESM only (modern)

### Round 3: Scope & Features

1. **What does the library do? (1-2 sentences)**
   - Free-form answer.

2. **API surface — what's the public API?**
   - Free-form. Ask for main functions/classes/exports.

3. **Dependencies?**
   - Options: Zero-dependency | Minimal | Whatever's needed

4. **Tree-shakeable?** (JS only)
   - Options: Yes (recommended) | Not important

5. **Needs async support?**
   - Options: Sync only | Async only | Both

### Round 4: Preferences & Constraints

1. **Documentation strategy?**
   - Options: README only | Docs site (Docusaurus/VitePress/mdBook) | TSDoc/Rustdoc inline | Minimal for now

2. **Testing?**
   - Options: Vitest | Jest | pytest | cargo test | Go test | Comprehensive from start

3. **CI/CD?**
   - Options: GitHub Actions | None for now | Other
   - Follow-up: Auto-publish on release tag?

4. **Semantic versioning?**
   - Options: Yes (start at 0.1.0) | Yes (start at 1.0.0) | Informal

---

## Browser Extension

### Round 2: Stack & Framework
> Accept shorthand: "chrome" = Chrome, "firefox" = Firefox, "both" = cross-browser

1. **Target browser(s)?**
   - Options: Chrome only | Firefox only | Cross-browser (Chrome + Firefox) | Safari included

2. **Manifest version?**
   - Options: Manifest V3 (recommended, required for Chrome) | Manifest V2 (Firefox legacy)
   - Default: MV3

3. **Framework for popup/options UI?**
   - Options: React | Vue | Svelte | Solid | Vanilla JS/HTML
   - Follow-up: Styling? (Tailwind | CSS | Component library)

4. **Build tool?**
   - Options: WXT (recommended) | Plasmo | CRXJS + Vite | Webpack | None (vanilla)

5. **Language?**
   - Options: TypeScript (recommended) | JavaScript

### Round 3: Scope & Features

1. **What does the extension do? (1-2 sentences)**
   - Free-form answer.

2. **Extension components needed?**
   - Options: Popup | Content script | Background worker | Side panel | Options page | DevTools panel
   - Multi-select.

3. **Permissions needed?**
   - Options: ActiveTab | All URLs | Storage | Tabs | Cookies | WebRequest | Other

4. **Storage needed?**
   - Options: chrome.storage.local | chrome.storage.sync | IndexedDB | None

5. **Communicates with external API?**
   - Options: Yes (which?) | No

### Round 4: Preferences & Constraints

1. **Distribution?**
   - Options: Chrome Web Store | Firefox Add-ons | Self-hosted | Sideload only

2. **Content Security Policy concerns?**
   - Options: Default CSP is fine | Need to inject scripts | Need remote code execution

3. **Testing?**
   - Options: Unit tests | E2E (Puppeteer/Playwright) | Manual only | Both

4. **Monetization?**
   - Options: Free | Freemium | Paid | Not decided

---

## API/Backend Service

### Round 2: Stack & Framework
> Accept shorthand: "express" = Express, "fastapi" = FastAPI, "go" = Go net/http

1. **API type?**
   - Options: REST | GraphQL | gRPC | WebSocket/real-time | Hybrid (REST + WebSocket)

2. **Language & framework?**
   - Node.js: Express | Fastify | Hono | NestJS | tRPC
   - Python: FastAPI | Django | Flask | Litestar
   - Go: net/http + chi | Gin | Fiber | Echo
   - Rust: Axum | Actix-web | Rocket
   - Other

3. **Database?**
   - Options: PostgreSQL | MySQL | SQLite | MongoDB | Redis | DynamoDB | None
   - Follow-up: ORM/query builder? (Prisma | Drizzle | SQLAlchemy | GORM | Diesel | none)

4. **Language?**
   - Options: TypeScript | Python | Go | Rust | Java/Kotlin | Other

### Round 3: Scope & Features

1. **Core endpoints/resources for MVP? (list 3-5)**
   - Free-form answer.

2. **Authentication?**
   - Options: JWT | Session-based | API keys | OAuth2 | None
   - Follow-up: Auth provider? (self-managed | Auth0 | Clerk | Supabase Auth)

3. **Authorization model?**
   - Options: Simple (admin/user) | RBAC | ABAC | None

4. **File uploads needed?**
   - Options: Yes (S3/R2) | Yes (local) | No

5. **Background jobs / queues?**
   - Options: Yes (BullMQ | Celery | Temporal) | Cron jobs | None

### Round 4: Preferences & Constraints

1. **Deployment target?**
   - Options: Docker | AWS (ECS/Lambda) | Fly.io | Railway | GCP Cloud Run | VPS | Undecided

2. **API documentation?**
   - Options: OpenAPI/Swagger (auto-generated) | GraphQL introspection | Manual docs | None for now

3. **Rate limiting / security?**
   - Options: Yes (built-in) | Reverse proxy handles it | Not yet

4. **Observability?**
   - Options: Structured logging | OpenTelemetry | Sentry | Minimal | Decide later

5. **Containerized from the start?**
   - Options: Yes (Dockerfile included) | No | Docker Compose for local dev

---

## AI/ML Project

### Round 2: Stack & Framework
> Accept shorthand: "torch" = PyTorch, "hf" = Hugging Face, "openai" = OpenAI API

1. **Project subtype?**
   - Options: Model training/fine-tuning | Inference service/API | Data pipeline | AI agent | RAG application

2. **Primary framework?**
   - Training: PyTorch | TensorFlow | JAX | Hugging Face Transformers
   - Inference: vLLM | TGI | Triton | ONNX Runtime | Custom
   - Agent: LangChain | LlamaIndex | CrewAI | Autogen | Custom
   - RAG: LangChain | LlamaIndex | Haystack | Custom
   - Pipeline: Apache Beam | Airflow | Prefect | Dagster | Custom scripts

3. **Language?**
   - Options: Python (default) | Python + Rust | TypeScript (for agent/RAG wrappers) | Other

4. **Model type?**
   - Options: LLM (text) | Vision | Audio/Speech | Multimodal | Tabular/classical ML | Custom architecture
   - Follow-up if LLM: Which model? (OpenAI GPT | Anthropic Claude | Open-source — Llama/Mistral/etc. | Fine-tuned custom)

### Round 3: Scope & Features

1. **What does it do? (1-2 sentences)**
   - Free-form answer.

2. **Data sources?**
   - Options: Public datasets | Private/proprietary data | User-uploaded | API-sourced | Web scraping | Synthetic

3. **Training or inference?**
   - If training: From scratch | Fine-tuning | LoRA/adapter | Transfer learning
   - If inference: Batch | Real-time API | Streaming | Edge/on-device

4. **Vector database needed?** (for RAG/embeddings)
   - Options: Pinecone | Weaviate | Qdrant | ChromaDB | pgvector | None

5. **Evaluation / metrics?**
   - Options: Standard benchmarks | Custom eval suite | Human evaluation | A/B testing | Not yet

### Round 4: Preferences & Constraints

1. **Compute environment?**
   - Options: Local GPU | Cloud GPU (AWS/GCP/Lambda Labs) | CPU only | Serverless (Modal/Replicate) | Undecided

2. **Deployment target?**
   - Options: API endpoint | Gradio/Streamlit demo | Production service | Edge/mobile | Research only

3. **Experiment tracking?**
   - Options: Weights & Biases | MLflow | TensorBoard | None

4. **Budget / cost constraints for API calls or compute?**
   - Options: Free tier only | Moderate budget | No constraints | Need to estimate

5. **Reproducibility requirements?**
   - Options: Strict (seed everything, version data) | Best effort | Not important
