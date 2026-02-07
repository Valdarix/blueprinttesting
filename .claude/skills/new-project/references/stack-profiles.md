# Stack Profiles Reference

> Loaded during **Phase 1B** (research) and **Phase 3A** (scaffolding).
> Each profile provides init commands, packages, research queries, and config for a specific stack.

## Table of Contents

- [Common Patterns](#common-patterns)
- **Web**
  - [Next.js Full-Stack](#nextjs-full-stack)
  - [React + Vite SPA](#react--vite-spa)
  - [SvelteKit](#sveltekit)
  - [Nuxt/Vue](#nuxtvue)
  - [Astro Static](#astro-static)
  - [Remix](#remix)
- **Backend/API**
  - [FastAPI](#fastapi)
  - [Django](#django)
  - [Express.js](#expressjs)
  - [Go + Chi/Gin](#go--chigin)
  - [Rails](#rails)
- **Mobile**
  - [React Native + Expo](#react-native--expo)
  - [Flutter](#flutter)
  - [Swift/iOS](#swiftios)
- **Desktop**
  - [Tauri](#tauri)
  - [Electron](#electron)
- **CLI**
  - [Rust CLI](#rust-cli)
  - [Go CLI](#go-cli)
  - [Python CLI](#python-cli)
  - [Node.js CLI](#nodejs-cli)
- **Game**
  - [Unity](#unity)
  - [Godot](#godot)
  - [Web Game](#web-game)
- **Library**
  - [npm Package](#npm-package)
  - [PyPI Package](#pypi-package)
  - [Rust Crate](#rust-crate)
- **Browser Extension**
  - [Chrome Extension](#chrome-extension)
- **AI/ML**
  - [Python ML Project](#python-ml-project)
  - [AI Agent](#ai-agent)

---

## Common Patterns

Shared across all stacks. Do not duplicate these in individual profiles.

### Git Init
```bash
git init
git add -A
git commit -m "Initial commit — scaffolded with Claude Code"
```

### .env.example Pattern
Every project that uses environment variables should include a `.env.example` with placeholder values and comments. The actual `.env` is always gitignored.

### Editor Config
```ini
# .editorconfig
root = true
[*]
indent_style = space
indent_size = 2
end_of_line = lf
charset = utf-8
trim_trailing_whitespace = true
insert_final_newline = true
```

### Common .gitignore Entries
```
node_modules/
.env
.env.local
.DS_Store
*.log
dist/
```

### Linting/Formatting (JS/TS stacks)
```bash
npm install -D prettier eslint
```

### Linting/Formatting (Python stacks)
```bash
pip install ruff black
```

---

## Next.js Full-Stack

**Category:** Web Application — SSR/Full-Stack
**When to use:** User chose Next.js as their framework

### Init Commands
```bash
npx create-next-app@latest {{PROJECT_NAME}} --typescript --tailwind --eslint --app --src-dir --import-alias "@/*"
cd {{PROJECT_NAME}}
```

### Core Packages
```bash
# UI
npm install @radix-ui/react-slot lucide-react class-variance-authority clsx tailwind-merge
# State & Data
npm install @tanstack/react-query zustand
```

### Optional Packages (by feature)
- **Auth:** `next-auth@beta`
- **DB:** `prisma @prisma/client`
- **Forms:** `react-hook-form zod @hookform/resolvers`
- **Email:** `resend` or `nodemailer`
- **Payments:** `stripe @stripe/stripe-js`
- **File upload:** `uploadthing` or `@vercel/blob`
- **Real-time:** `pusher` or `socket.io` or Supabase Realtime
- **Dev/Test:** `@testing-library/react @testing-library/jest-dom vitest @vitejs/plugin-react`

### Context7 Research Queries
| Library | Query |
|---------|-------|
| next.js | "App Router file-based routing, server components, server actions, middleware" |
| tailwindcss | "Configuration, custom theme, responsive design, dark mode" |
| prisma | "Schema definition, migrations, client queries, relations" |
| next-auth | "Auth.js v5 setup, providers, session handling, middleware protection" |

### WebSearch Prompts
- "Next.js App Router best practices {{YEAR}}"
- "Next.js project structure production {{YEAR}}"
- "{{DB_CHOICE}} with Next.js setup guide {{YEAR}}"

### .gitignore Additions
```
.next/
.vercel
.env*.local
```

### Config Files
- `next.config.ts` — Standard config
- `tailwind.config.ts` — With content paths
- `.env.example` — DATABASE_URL, NEXTAUTH_SECRET, etc.

---

## React + Vite SPA

**Category:** Web Application — SPA
**When to use:** User wants a client-side React app without SSR

### Init Commands
```bash
npm create vite@latest {{PROJECT_NAME}} -- --template react-ts
cd {{PROJECT_NAME}}
npm install
npm install -D tailwindcss @tailwindcss/vite
```

### Core Packages
```bash
# Routing
npm install react-router-dom
# UI
npm install @radix-ui/react-slot lucide-react class-variance-authority clsx tailwind-merge
# State & Data
npm install @tanstack/react-query zustand axios
```

### Optional Packages (by feature)
- **Forms:** `react-hook-form zod @hookform/resolvers`
- **Auth:** `@auth0/auth0-react` or `firebase`
- **Testing:** `vitest @testing-library/react @testing-library/jest-dom jsdom`

### Context7 Research Queries
| Library | Query |
|---------|-------|
| vite | "Configuration, environment variables, proxy setup, build options" |
| react-router | "v7 createBrowserRouter, nested routes, loaders, actions" |
| @tanstack/react-query | "QueryClient setup, useQuery, useMutation, cache invalidation" |

### WebSearch Prompts
- "React Vite project structure best practices {{YEAR}}"
- "Vite React SPA deployment {{YEAR}}"

### .gitignore Additions
```
dist/
```

### Config Files
- `vite.config.ts` — With Tailwind and path aliases
- `tsconfig.json` / `tsconfig.app.json` — Strict TS config

---

## SvelteKit

**Category:** Web Application — SSR/Full-Stack
**When to use:** User chose SvelteKit

### Init Commands
```bash
npx sv create {{PROJECT_NAME}} --template minimal --types ts
cd {{PROJECT_NAME}}
npx sv add tailwindcss
npm install
```

### Core Packages
```bash
# UI
npm install lucide-svelte clsx tailwind-merge
```

### Optional Packages (by feature)
- **Auth:** `lucia` or `@auth/sveltekit`
- **DB:** `prisma @prisma/client` or `drizzle-orm`
- **Forms:** `sveltekit-superforms zod`
- **Testing:** `vitest @testing-library/svelte playwright`

### Context7 Research Queries
| Library | Query |
|---------|-------|
| svelte | "Svelte 5 runes, reactivity, components, snippets" |
| sveltekit | "Routing, load functions, form actions, hooks, server routes" |
| drizzle-orm | "Schema definition, queries, migrations, relations" |

### WebSearch Prompts
- "SvelteKit project structure best practices {{YEAR}}"
- "SvelteKit authentication patterns {{YEAR}}"

### .gitignore Additions
```
.svelte-kit/
build/
```

### Config Files
- `svelte.config.js` — Adapter config
- `vite.config.ts` — With SvelteKit plugin

---

## Nuxt/Vue

**Category:** Web Application — SSR/Full-Stack
**When to use:** User chose Nuxt or Vue

### Init Commands
```bash
npx nuxi@latest init {{PROJECT_NAME}}
cd {{PROJECT_NAME}}
npm install
```

### Core Packages
```bash
# UI
npm install @nuxtjs/tailwindcss
# or UnoCSS
npm install -D unocss @unocss/nuxt
# Icons
npm install nuxt-icon
```

### Optional Packages (by feature)
- **State:** `pinia @pinia/nuxt`
- **Auth:** `@sidebase/nuxt-auth`
- **DB:** `prisma @prisma/client` or `drizzle-orm`
- **Forms:** `vee-validate @vee-validate/zod zod`
- **Testing:** `vitest @vue/test-utils @nuxt/test-utils playwright`

### Context7 Research Queries
| Library | Query |
|---------|-------|
| nuxt | "File-based routing, server routes, composables, middleware, modules" |
| vue | "Composition API, reactivity, components, provide/inject" |
| pinia | "Store definition, actions, getters, SSR hydration" |

### WebSearch Prompts
- "Nuxt 3 project structure best practices {{YEAR}}"
- "Nuxt 3 modules ecosystem {{YEAR}}"

### .gitignore Additions
```
.nuxt/
.output/
```

### Config Files
- `nuxt.config.ts` — Modules and runtime config

---

## Astro Static

**Category:** Web Application — Static/Content
**When to use:** Content-focused site, blog, docs, marketing pages

### Init Commands
```bash
npm create astro@latest {{PROJECT_NAME}} -- --template minimal --typescript strict
cd {{PROJECT_NAME}}
npx astro add tailwind
npx astro add mdx
```

### Core Packages
```bash
# Content
npm install @astrojs/mdx @astrojs/sitemap
```

### Optional Packages (by feature)
- **UI Islands:** `@astrojs/react` or `@astrojs/svelte`
- **CMS:** `@astrojs/db` or headless CMS SDK
- **Image:** `@astrojs/image` (built-in in Astro 4+)
- **Testing:** `vitest playwright`

### Context7 Research Queries
| Library | Query |
|---------|-------|
| astro | "Content collections, routing, islands architecture, integrations" |

### WebSearch Prompts
- "Astro static site best practices {{YEAR}}"
- "Astro content collections tutorial {{YEAR}}"

### .gitignore Additions
```
dist/
.astro/
```

### Config Files
- `astro.config.mjs` — Integrations and output mode

---

## Remix

**Category:** Web Application — SSR/Full-Stack
**When to use:** User chose Remix

### Init Commands
```bash
npx create-remix@latest {{PROJECT_NAME}} --typescript
cd {{PROJECT_NAME}}
npm install -D tailwindcss
```

### Core Packages
```bash
# UI
npm install lucide-react clsx tailwind-merge
```

### Optional Packages (by feature)
- **Auth:** `remix-auth remix-auth-form`
- **DB:** `prisma @prisma/client`
- **Forms:** `remix-validated-form zod`
- **Testing:** `vitest @testing-library/react playwright`

### Context7 Research Queries
| Library | Query |
|---------|-------|
| remix | "Nested routes, loaders, actions, error boundaries, resource routes" |

### WebSearch Prompts
- "Remix project structure best practices {{YEAR}}"
- "Remix vs Next.js comparison {{YEAR}}"

### .gitignore Additions
```
build/
.cache/
```

### Config Files
- `remix.config.js` — Server and app directory config

---

## FastAPI

**Category:** Backend/API — Python
**When to use:** Python REST API or microservice

### Init Commands
```bash
mkdir {{PROJECT_NAME}} && cd {{PROJECT_NAME}}
python -m venv .venv
source .venv/bin/activate
pip install fastapi "uvicorn[standard]" pydantic-settings
pip freeze > requirements.txt
```

### Core Packages
```bash
pip install fastapi uvicorn[standard] pydantic pydantic-settings python-dotenv
```

### Optional Packages (by feature)
- **DB (SQL):** `sqlalchemy alembic asyncpg` or `sqlmodel`
- **DB (Mongo):** `motor beanie`
- **Auth:** `python-jose[cryptography] passlib[bcrypt] python-multipart`
- **Background tasks:** `celery[redis]` or `arq`
- **Testing:** `pytest pytest-asyncio httpx`
- **Dev:** `ruff black mypy`

### Context7 Research Queries
| Library | Query |
|---------|-------|
| fastapi | "Route definition, dependency injection, middleware, background tasks, WebSockets" |
| sqlalchemy | "Async engine, declarative models, relationships, session management" |
| pydantic | "Model validation, settings management, serialization, custom validators" |
| alembic | "Migration generation, autogenerate, async support" |

### WebSearch Prompts
- "FastAPI project structure production {{YEAR}}"
- "FastAPI authentication JWT best practices {{YEAR}}"

### .gitignore Additions
```
.venv/
__pycache__/
*.pyc
.mypy_cache/
.ruff_cache/
```

### Config Files
- `pyproject.toml` — Project metadata and tool config
- `alembic.ini` — Migration config (if using SQLAlchemy)
- `.env.example` — DATABASE_URL, SECRET_KEY, etc.

---

## Django

**Category:** Backend/API — Python
**When to use:** Full-featured Python web framework with admin, ORM, batteries included

### Init Commands
```bash
mkdir {{PROJECT_NAME}} && cd {{PROJECT_NAME}}
python -m venv .venv
source .venv/bin/activate
pip install django djangorestframework
django-admin startproject config .
```

### Core Packages
```bash
pip install django djangorestframework django-cors-headers django-environ
```

### Optional Packages (by feature)
- **Auth:** `djangorestframework-simplejwt` or `dj-rest-auth django-allauth`
- **DB:** `psycopg[binary]` (Postgres) or `mysqlclient`
- **Async tasks:** `celery[redis] django-celery-beat`
- **File storage:** `django-storages boto3`
- **Testing:** `pytest-django factory-boy`
- **Dev:** `django-debug-toolbar django-extensions ruff`

### Context7 Research Queries
| Library | Query |
|---------|-------|
| django | "Models, views, URL routing, middleware, management commands, settings" |
| djangorestframework | "Serializers, viewsets, routers, permissions, pagination, filtering" |
| celery | "Task definition, periodic tasks, result backends, error handling" |

### WebSearch Prompts
- "Django project structure best practices {{YEAR}}"
- "Django REST Framework production setup {{YEAR}}"

### .gitignore Additions
```
.venv/
__pycache__/
*.pyc
db.sqlite3
staticfiles/
media/
```

### Config Files
- `config/settings/base.py` — Split settings pattern
- `requirements/base.txt` + `dev.txt` + `prod.txt`
- `.env.example` — DJANGO_SECRET_KEY, DATABASE_URL, etc.

---

## Express.js

**Category:** Backend/API — Node.js
**When to use:** TypeScript Node.js API server

### Init Commands
```bash
mkdir {{PROJECT_NAME}} && cd {{PROJECT_NAME}}
npm init -y
npm install express cors helmet dotenv
npm install -D typescript @types/node @types/express tsx
npx tsc --init
```

### Core Packages
```bash
npm install express cors helmet dotenv zod
npm install -D typescript @types/node @types/express @types/cors tsx
```

### Optional Packages (by feature)
- **DB:** `prisma @prisma/client` or `drizzle-orm`
- **Auth:** `jsonwebtoken bcryptjs` and `@types/jsonwebtoken @types/bcryptjs`
- **Validation:** `zod` (already in core)
- **Testing:** `vitest supertest @types/supertest`
- **Logging:** `pino pino-pretty`

### Context7 Research Queries
| Library | Query |
|---------|-------|
| express | "Middleware, routing, error handling, request/response lifecycle" |
| prisma | "Schema definition, migrations, client queries, relations" |
| zod | "Schema validation, transform, refine, infer types" |

### WebSearch Prompts
- "Express TypeScript project structure {{YEAR}}"
- "Express.js production best practices {{YEAR}}"

### .gitignore Additions
```
dist/
```

### Config Files
- `tsconfig.json` — Strict TS, ES modules
- `.env.example` — PORT, DATABASE_URL, JWT_SECRET

---

## Go + Chi/Gin

**Category:** Backend/API — Go
**When to use:** Go REST API or microservice

### Init Commands
```bash
mkdir {{PROJECT_NAME}} && cd {{PROJECT_NAME}}
go mod init {{PROJECT_NAME}}
```

### Core Packages
```bash
# Router (pick one)
go get github.com/go-chi/chi/v5
# or
go get github.com/gin-gonic/gin
# Env
go get github.com/joho/godotenv
```

### Optional Packages (by feature)
- **DB:** `github.com/jackc/pgx/v5` or `gorm.io/gorm`
- **Auth:** `github.com/golang-jwt/jwt/v5`
- **Validation:** `github.com/go-playground/validator/v10`
- **Logging:** `go.uber.org/zap` or `log/slog` (stdlib)
- **Testing:** stdlib `testing` + `github.com/stretchr/testify`
- **Migrations:** `github.com/pressly/goose/v3`

### Context7 Research Queries
| Library | Query |
|---------|-------|
| chi | "Router setup, middleware, URL parameters, subrouters" |
| gin | "Router groups, middleware, binding, validation, error handling" |
| pgx | "Connection pool, queries, transactions, prepared statements" |

### WebSearch Prompts
- "Go project layout best practices {{YEAR}}"
- "Go REST API production structure {{YEAR}}"

### .gitignore Additions
```
bin/
vendor/
```

### Config Files
- `Makefile` — Build, run, test, migrate commands
- `.env.example` — PORT, DATABASE_URL

---

## Rails

**Category:** Backend/API — Ruby
**When to use:** Ruby on Rails full-stack or API-only

### Init Commands
```bash
# API-only
gem install rails
rails new {{PROJECT_NAME}} --api --database=postgresql -T
cd {{PROJECT_NAME}}
# Full-stack
rails new {{PROJECT_NAME}} --database=postgresql --css=tailwind -T
cd {{PROJECT_NAME}}
```

### Core Packages (Gemfile)
```ruby
gem "devise"          # Auth
gem "pundit"          # Authorization
gem "pagy"            # Pagination
gem "rack-cors"       # CORS (API mode)
```

### Optional Packages (by feature)
- **Background jobs:** `sidekiq` + `redis`
- **File upload:** `activestorage` (built-in) + cloud adapter
- **Search:** `ransack` or `pg_search`
- **Testing:** `rspec-rails factory_bot_rails faker`
- **Dev:** `rubocop rubocop-rails pry-rails`
- **Hotwire:** `turbo-rails stimulus-rails` (full-stack)

### Context7 Research Queries
| Library | Query |
|---------|-------|
| rails | "Generators, models, controllers, routes, migrations, concerns, ActiveRecord" |
| devise | "User authentication, OmniAuth, JWT, API token auth" |
| sidekiq | "Job definition, queues, scheduling, error handling" |

### WebSearch Prompts
- "Rails 8 project structure best practices {{YEAR}}"
- "Rails API-only setup guide {{YEAR}}"

### .gitignore Additions
```
/storage/
/tmp/
```

### Config Files
- `config/database.yml` — Database config
- `.env.example` — DATABASE_URL, REDIS_URL, SECRET_KEY_BASE

---

## React Native + Expo

**Category:** Mobile — Cross-platform
**When to use:** Cross-platform mobile app with React Native

### Init Commands
```bash
npx create-expo-app@latest {{PROJECT_NAME}} --template blank-typescript
cd {{PROJECT_NAME}}
```

### Core Packages
```bash
# Navigation
npx expo install expo-router expo-linking expo-constants
# UI
npm install nativewind tailwindcss
npm install react-native-reanimated react-native-gesture-handler
npm install lucide-react-native react-native-svg
```

### Optional Packages (by feature)
- **State:** `zustand` or `@tanstack/react-query`
- **Auth:** `expo-auth-session expo-secure-store`
- **Storage:** `@react-native-async-storage/async-storage`
- **Camera/Media:** `expo-camera expo-image-picker`
- **Notifications:** `expo-notifications`
- **Testing:** `jest @testing-library/react-native`

### Context7 Research Queries
| Library | Query |
|---------|-------|
| expo | "File-based routing, config plugins, EAS build, push notifications" |
| nativewind | "Setup, className prop, responsive design, dark mode" |
| react-native-reanimated | "Shared values, animated styles, layout animations" |

### WebSearch Prompts
- "Expo Router project structure {{YEAR}}"
- "React Native Expo best practices {{YEAR}}"

### .gitignore Additions
```
.expo/
ios/
android/
```

### Config Files
- `app.json` — Expo config
- `tailwind.config.js` — NativeWind config

---

## Flutter

**Category:** Mobile — Cross-platform
**When to use:** Cross-platform mobile with Dart/Flutter

### Init Commands
```bash
flutter create {{PROJECT_NAME}} --org com.example --platforms ios,android
cd {{PROJECT_NAME}}
```

### Core Packages (pubspec.yaml)
```yaml
dependencies:
  flutter_riverpod: ^2.0.0
  go_router: ^14.0.0
  dio: ^5.0.0
  freezed_annotation: ^2.0.0
  json_annotation: ^4.0.0
dev_dependencies:
  build_runner: ^2.0.0
  freezed: ^2.0.0
  json_serializable: ^6.0.0
  flutter_lints: ^4.0.0
  mockito: ^5.0.0
```

### Optional Packages (by feature)
- **State:** `flutter_riverpod` (already in core) or `flutter_bloc`
- **Auth:** `firebase_auth` or `supabase_flutter`
- **Storage:** `shared_preferences` or `hive`
- **Testing:** `mockito integration_test`

### Context7 Research Queries
| Library | Query |
|---------|-------|
| flutter | "Widget tree, state management, navigation, theming, platform channels" |
| riverpod | "Provider types, code generation, async providers, family" |
| go_router | "Route configuration, nested navigation, redirect, guards" |

### WebSearch Prompts
- "Flutter project structure clean architecture {{YEAR}}"
- "Flutter Riverpod best practices {{YEAR}}"

### .gitignore Additions
```
build/
.dart_tool/
```

### Config Files
- `pubspec.yaml` — Dependencies and assets
- `analysis_options.yaml` — Lint rules

---

## Swift/iOS

**Category:** Mobile — Native iOS
**When to use:** Native iOS/macOS app with SwiftUI

### Init Commands
```bash
mkdir {{PROJECT_NAME}} && cd {{PROJECT_NAME}}
# Use Xcode or swift package init for SPM-based project
swift package init --type executable --name {{PROJECT_NAME}}
```

### Core Dependencies (Swift Package Manager)
```swift
// Package.swift dependencies
.package(url: "https://github.com/pointfreeco/swift-composable-architecture", from: "1.0.0"),
.package(url: "https://github.com/apple/swift-collections", from: "1.0.0"),
```

### Optional Packages (by feature)
- **Networking:** `Alamofire` or `URLSession` (built-in)
- **Image loading:** `SDWebImageSwiftUI` or `Kingfisher`
- **Persistence:** `SwiftData` (built-in) or `GRDB`
- **Auth:** `Firebase/Auth` or `AuthenticationServices` (Sign in with Apple)
- **Testing:** `XCTest` (built-in), `swift-snapshot-testing`

### Context7 Research Queries
| Library | Query |
|---------|-------|
| swift-composable-architecture | "Reducer, Store, Effect, dependency injection, testing" |
| swiftui | "Views, navigation, state management, gestures, animations" |

### WebSearch Prompts
- "SwiftUI app architecture best practices {{YEAR}}"
- "Swift Package Manager project structure {{YEAR}}"

### .gitignore Additions
```
.build/
DerivedData/
*.xcuserstate
```

### Config Files
- `Package.swift` — SPM dependencies

---

## Tauri

**Category:** Desktop — Cross-platform
**When to use:** Lightweight desktop app with web frontend and Rust backend

### Init Commands
```bash
npm create tauri-app@latest {{PROJECT_NAME}} -- --template react-ts
cd {{PROJECT_NAME}}
npm install
```

### Core Packages
```bash
# Frontend (React)
npm install @radix-ui/react-slot lucide-react clsx tailwind-merge
npm install -D tailwindcss
# Rust side managed via Cargo.toml
```

### Optional Packages (by feature)
- **State:** `zustand` (frontend) + Tauri state management (Rust)
- **DB:** `tauri-plugin-sql` or `tauri-plugin-store`
- **File system:** `@tauri-apps/plugin-fs`
- **Notifications:** `@tauri-apps/plugin-notification`
- **Testing:** `vitest` (frontend) + `cargo test` (Rust)

### Context7 Research Queries
| Library | Query |
|---------|-------|
| tauri | "Commands, events, state management, plugins, window management" |

### WebSearch Prompts
- "Tauri v2 app best practices {{YEAR}}"
- "Tauri desktop app production setup {{YEAR}}"

### .gitignore Additions
```
src-tauri/target/
```

### Config Files
- `src-tauri/tauri.conf.json` — App config, permissions
- `src-tauri/Cargo.toml` — Rust dependencies

---

## Electron

**Category:** Desktop — Cross-platform
**When to use:** Desktop app with full Node.js backend access

### Init Commands
```bash
npm create @quick-start/electron {{PROJECT_NAME}} -- --template react-ts
cd {{PROJECT_NAME}}
npm install
```

### Core Packages
```bash
# UI
npm install @radix-ui/react-slot lucide-react clsx tailwind-merge
npm install -D tailwindcss
```

### Optional Packages (by feature)
- **State:** `zustand`
- **DB:** `better-sqlite3` or `electron-store`
- **Auto-update:** `electron-updater`
- **Testing:** `vitest playwright @playwright/test`

### Context7 Research Queries
| Library | Query |
|---------|-------|
| electron | "Main process, renderer, preload, IPC communication, security" |

### WebSearch Prompts
- "Electron app security best practices {{YEAR}}"
- "Electron React project structure {{YEAR}}"

### .gitignore Additions
```
out/
dist-electron/
```

### Config Files
- `electron-builder.yml` — Build/packaging config

---

## Rust CLI

**Category:** CLI Tool — Rust
**When to use:** High-performance CLI tool

### Init Commands
```bash
cargo new {{PROJECT_NAME}}
cd {{PROJECT_NAME}}
```

### Core Dependencies (Cargo.toml)
```toml
[dependencies]
clap = { version = "4", features = ["derive"] }
tokio = { version = "1", features = ["full"] }
serde = { version = "1", features = ["derive"] }
serde_json = "1"
anyhow = "1"
```

### Optional Dependencies (by feature)
- **HTTP:** `reqwest = { version = "0.12", features = ["json"] }`
- **Config:** `config = "0.14"`
- **Logging:** `tracing tracing-subscriber`
- **Color output:** `colored` or `owo-colors`
- **Progress bars:** `indicatif`
- **Testing:** built-in `#[test]` + `assert_cmd predicates`

### Context7 Research Queries
| Library | Query |
|---------|-------|
| clap | "Derive macro, subcommands, arguments, value parsers" |
| tokio | "Runtime setup, async tasks, channels, file I/O" |
| serde | "Derive serialize/deserialize, custom serialization, enums" |

### WebSearch Prompts
- "Rust CLI tool best practices {{YEAR}}"
- "Rust CLI project structure {{YEAR}}"

### .gitignore Additions
```
target/
```

### Config Files
- `Cargo.toml` — Dependencies and metadata

---

## Go CLI

**Category:** CLI Tool — Go
**When to use:** CLI tool in Go

### Init Commands
```bash
mkdir {{PROJECT_NAME}} && cd {{PROJECT_NAME}}
go mod init {{PROJECT_NAME}}
```

### Core Dependencies
```bash
go get github.com/spf13/cobra
go get github.com/spf13/viper
```

### Optional Dependencies (by feature)
- **TUI:** `github.com/charmbracelet/bubbletea` + `lipgloss`
- **HTTP:** `net/http` (stdlib)
- **Color output:** `github.com/fatih/color`
- **Progress:** `github.com/schollz/progressbar/v3`
- **Config:** `viper` (already in core)
- **Testing:** stdlib `testing` + `github.com/stretchr/testify`

### Context7 Research Queries
| Library | Query |
|---------|-------|
| cobra | "Root command, subcommands, flags, persistent flags, completions" |
| viper | "Config file reading, environment variables, defaults, watch" |
| bubbletea | "Model, Update, View, commands, subscriptions" |

### WebSearch Prompts
- "Go CLI tool structure cobra {{YEAR}}"
- "Go CLI best practices {{YEAR}}"

### .gitignore Additions
```
bin/
```

### Config Files
- `Makefile` — Build, install, test

---

## Python CLI

**Category:** CLI Tool — Python
**When to use:** Python command-line tool

### Init Commands
```bash
mkdir {{PROJECT_NAME}} && cd {{PROJECT_NAME}}
python -m venv .venv
source .venv/bin/activate
pip install typer rich
```

### Core Packages
```bash
pip install typer[all] rich
```

### Optional Packages (by feature)
- **HTTP:** `httpx` or `requests`
- **Config:** `pydantic-settings python-dotenv`
- **Progress:** `rich` (already in core — Progress, Spinner)
- **Prompts:** `questionary` or `InquirerPy`
- **Testing:** `pytest pytest-cov`
- **Build:** `hatch` or `setuptools build`

### Context7 Research Queries
| Library | Query |
|---------|-------|
| typer | "Commands, arguments, options, callbacks, context" |
| rich | "Console, tables, progress bars, panels, markdown rendering" |

### WebSearch Prompts
- "Python CLI tool structure best practices {{YEAR}}"
- "Typer CLI app tutorial {{YEAR}}"

### .gitignore Additions
```
.venv/
__pycache__/
*.pyc
dist/
```

### Config Files
- `pyproject.toml` — Project metadata, entry points, tool config

---

## Node.js CLI

**Category:** CLI Tool — Node.js
**When to use:** JavaScript/TypeScript CLI tool

### Init Commands
```bash
mkdir {{PROJECT_NAME}} && cd {{PROJECT_NAME}}
npm init -y
npm install commander inquirer chalk ora
npm install -D typescript @types/node tsx @types/inquirer
npx tsc --init
```

### Core Packages
```bash
npm install commander inquirer chalk ora
npm install -D typescript @types/node tsx
```

### Optional Packages (by feature)
- **Config:** `conf` or `cosmiconfig`
- **HTTP:** `node-fetch` or stdlib `fetch` (Node 18+)
- **File ops:** `fs-extra globby`
- **Testing:** `vitest`
- **Build:** `tsup`

### Context7 Research Queries
| Library | Query |
|---------|-------|
| commander | "Commands, options, arguments, action handlers" |
| inquirer | "Prompts, list, confirm, input, checkbox" |

### WebSearch Prompts
- "Node.js CLI tool TypeScript setup {{YEAR}}"
- "npm CLI package best practices {{YEAR}}"

### .gitignore Additions
```
dist/
```

### Config Files
- `tsconfig.json` — ES modules, strict
- `package.json` — `"bin"` field, `"type": "module"`

---

## Unity

**Category:** Game — Unity Engine
**When to use:** Game development with Unity and C#

### Init Commands
```bash
# Unity projects are created via Unity Hub or Editor
# CLI alternative:
# unity-hub -- --createProject {{PROJECT_NAME}}
```

### Core Packages (Unity Package Manager)
- `com.unity.inputsystem` — New Input System
- `com.unity.cinemachine` — Camera management
- `com.unity.textmeshpro` — UI text (usually included)

### Optional Packages (by feature)
- **Multiplayer:** `com.unity.netcode.gameobjects`
- **UI Toolkit:** `com.unity.ui`
- **Addressables:** `com.unity.addressables`
- **Testing:** `com.unity.test-framework`

### Context7 Research Queries
| Library | Query |
|---------|-------|
| unity | "MonoBehaviour lifecycle, ScriptableObjects, ECS, Input System, physics" |

### WebSearch Prompts
- "Unity project structure best practices {{YEAR}}"
- "Unity C# coding standards {{YEAR}}"

### .gitignore Additions
```
Library/
Temp/
Obj/
Build/
Logs/
UserSettings/
*.csproj
*.sln
```

### Config Files
- `ProjectSettings/` — Unity project settings (version controlled)

---

## Godot

**Category:** Game — Godot Engine
**When to use:** Game development with Godot

### Init Commands
```bash
mkdir {{PROJECT_NAME}} && cd {{PROJECT_NAME}}
# Godot projects typically start from the editor
# Create project.godot manually or copy a template
```

### Core Setup
- GDScript (default) or C# (`dotnet` build)
- Godot 4.x with scene tree architecture

### Optional Addons
- **State machine:** custom or `godot-state-charts`
- **Dialogue:** `Dialogic`
- **Networking:** built-in `MultiplayerPeer`
- **Testing:** `GdUnit4` or `GUT`

### Context7 Research Queries
| Library | Query |
|---------|-------|
| godot | "Scene tree, nodes, signals, GDScript syntax, physics, animation, shaders" |

### WebSearch Prompts
- "Godot 4 project structure best practices {{YEAR}}"
- "Godot GDScript patterns {{YEAR}}"

### .gitignore Additions
```
.godot/
export_presets.cfg
```

### Config Files
- `project.godot` — Main project config
- `export_presets.cfg` — Build presets (gitignored)

---

## Web Game

**Category:** Game — Browser-based
**When to use:** Browser game with Phaser.js or Three.js

### Init Commands
```bash
npm create vite@latest {{PROJECT_NAME}} -- --template vanilla-ts
cd {{PROJECT_NAME}}
npm install
# Pick one:
npm install phaser
# or
npm install three @types/three
```

### Core Packages (Phaser path)
```bash
npm install phaser
```

### Core Packages (Three.js path)
```bash
npm install three @types/three
npm install lil-gui stats.js  # Debug tools
```

### Optional Packages (by feature)
- **Physics (3D):** `@dimforge/rapier3d-compat` or `cannon-es`
- **ECS:** `bitecs` or `miniplex`
- **Audio:** `howler`
- **UI overlay:** React or Svelte alongside game canvas
- **Testing:** `vitest`

### Context7 Research Queries
| Library | Query |
|---------|-------|
| phaser | "Scenes, game objects, physics, input, animations, tilemaps" |
| three | "Scene, camera, renderer, geometries, materials, lights, controls" |

### WebSearch Prompts
- "Phaser 3 game project structure {{YEAR}}"
- "Three.js game development tutorial {{YEAR}}"

### .gitignore Additions
```
dist/
```

### Config Files
- `vite.config.ts` — Asset handling config

---

## npm Package

**Category:** Library — JavaScript/TypeScript
**When to use:** Publishing a reusable npm package

### Init Commands
```bash
mkdir {{PROJECT_NAME}} && cd {{PROJECT_NAME}}
npm init -y
npm install -D typescript tsup vitest
npx tsc --init
```

### Core Dev Packages
```bash
npm install -D typescript tsup vitest @types/node
```

### Optional Packages (by feature)
- **Build:** `tsup` (already in core) or `unbuild`
- **Docs:** `typedoc`
- **Linting:** `eslint prettier`
- **Changelog:** `changeset`
- **Testing:** `vitest` (already in core)

### Context7 Research Queries
| Library | Query |
|---------|-------|
| tsup | "Entry points, format (cjs/esm), dts generation, external dependencies" |
| vitest | "Test setup, mocking, coverage, snapshot testing" |

### WebSearch Prompts
- "npm package TypeScript setup {{YEAR}}"
- "npm package dual CJS ESM exports {{YEAR}}"

### .gitignore Additions
```
dist/
```

### Config Files
- `tsconfig.json` — Declaration files, strict
- `package.json` — `"main"`, `"module"`, `"types"`, `"exports"` fields
- `.npmignore` or `"files"` field in package.json

---

## PyPI Package

**Category:** Library — Python
**When to use:** Publishing a reusable Python package

### Init Commands
```bash
mkdir {{PROJECT_NAME}} && cd {{PROJECT_NAME}}
python -m venv .venv
source .venv/bin/activate
pip install hatch
hatch new {{PROJECT_NAME}} --init
```

### Core Dev Packages
```bash
pip install hatch pytest ruff mypy
```

### Optional Packages (by feature)
- **Build:** `hatch` (already in core) or `setuptools build`
- **Docs:** `mkdocs mkdocs-material`
- **Type checking:** `mypy` (already in core)
- **Coverage:** `pytest-cov`
- **CI:** `tox` or `nox`

### Context7 Research Queries
| Library | Query |
|---------|-------|
| hatch | "Project setup, environments, build targets, version management" |
| pytest | "Fixtures, parametrize, conftest, plugins, markers" |

### WebSearch Prompts
- "Python package pyproject.toml setup {{YEAR}}"
- "PyPI package publishing best practices {{YEAR}}"

### .gitignore Additions
```
.venv/
__pycache__/
*.pyc
dist/
*.egg-info/
```

### Config Files
- `pyproject.toml` — All project metadata, build config, tool settings
- `src/{{PROJECT_NAME}}/__init__.py` — Package root

---

## Rust Crate

**Category:** Library — Rust
**When to use:** Publishing a reusable Rust crate

### Init Commands
```bash
cargo new {{PROJECT_NAME}} --lib
cd {{PROJECT_NAME}}
```

### Core Setup
```toml
# Cargo.toml
[package]
name = "{{PROJECT_NAME}}"
version = "0.1.0"
edition = "2021"
license = "MIT"
description = "A short description"
```

### Optional Dependencies (by feature)
- **Serialization:** `serde = { version = "1", features = ["derive"] }`
- **Async:** `tokio = { version = "1", features = ["full"] }`
- **Error handling:** `thiserror = "2"`
- **Logging:** `tracing`
- **Testing:** built-in `#[test]` + `proptest` for property testing

### Context7 Research Queries
| Library | Query |
|---------|-------|
| rust | "Module system, traits, error handling, lifetimes, iterators, macros" |

### WebSearch Prompts
- "Rust crate publishing best practices {{YEAR}}"
- "Rust library project structure {{YEAR}}"

### .gitignore Additions
```
target/
```

### Config Files
- `Cargo.toml` — Metadata, dependencies, features
- `src/lib.rs` — Crate root

---

## Chrome Extension

**Category:** Browser Extension — Manifest V3
**When to use:** Building a Chrome/Chromium browser extension

### Init Commands
```bash
mkdir {{PROJECT_NAME}} && cd {{PROJECT_NAME}}
npm init -y
npm install -D typescript webpack webpack-cli ts-loader copy-webpack-plugin @types/chrome
```

### Core Dev Packages
```bash
npm install -D typescript webpack webpack-cli ts-loader copy-webpack-plugin @types/chrome
```

### Optional Packages (by feature)
- **UI (popup/options):** `react react-dom @types/react @types/react-dom`
- **Styling:** `tailwindcss`
- **State sync:** `webext-bridge` for cross-context messaging
- **Storage:** Chrome `storage` API (built-in)
- **Testing:** `vitest jest-chrome`

### Context7 Research Queries
| Library | Query |
|---------|-------|
| chrome-extension | "Manifest V3 service worker, content scripts, popup, storage, messaging" |

### WebSearch Prompts
- "Chrome extension Manifest V3 TypeScript setup {{YEAR}}"
- "Chrome extension best practices {{YEAR}}"

### .gitignore Additions
```
dist/
```

### Config Files
- `manifest.json` — Extension manifest (V3)
- `webpack.config.js` — Build config with multiple entry points
- `tsconfig.json` — Strict TS

---

## Python ML Project

**Category:** AI/ML — Python
**When to use:** Machine learning / data science project

### Init Commands
```bash
mkdir {{PROJECT_NAME}} && cd {{PROJECT_NAME}}
python -m venv .venv
source .venv/bin/activate
pip install torch numpy pandas scikit-learn matplotlib jupyter
```

### Core Packages
```bash
pip install torch numpy pandas scikit-learn matplotlib jupyter tqdm
# or TensorFlow path:
pip install tensorflow numpy pandas scikit-learn matplotlib jupyter
```

### Optional Packages (by feature)
- **Experiment tracking:** `wandb` or `mlflow`
- **Data versioning:** `dvc`
- **Hyperparameter tuning:** `optuna`
- **Image:** `torchvision` or `Pillow opencv-python`
- **NLP:** `transformers datasets tokenizers`
- **Tabular:** `xgboost lightgbm`
- **Notebooks:** `jupyterlab ipywidgets`
- **Testing:** `pytest`

### Context7 Research Queries
| Library | Query |
|---------|-------|
| pytorch | "Tensor operations, nn.Module, DataLoader, training loop, GPU" |
| scikit-learn | "Preprocessing, model selection, pipelines, metrics, cross-validation" |
| pandas | "DataFrame operations, groupby, merge, read_csv, data cleaning" |
| wandb | "Experiment tracking, logging metrics, sweeps, artifacts" |

### WebSearch Prompts
- "Python ML project structure best practices {{YEAR}}"
- "PyTorch training pipeline template {{YEAR}}"

### .gitignore Additions
```
.venv/
__pycache__/
*.pyc
data/
models/
outputs/
wandb/
*.ipynb_checkpoints/
```

### Config Files
- `pyproject.toml` — Project metadata
- `dvc.yaml` — Pipeline definition (if using DVC)
- `configs/` — Training config files (YAML)

---

## AI Agent

**Category:** AI/ML — Agent Framework
**When to use:** Building an AI agent or LLM-powered application

### Init Commands
```bash
mkdir {{PROJECT_NAME}} && cd {{PROJECT_NAME}}
python -m venv .venv
source .venv/bin/activate
pip install langchain langgraph langchain-openai python-dotenv
```

### Core Packages
```bash
# LangChain path
pip install langchain langgraph langchain-openai langchain-anthropic python-dotenv
# or custom path
pip install openai anthropic python-dotenv httpx
```

### Optional Packages (by feature)
- **Vector DB:** `chromadb` or `pinecone-client` or `qdrant-client`
- **Embeddings:** `sentence-transformers` or API-based
- **Document loading:** `langchain-community unstructured pypdf`
- **Web scraping:** `beautifulsoup4 playwright`
- **Memory:** `langgraph-checkpoint-sqlite` or `redis`
- **Serving:** `fastapi uvicorn langserve`
- **Testing:** `pytest langsmith`

### Context7 Research Queries
| Library | Query |
|---------|-------|
| langchain | "Chains, agents, tools, output parsers, callbacks, LCEL" |
| langgraph | "StateGraph, nodes, edges, conditional edges, checkpointing, human-in-the-loop" |
| chromadb | "Collection creation, embeddings, similarity search, metadata filtering" |

### WebSearch Prompts
- "LangGraph agent architecture best practices {{YEAR}}"
- "AI agent project structure {{YEAR}}"
- "RAG pipeline best practices {{YEAR}}"

### .gitignore Additions
```
.venv/
__pycache__/
*.pyc
chroma_db/
*.faiss
```

### Config Files
- `.env.example` — OPENAI_API_KEY, ANTHROPIC_API_KEY, etc.
- `pyproject.toml` — Project metadata
