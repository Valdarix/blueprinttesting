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
              } catch (_) {}
            }
            context.push('');
          }
        }
      }
    } catch (_) {}

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
            } catch (_) {}
          }
        }
      }
    } catch (_) {}

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
    process.stdout.write(JSON.stringify({}));
  }
});
