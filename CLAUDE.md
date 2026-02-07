# Project Instructions

<!-- Root-level project instructions for Claude Code -->
<!-- This file is loaded automatically at session start -->
<!-- For modular rules, see .claude/rules/ -->
<!-- See: https://code.claude.com/docs/en/memory -->

## Project: Foundation MDT

An advanced Mobile Data Terminal (MDT) system for FiveM QBCore police departments. Commercial product with a plugin/bridge architecture for auto-detecting and integrating with third-party resources.

## Stack

- **Game Logic:** Lua 5.4 (client + server scripts)
- **Framework:** QBCore (jobs, grades, permissions)
- **NUI Frontend:** React + TypeScript + Vite
- **Styling:** Tailwind CSS + shadcn/ui
- **Database:** MySQL via OxMySQL
- **Image Storage:** Discord Webhooks / FiveManage (configurable)
- **Distribution:** Tebex + CFX Asset Escrow

## Key Conventions

See [docs/CONVENTIONS.md](docs/CONVENTIONS.md) for full details.

- Lua: 4-space indent, camelCase, single quotes
- TypeScript: 2-space indent, Prettier + ESLint
- Events: `foundation-mdt:scope:action` format
- DB tables: `foundation_mdt_` prefix, snake_case
- Commits: conventional format with `Co-Authored-By: CornerstoneScripts <support@cornerstonescripts.dev>`
- All GitHub operations via `gh` CLI

## Skills

- `/gh-cli` — GitHub CLI operations (issues, PRs, reviews, branches)
- `/frontend-design` — High-quality UI design for React NUI components
- `/doc-coauthoring` — Documentation revision workflow
- `/skill-creator` — Create project-specific skills
- `/web-artifacts-builder` — React/Tailwind/shadcn prototyping

## Quick Reference

```bash
# NUI development
cd web && npm run dev          # Start Vite dev server
cd web && npm run build        # Production build to web/dist/
cd web && npm run lint         # ESLint check
cd web && npm run format       # Prettier format

# FiveM
ensure foundation-mdt         # Start resource (server.cfg)

# Git
gh issue list                  # View issues
gh pr list                     # View PRs
gh pr create                   # Create PR
```
