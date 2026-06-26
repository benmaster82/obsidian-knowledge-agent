---
description: Set up this folder as a knowledge vault — adapts to an empty folder or an existing vault
argument-hint: [optional: domains/branches you want, e.g. "ML, Quant, Research"]
---

Set up the current folder as an Obsidian Knowledge Agent vault. **Detect first, then do
the least surprising thing.** Always idempotent — never clobber anything that exists.

**Step 0 — Detect the folder and tell me which mode you're in:**

- **Already a vault** — `.agents/learned/` exists → **RESUME** (don't re-scaffold).
- **An existing Obsidian vault** — has notes / an `.obsidian/` folder, but no
  `.agents/learned/` → **ADOPT** (fit what's there, fill only the gaps).
- **Empty / new folder** — no notes, no vault structure → **SCAFFOLD** (build a starter).

Then run the matching mode:

### RESUME — it's already set up

Don't re-create anything. Report status in a couple of lines — the branches, how many
items are in `Inbox/`, the last `journal.md` entry — and route me to work:
*"Inbox has 3 items — want me to `:ingest`? Or tell me what to capture."* Stop there.

### ADOPT — an existing vault (the adaptive path)

1. **Read, don't impose.** Map the existing top-level folders, naming style, and the
   frontmatter on a few notes. Treat that as the vault's conventions — do **not** add new
   branch folders or rename anything.
2. **Fill only the gaps.** Create `.agents/learned/` (`journal.md`, `conventions.md`,
   `examples.md`, a `skills/` folder) only if missing; add `Inbox/` and a `Dashboard.md`
   map-of-content that links the **existing** branches. Never overwrite existing files.
3. **Seed conventions for review.** Write what you detected (naming, frontmatter, folder
   shape) into `.agents/learned/conventions.md` as a proposed starting point, and show me
   the diff before committing it.
4. **Commit** the additions, then point me at `/obsidian-knowledge:help`.

### SCAFFOLD — an empty folder

1. **Branches.** Create top-level branch folders — from `$ARGUMENTS` if given, otherwise
   propose a small default (a shared `References/` plus one or two domains) and confirm
   with me before creating. Give each branch an `_index.md`.
2. **Learning state.** Create `.agents/learned/` with `journal.md`, `conventions.md`,
   `examples.md`, and a `skills/` folder — seed empty starters.
3. **Inbox + dashboard.** Create `Inbox/` and a `Dashboard.md` map-of-content that links
   the branches and explains the workflow in a line or two.
4. **Commit** the scaffold, then point me at `/obsidian-knowledge:help` and suggest
   dropping a first source into `Inbox/`.
