# AGENTS.md — Obsidian Knowledge Agent

> **For any AI agent (Codex, Claude, Cursor, …) working in this vault.** Read this file first, then follow the instruction modules in `.agents/`.

This vault is driven by a reusable agentic pipeline that turns raw material — PDFs, slides, syllabi, papers, transcripts, URL lists — into structured, teaching-quality notes with navigation and a concept-graph canvas. The pipeline runs in three stages: **ingest → compile → distribute**.

---

## What This Vault Is

A personal knowledge management system built in [Obsidian](https://obsidian.md/). It stores structured, teaching-quality notes across domain branches. The default branches below are a starting point — rename, add, or remove them to fit your domains.

| Branch | Content | Path |
|---|---|---|
| **School** | Academic coursework by semester | `School/{Semester}/{Course}/` |
| **ML** | Machine learning topics | `ML/{Topic}/` |
| **Quant** | Quantitative finance | `Quant/{Topic}/` |
| **References** | Shared foundational concepts | `References/{Concept}.md` |
| **Inbox** | Raw material staging (transient) | `Inbox/` |

See `.agents/vault-architecture.md` for the full structural blueprint.

---

## Instruction Files

| File | Scope | Description |
|---|---|---|
| `.agents/style-guide.md` | All note writing | Teaching-note voice and quality standard |
| `.agents/ingestion-workflow.md` | Knowledge ingestion | Full workflow: classify → scaffold → write → review → commit |
| `.agents/obsidian-conventions.md` | All vault work | YAML frontmatter, wikilinks, file naming, canvas rules |
| `.agents/vault-architecture.md` | Vault structure | Folder roles and cross-linking strategy |

**Read order for ingestion tasks:** `style-guide.md` → `ingestion-workflow.md` (which references the others as needed).

**Read order for general vault work:** `obsidian-conventions.md` → `style-guide.md`.

---

## Core Rules

### 1. Teach naturally
Notes must build mental models, but the body should read like a human note rather than a template. Keep metadata in YAML or `_index.md` files, use natural headings, and make the logic visible without exposing rubric labels. In STEM domains, default to scientific explanation of problem, mechanism, assumptions, and limits rather than humanities-style argument structure. See `.agents/style-guide.md`.

### 2. YAML frontmatter on every note
Minimum: `tags` (array) and `created` (ISO date). See `.agents/obsidian-conventions.md` for field conventions.

### 3. Wikilinks for all internal links
Use `[[path/to/note]]` syntax. Inside tables, escape alias pipes as `[[path\|alias]]`. Never use bare Markdown links for internal vault files. See `.agents/obsidian-conventions.md`.

### 4. Inbox is transient
`Inbox/` is a staging area. Process material promptly and clear it by moving, archiving, or deleting with explicit user approval. Never leave processed material in Inbox.

### 5. References are shared
`References/` holds concepts that span multiple branches. Link to existing reference notes rather than duplicating. Add new anchor sources to existing notes when applicable.

---

## Boundaries

- **Never delete files without explicit user approval** — move or archive instead
- **Never modify `.obsidian/`** — this is Obsidian's internal config directory
- **Agent-specific config dirs are not committed** — `.claude/`, `.cursor/`, `.windsurf/`, `.aider/`, etc. are gitignored. Only `.agents/` is shared and tracked.
- **Respect existing frontmatter** — add fields, don't remove or overwrite existing ones without reason

---

## Agent-Specific Configuration

Tool-specific config may live in gitignored locations such as `.claude/`, `.cursor/`, `.github/copilot-instructions.md`, or `.{agent}/`.

Shared instructions belong in `.agents/`. Agent-specific overrides should extend these rules, not replace them.
