#!/usr/bin/env bash
set -euo pipefail

# Install the Obsidian Knowledge Agent pipeline into a target Obsidian vault.
# Usage: ./install.sh /path/to/your/vault

VAULT="${1:-}"
if [[ -z "$VAULT" ]]; then
  echo "Usage: $0 /path/to/your/vault" >&2
  exit 1
fi
if [[ ! -d "$VAULT" ]]; then
  echo "Error: '$VAULT' is not a directory." >&2
  exit 1
fi

SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing Obsidian Knowledge Agent into: $VAULT"
cp "$SRC/AGENTS.md" "$VAULT/AGENTS.md"
mkdir -p "$VAULT/.agents"
cp "$SRC/.agents/"*.md "$VAULT/.agents/"
mkdir -p "$VAULT/Inbox"

echo "Done. Installed:"
echo "  - AGENTS.md        (agent entrypoint)"
echo "  - .agents/         (instruction modules)"
echo "  - Inbox/           (drop source material here)"
echo
echo "Next: put a syllabus, paper set, book TOC, or topic brief in $VAULT/Inbox,"
echo "then ask your agent to \"ingest the material in Inbox into the vault\"."
