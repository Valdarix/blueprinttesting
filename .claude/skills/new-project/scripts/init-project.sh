#!/usr/bin/env bash
# init-project.sh — Create universal project skeleton (idempotent)
# Usage: bash init-project.sh --name "My Project" [--skip-git] [--skip-docs]

set -euo pipefail

# Defaults
PROJECT_NAME=""
SKIP_GIT=false
SKIP_DOCS=false

# Parse arguments
while [[ $# -gt 0 ]]; do
  case $1 in
    --name)
      PROJECT_NAME="$2"
      shift 2
      ;;
    --skip-git)
      SKIP_GIT=true
      shift
      ;;
    --skip-docs)
      SKIP_DOCS=true
      shift
      ;;
    -h|--help)
      echo "Usage: bash init-project.sh --name \"Project Name\" [--skip-git] [--skip-docs]"
      echo ""
      echo "Options:"
      echo "  --name       Project name (required)"
      echo "  --skip-git   Skip git init and .gitignore creation"
      echo "  --skip-docs  Skip docs/ directory creation"
      echo "  -h, --help   Show this help message"
      exit 0
      ;;
    *)
      echo "Unknown option: $1"
      exit 1
      ;;
  esac
done

if [[ -z "$PROJECT_NAME" ]]; then
  echo "Error: --name is required"
  echo "Usage: bash init-project.sh --name \"Project Name\""
  exit 1
fi

echo "Initializing project: $PROJECT_NAME"

# Create docs/ directory with placeholder files
if [[ "$SKIP_DOCS" == false ]]; then
  mkdir -p docs

  for doc in PROJECT.md ARCHITECTURE.md STACK.md ROADMAP.md CONVENTIONS.md DECISIONS.md TEAM.md; do
    if [[ ! -f "docs/$doc" ]]; then
      TITLE="${doc%.md}"
      echo "# $TITLE" > "docs/$doc"
      echo "" >> "docs/$doc"
      echo "> This document will be populated during project setup." >> "docs/$doc"
      echo "  Created docs/$doc"
    else
      echo "  Skipped docs/$doc (already exists)"
    fi
  done
fi

# Create README.md if it doesn't exist
if [[ ! -f "README.md" ]]; then
  cat > README.md << EOF
# $PROJECT_NAME

> Project documentation is in the \`docs/\` directory.

## Getting Started

See [docs/PROJECT.md](docs/PROJECT.md) for setup instructions.

## Documentation

- [Project Overview](docs/PROJECT.md)
- [Architecture](docs/ARCHITECTURE.md)
- [Tech Stack](docs/STACK.md)
- [Roadmap](docs/ROADMAP.md)
- [Conventions](docs/CONVENTIONS.md)
- [Decisions](docs/DECISIONS.md)
- [Team](docs/TEAM.md)
EOF
  echo "  Created README.md"
else
  echo "  Skipped README.md (already exists)"
fi

# Create .env.example if it doesn't exist
if [[ ! -f ".env.example" ]]; then
  cat > .env.example << 'EOF'
# Environment Variables
# Copy this file to .env and fill in the values
# Never commit .env to version control

# NODE_ENV=development
# DATABASE_URL=
# API_KEY=
EOF
  echo "  Created .env.example"
else
  echo "  Skipped .env.example (already exists)"
fi

# Handle git setup
if [[ "$SKIP_GIT" == false ]]; then
  # Append common entries to .gitignore (idempotent)
  GITIGNORE_ENTRIES=(
    "# Dependencies"
    "node_modules/"
    "__pycache__/"
    "*.pyc"
    ".venv/"
    "venv/"
    "vendor/"
    ""
    "# Environment"
    ".env"
    ".env.local"
    ".env*.local"
    ""
    "# Build output"
    "dist/"
    "build/"
    "out/"
    ".next/"
    "target/"
    ""
    "# IDE"
    ".idea/"
    ".vscode/"
    "*.swp"
    "*.swo"
    "*~"
    ""
    "# OS"
    ".DS_Store"
    "Thumbs.db"
    ""
    "# Logs"
    "*.log"
    "npm-debug.log*"
  )

  if [[ ! -f ".gitignore" ]]; then
    printf '%s\n' "${GITIGNORE_ENTRIES[@]}" > .gitignore
    echo "  Created .gitignore"
  else
    # Only append entries not already present
    ADDED=0
    for entry in "${GITIGNORE_ENTRIES[@]}"; do
      if [[ -n "$entry" ]] && ! grep -qxF "$entry" .gitignore 2>/dev/null; then
        echo "$entry" >> .gitignore
        ADDED=$((ADDED + 1))
      fi
    done
    if [[ $ADDED -gt 0 ]]; then
      echo "  Updated .gitignore ($ADDED entries added)"
    else
      echo "  Skipped .gitignore (already up to date)"
    fi
  fi

  # Initialize git repo if not already initialized
  if [[ ! -d ".git" ]]; then
    git init -q
    echo "  Initialized git repository"
  else
    echo "  Skipped git init (already a repository)"
  fi
fi

echo ""
echo "Project skeleton ready: $PROJECT_NAME"
echo "Next: Run stack-specific init commands from stack-profiles.md"
