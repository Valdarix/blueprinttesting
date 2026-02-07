# Documentation Templates

Templates for all documentation files generated during Phase 2 of the new-project skill.
The lead agent fills these in with project-specific information gathered during Phase 1.

## Table of Contents

1. [docs/PROJECT.md](#template-docsprojectmd)
2. [docs/ARCHITECTURE.md](#template-docsarchitecturemd)
3. [docs/STACK.md](#template-docsstackmd)
4. [docs/ROADMAP.md](#template-docsroadmapmd)
5. [docs/CONVENTIONS.md](#template-docsconventionsmd)
6. [docs/DECISIONS.md](#template-docsdecisionsmd)
7. [docs/TEAM.md](#template-docsteammd)
8. [Root CLAUDE.md Update Pattern](#template-root-claudemd-update-pattern)
9. [.claude/CLAUDE.md Update Pattern](#template-claudeclaudemd-update-pattern)

---

## Template: docs/PROJECT.md

<!-- Source: Phase 1 interview — project name, description, problem, users, features. -->

```markdown
# {{PROJECT_NAME}}

> {{ONE_LINE_DESCRIPTION}}

## Problem Statement

{{PROBLEM_STATEMENT}}

<!-- 2-4 sentences. Focus on "who" and "what hurts". -->

## Target Users

{{TARGET_USERS}}

## Key Features

{{KEY_FEATURES}}

<!-- Bulleted, 5-8 items for MVP. -->

## Getting Started

### Prerequisites

{{PREREQUISITES}}

### Quick Setup

```bash
{{SETUP_COMMANDS}}
```

### Verify It Works

{{VERIFY_STEPS}}

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

{{LICENSE_TYPE}}
```

---

## Template: docs/ARCHITECTURE.md

<!-- Source: Phase 1 interview (project type, modules, patterns) + research agent (deps, deployment). -->

```markdown
# Architecture — {{PROJECT_NAME}}

## System Overview

{{SYSTEM_OVERVIEW}}

<!-- 2-3 sentences, then an ASCII diagram. -->

```
{{ARCHITECTURE_DIAGRAM}}
```

<!-- Example diagram format:
┌─────────┐     ┌─────────────┐     ┌──────────┐
│ Browser  │────▶│  API Server │────▶│ Database │
└─────────┘     └─────────────┘     └──────────┘
-->

## Directory Structure

```
{{PROJECT_NAME}}/
{{DIRECTORY_TREE}}
```

<!-- Tree with key directories and inline descriptions. -->

## Core Modules

{{CORE_MODULES}}

<!-- Per module: name, location, responsibility, key interfaces, dependencies.
     Format as ### headings with bullet lists. -->

## Data Flow

{{DATA_FLOW}}

<!-- Numbered steps for the primary request lifecycle or event flow. -->

## Design Patterns

{{DESIGN_PATTERNS}}

<!-- List patterns actually in use with brief rationale. -->

## External Dependencies

| Dependency | Purpose | Why Chosen |
|-----------|---------|------------|
{{DEPENDENCY_TABLE}}

## Deployment Architecture

{{DEPLOYMENT_ARCHITECTURE}}

<!-- Hosting, database, CDN, monitoring. -->
```

---

## Template: docs/STACK.md

<!-- Source: Phase 1 interview (stack preferences) + research agent (versions, compatibility). -->

```markdown
# Technology Stack — {{PROJECT_NAME}}

## Stack Overview

| Category | Technology | Version | Purpose |
|----------|-----------|---------|---------|
{{STACK_TABLE}}

## Framework Details

### {{PRIMARY_FRAMEWORK}}

{{FRAMEWORK_RATIONALE}}

<!-- Why chosen and which features are used. -->

### Key Libraries

{{KEY_LIBRARIES}}

<!-- Per library: why chosen over alternatives. -->

## Infrastructure

### Hosting

{{HOSTING_DETAILS}}

### CI/CD

{{CICD_DETAILS}}

<!-- Platform, triggers, stages, environments. -->

### Monitoring

{{MONITORING_DETAILS}}

## Development Tools

| Tool | Purpose | Config File |
|------|---------|-------------|
{{DEV_TOOLS_TABLE}}

## Package Management

{{PACKAGE_MANAGEMENT}}

<!-- Package manager, lockfile strategy, workspace setup if monorepo. -->

## Version Compatibility

{{VERSION_NOTES}}

<!-- Known version constraints or compatibility notes. -->
```

---

## Template: docs/ROADMAP.md

<!-- Source: Phase 1 interview — MVP scope, enhancements, scale ideas.
     Lead agent assigns size estimates: S = hours, M = a day or two, L = multiple days. -->

```markdown
# Roadmap — {{PROJECT_NAME}}

## Vision

{{VISION_STATEMENT}}

<!-- 1-2 sentences on where this project is headed. -->

---

## Phase 1: Foundation (MVP)

**Goal:** {{PHASE_1_GOAL}}

**Key Deliverables:**

{{PHASE_1_TASKS}}

<!-- Format: - [ ] Task description (S|M|L) -->

---

## Phase 2: Enhancement

**Goal:** {{PHASE_2_GOAL}}

**Key Deliverables:**

{{PHASE_2_TASKS}}

---

## Phase 3: Scale

**Goal:** {{PHASE_3_GOAL}}

**Key Deliverables:**

{{PHASE_3_TASKS}}

---

## Future Considerations

{{FUTURE_ITEMS}}

<!-- Out-of-scope ideas worth tracking. -->
```

---

## Template: docs/CONVENTIONS.md

<!-- Source: Phase 1 interview (code style, git workflow, testing) +
     research agent (framework-specific best practices). -->

```markdown
# Conventions — {{PROJECT_NAME}}

## Code Style

### Formatting

{{FORMATTING_RULES}}

<!-- Formatter, print width, tabs/spaces, semicolons, quotes, trailing commas. -->

### Naming

{{NAMING_CONVENTIONS}}

<!-- Conventions for: files, components, functions/variables, constants,
     database tables, environment variables. -->

### File Organization

{{FILE_ORGANIZATION}}

<!-- Co-location rules, exports per file, index file policy, max file length. -->

## Git Workflow

### Branching Strategy

{{BRANCHING_STRATEGY}}

<!-- Main branch, feature/fix/chore branch naming. -->

### Commit Messages

{{COMMIT_FORMAT}}

<!-- Format spec. Always include:
     Co-Authored-By: CornerstoneScripts <support@cornerstonescripts.dev> -->

### PR Process

{{PR_PROCESS}}

<!-- Branch → commits → PR → checks → merge strategy. -->

## Component / Module Patterns

{{MODULE_PATTERNS}}

<!-- Project-type-specific patterns (e.g., Server vs Client Components,
     data fetching approach, form handling). -->

## Testing

### What to Test

{{TESTING_SCOPE}}

<!-- Unit, integration, E2E scope. What to skip. -->

### Naming and Structure

{{TEST_NAMING}}

<!-- File naming, describe blocks, test name format, arrange-act-assert. -->

### Coverage Targets

{{COVERAGE_TARGETS}}

<!-- Per-category targets. Focus on critical paths over vanity metrics. -->

## Documentation Standards

{{DOC_STANDARDS}}

<!-- When to add JSDoc/docstrings, inline comment rules, doc update triggers. -->

## Error Handling

{{ERROR_HANDLING}}

<!-- Error classes, API error shape, logging context, client exposure rules. -->

## Import Ordering

{{IMPORT_ORDER}}

<!-- Ordered groups (built-ins → external → internal → relative → styles)
     with blank lines between groups. -->
```

---

## Template: docs/DECISIONS.md

<!-- Source: Pre-populate with decisions from Phase 1 interview —
     stack choices, architecture patterns, key tradeoffs. -->

```markdown
# Decision Log — {{PROJECT_NAME}}

Architectural decisions and their rationale. Newest entries first.

| Date | Decision | Context | Rationale |
|------|----------|---------|-----------|
{{DECISION_SUMMARY_TABLE}}

<!-- Keep this table in sync with detailed entries below. -->

---

## Detailed Entries

{{DECISION_ENTRIES}}

<!-- Use the ADR-lite template for each decision. Pre-populate from Phase 1 interview. -->

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
```

---

## Template: docs/TEAM.md

<!-- Source: Phase 1 interview — team structure preferences, agent roles. -->

```markdown
# Team — {{PROJECT_NAME}}

## Agent Roster

| Agent | Role | Model | Mode | Key Responsibilities |
|-------|------|-------|------|---------------------|
{{TEAM_ROSTER}}

## Communication Patterns

{{COMMUNICATION_PATTERNS}}

<!-- Task assignment, status updates, peer collaboration, broadcast policy. -->

## Task Assignment Flow

{{TASK_FLOW}}

<!-- Numbered steps: break down → assign → claim → complete → review → next. -->

## PR Review Process

{{PR_REVIEW}}

<!-- Who reviews what, automated checks, merge strategy. -->

## Escalation Paths

{{ESCALATION}}

<!-- Technical blockers, ambiguous requirements, cross-agent conflicts, infra issues. -->
```

---

## Template: Root CLAUDE.md Update Pattern

<!-- NOT a standalone file. APPEND this content to the existing root CLAUDE.md. -->

```markdown
<!-- APPEND the following to the existing root CLAUDE.md -->

## Project: {{PROJECT_NAME}}

{{PROJECT_SUMMARY}}

## Stack

{{STACK_SUMMARY}}

<!-- Brief bulleted list of key technologies. -->

## Key Conventions

See [docs/CONVENTIONS.md](docs/CONVENTIONS.md) for full details.

{{KEY_CONVENTIONS_SUMMARY}}

<!-- 3-5 most important conventions. -->

## Skills

{{SKILLS_LIST}}

## Quick Reference

```bash
{{QUICK_COMMANDS}}
```
```

---

## Template: .claude/CLAUDE.md Update Pattern

<!-- NOT a standalone file. APPEND this content to the existing .claude/CLAUDE.md. -->

```markdown
<!-- APPEND the following to the existing .claude/CLAUDE.md -->

## Agent Coordination

{{AGENT_COORDINATION}}

<!-- TaskList usage, task claiming, messaging, team config location. -->

## Documentation References

| Document | Path | Purpose |
|----------|------|---------|
| Project Overview | docs/PROJECT.md | What this project is and how to get started |
| Architecture | docs/ARCHITECTURE.md | System design, modules, data flow |
| Stack | docs/STACK.md | Technology choices and versions |
| Roadmap | docs/ROADMAP.md | Development phases and task tracking |
| Conventions | docs/CONVENTIONS.md | Code style, git, testing standards |
| Decisions | docs/DECISIONS.md | Architecture decision log |
| Team | docs/TEAM.md | Agent roles and coordination |

## Skills

{{SKILLS_LIST}}

## Team Workflow

{{TEAM_WORKFLOW_NOTES}}

<!-- Task system, direct messages, conventions, decision logging. -->
```
