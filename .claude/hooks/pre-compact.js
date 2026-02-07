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
