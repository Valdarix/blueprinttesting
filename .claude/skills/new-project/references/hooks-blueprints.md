# Hooks Blueprints

Reference templates for generating context management hooks during Phase 3D. These hooks mitigate context rot in long-running team sessions by compacting early and restoring state after compaction.

## Table of Contents

1. [Overview](#overview)
2. [Settings.json Template](#settingsjson-template)
3. [SessionStart Hook](#sessionstart-hook)
4. [PreCompact Hook](#precompact-hook)
5. [CLAUDE.md Context Recovery Block](#claudemd-context-recovery-block)

---

## Overview

**Problem:** Long-running Claude Code team sessions degrade as context windows fill. The team lead is hardest hit — it accumulates messages from all teammates. The default autocompact threshold (~95%) triggers far too late; research shows degradation starts around 50% context usage.

**Solution — Three layers:**

| Layer | Mechanism | What It Does |
|-------|-----------|-------------|
| Prevention | Subagent delegation | Teammates spawn Task subagents for implementation — fresh context per issue |
| Early intervention | 70% autocompact | Triggers compaction before severe degradation, with safety margin above 50% onset |
| Recovery | SessionStart hook + CLAUDE.md | Restores task state, team config, and project context after compaction |

**Why Node.js:** Claude Code guarantees Node.js is available. Hook scripts need to parse JSON from stdin and read files from disk — Node handles both natively without external dependencies.

**Why 70%:** Degradation begins ~50%. At 70% we intervene early with margin, without over-compacting and losing useful short-term context. Users can override in `.claude/settings.local.json`.

---

## Settings.json Template

Create `.claude/settings.json` with autocompact threshold and hook configuration. This file is committed to the repo so all project contributors benefit from context rot mitigation.

Users can override settings in `.claude/settings.local.json` (gitignored).

```json
{
  "env": {
    "CLAUDE_AUTOCOMPACT_PCT_OVERRIDE": "70"
  },
  "hooks": {
    "SessionStart": [
      {
        "type": "command",
        "command": "node .claude/hooks/session-start.js"
      }
    ],
    "PreCompact": [
      {
        "type": "command",
        "command": "node .claude/hooks/pre-compact.js"
      }
    ]
  }
}
```

**Notes:**
- `CLAUDE_AUTOCOMPACT_PCT_OVERRIDE=70` lowers the autocompact threshold from ~95% to 70%
- Hook commands run from the project root directory
- Both hooks output JSON to stdout with `additionalContext` to inject context into the session
- If `.claude/settings.json` already exists, merge these keys into the existing file rather than overwriting

---

## SessionStart Hook

Fires on session start events. Only injects recovery context when resuming after compaction or session resume — fresh sessions start clean.

Create at `.claude/hooks/session-start.js`:

```javascript
#!/usr/bin/env node
'use strict';

const fs = require('fs');
const path = require('path');
const os = require('os');

// Read hook event from stdin
let input = '';
process.stdin.setEncoding('utf8');
process.stdin.on('data', (chunk) => { input += chunk; });
process.stdin.on('end', () => {
  try {
    const event = JSON.parse(input);

    // Only inject recovery context after compaction or resume
    // Fresh sessions ("startup") and clear ("clear") start clean
    if (event.source !== 'compact' && event.source !== 'resume') {
      process.stdout.write(JSON.stringify({}));
      return;
    }

    const context = [];
    context.push('## Context Recovery (Post-Compaction)');
    context.push('');
    context.push('Your context was just compacted. Re-orient using the state below.');
    context.push('');

    // 1. Restore task state from all team task directories
    const tasksBase = path.join(os.homedir(), '.claude', 'tasks');
    try {
      if (fs.existsSync(tasksBase)) {
        const teams = fs.readdirSync(tasksBase).filter(d =>
          fs.statSync(path.join(tasksBase, d)).isDirectory()
        );
        for (const team of teams) {
          const teamTaskDir = path.join(tasksBase, team);
          const taskFiles = fs.readdirSync(teamTaskDir).filter(f => f.endsWith('.json'));
          if (taskFiles.length > 0) {
            context.push(`### Tasks (team: ${team})`);
            context.push('');
            for (const file of taskFiles) {
              try {
                const task = JSON.parse(fs.readFileSync(path.join(teamTaskDir, file), 'utf8'));
                const status = task.status || 'unknown';
                const owner = task.owner ? ` [${task.owner}]` : '';
                const blocked = task.blockedBy && task.blockedBy.length > 0
                  ? ` (blocked by: ${task.blockedBy.join(', ')})`
                  : '';
                context.push(`- **${task.id || file}**: ${task.subject || 'untitled'} — ${status}${owner}${blocked}`);
              } catch (_) {
                // Skip malformed task files
              }
            }
            context.push('');
          }
        }
      }
    } catch (_) {
      // Tasks dir not accessible — skip silently
    }

    // 2. Restore team config
    const teamsBase = path.join(os.homedir(), '.claude', 'teams');
    try {
      if (fs.existsSync(teamsBase)) {
        const teamDirs = fs.readdirSync(teamsBase).filter(d =>
          fs.statSync(path.join(teamsBase, d)).isDirectory()
        );
        for (const team of teamDirs) {
          const configPath = path.join(teamsBase, team, 'config.json');
          if (fs.existsSync(configPath)) {
            try {
              const config = JSON.parse(fs.readFileSync(configPath, 'utf8'));
              context.push(`### Team: ${team}`);
              context.push('');
              if (config.members && Array.isArray(config.members)) {
                for (const member of config.members) {
                  context.push(`- **${member.name}** (${member.agentType || 'agent'})`);
                }
              }
              context.push('');
            } catch (_) {
              // Skip malformed config
            }
          }
        }
      }
    } catch (_) {
      // Teams dir not accessible — skip silently
    }

    // 3. Inject project context pointers
    const projectRoot = process.cwd();
    const projectDocs = [
      'docs/PROJECT.md',
      'docs/ROADMAP.md',
      'docs/TEAM.md',
      'docs/ARCHITECTURE.md'
    ];

    const existingDocs = projectDocs.filter(d =>
      fs.existsSync(path.join(projectRoot, d))
    );

    if (existingDocs.length > 0) {
      context.push('### Recovery Steps');
      context.push('');
      context.push('Re-read these files to restore project context:');
      for (const doc of existingDocs) {
        context.push(`- \`${doc}\``);
      }
      context.push('');
    }

    // 4. Remind about self-recovery actions
    context.push('### Immediate Actions');
    context.push('');
    context.push('1. Run `TaskList` to see current task state');
    context.push('2. Read `docs/TEAM.md` for team roster and workflow');
    context.push('3. Read `docs/ROADMAP.md` for current phase and priorities');
    context.push('4. Check GitHub state: `gh issue list --assignee @me` and `gh pr list`');
    context.push('');

    process.stdout.write(JSON.stringify({
      additionalContext: context.join('\n')
    }));

  } catch (_) {
    // If anything fails, output empty JSON — never block session start
    process.stdout.write(JSON.stringify({}));
  }
});
```

**Key behaviors:**
- Only fires on `source: "compact"` or `"resume"` — fresh sessions start clean
- Reads task files from `~/.claude/tasks/` to restore task state
- Reads team config from `~/.claude/teams/` to restore team roster
- Checks for project docs and suggests re-reading them
- All file reads are wrapped in try/catch — missing files are silently skipped
- Outputs `additionalContext` JSON that Claude Code injects into the session

---

## PreCompact Hook

Fires before context compaction. Outputs guidance that influences what the compaction algorithm preserves.

Create at `.claude/hooks/pre-compact.js`:

```javascript
#!/usr/bin/env node
'use strict';

const fs = require('fs');
const path = require('path');
const os = require('os');

let input = '';
process.stdin.setEncoding('utf8');
process.stdin.on('data', (chunk) => { input += chunk; });
process.stdin.on('end', () => {
  try {
    const context = [];
    context.push('## Pre-Compaction Notice');
    context.push('');
    context.push('Context is being compacted. Preserve the following critical state:');
    context.push('');

    // Summarize active tasks for preservation
    const tasksBase = path.join(os.homedir(), '.claude', 'tasks');
    try {
      if (fs.existsSync(tasksBase)) {
        const teams = fs.readdirSync(tasksBase).filter(d =>
          fs.statSync(path.join(tasksBase, d)).isDirectory()
        );
        for (const team of teams) {
          const teamTaskDir = path.join(tasksBase, team);
          const taskFiles = fs.readdirSync(teamTaskDir).filter(f => f.endsWith('.json'));
          const activeTasks = [];
          for (const file of taskFiles) {
            try {
              const task = JSON.parse(fs.readFileSync(path.join(teamTaskDir, file), 'utf8'));
              if (task.status === 'in_progress') {
                activeTasks.push(task);
              }
            } catch (_) {}
          }
          if (activeTasks.length > 0) {
            context.push(`### Active Tasks (${team})`);
            context.push('');
            for (const task of activeTasks) {
              const owner = task.owner ? ` [${task.owner}]` : '';
              context.push(`- **${task.id}**: ${task.subject}${owner}`);
              if (task.description) {
                context.push(`  ${task.description.slice(0, 200)}`);
              }
            }
            context.push('');
          }
        }
      }
    } catch (_) {}

    // Remind about teammate state
    const teamsBase = path.join(os.homedir(), '.claude', 'teams');
    try {
      if (fs.existsSync(teamsBase)) {
        const teamDirs = fs.readdirSync(teamsBase).filter(d =>
          fs.statSync(path.join(teamsBase, d)).isDirectory()
        );
        if (teamDirs.length > 0) {
          context.push('### Preserve Team Awareness');
          context.push('');
          context.push('Active teams exist. After compaction:');
          context.push('- The SessionStart hook will restore task and team state');
          context.push('- CLAUDE.md files persist through compaction');
          context.push('- Re-read docs/TEAM.md for teammate roster and roles');
          context.push('');
        }
      }
    } catch (_) {}

    context.push('### Key Context to Retain');
    context.push('');
    context.push('- Current phase and priorities from docs/ROADMAP.md');
    context.push('- Pending plan approvals or review requests from teammates');
    context.push('- Any blockers or escalations in progress');
    context.push('');

    process.stdout.write(JSON.stringify({
      additionalContext: context.join('\n')
    }));

  } catch (_) {
    process.stdout.write(JSON.stringify({}));
  }
});
```

**Key behaviors:**
- Reads active (in_progress) tasks and outputs them so the compaction retains awareness of what's being worked on
- Notes active teams so compaction preserves team awareness
- Lists key context to retain (phase, pending approvals, blockers)
- Gracefully handles missing files and directories

---

## CLAUDE.md Context Recovery Block

Add this block to the `.claude/CLAUDE.md` update pattern. This content survives compaction (CLAUDE.md files are always re-read) and serves as the anchor for context recovery.

```markdown
## Context Recovery

This file survives context compaction and serves as the recovery anchor.

**Automatic recovery:** The SessionStart hook (`.claude/hooks/session-start.js`) restores task state, team config, and project context pointers after compaction. You do not need to manually recover this state.

**If you notice degraded responses or lost context:**
1. Run `TaskList` to see all tasks and their current status
2. Read `docs/TEAM.md` for the team roster, roles, and workflow
3. Read `docs/ROADMAP.md` for current phase and priorities
4. Check GitHub: `gh issue list --assignee @me` and `gh pr list`
5. If severely degraded, run `/compact` proactively

**Subagent delegation:** Always delegate implementation work to Task subagents (fresh context per issue). Keep your own context clean for coordination, plan review, and communication. See docs/TEAM.md for the full delegation workflow.
```
