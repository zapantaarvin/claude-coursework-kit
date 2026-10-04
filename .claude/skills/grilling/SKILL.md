---
name: grilling
description: Study Mode. Quiz the student relentlessly on a concept until they can actually explain, derive, or apply it themselves, working through the concept's prerequisite tree one frontier at a time. Also owns the visual style used by every study guide in this kit. Use when the student types /grilling or says "quiz me on X," "grill me," "make sure I get this before the exam," "help me really understand Y," or wants to check they can defend a homework draft.
---

# Grilling — Study Mode

Use when the student wants to actually understand a concept, not just get it explained once.

The round-and-frontier mechanic is adapted from the "grill me" skill in [mattpocock/skills](https://github.com/mattpocock/skills), applied to a concept's prerequisite structure instead of a plan's decision structure.

## How a session runs

The tree is the concept's own **prerequisite structure**: what sub-concepts does understanding X depend on? The **frontier** is whatever sub-concept can be tested *now* without assuming mastery of something not yet checked.

Each round, ask the student to **explain, derive, or apply** a frontier concept in their own words. Don't ask whether they "get it." You already know the correct answer. The goal is checking their understanding against it:
- **Right** (even if imperfectly worded): confirm *why* it's right and move the frontier forward.
- **Wrong or shaky**: don't hand over the answer. Ask a smaller, targeted question that isolates exactly which part is missing, and let them try again before you explain.
- Only after they've genuinely attempted a concept does a full explanation from you belong in the conversation.

Ground every question in the course's own materials and notation when a course is involved (read the **Coursework settings** block in CLAUDE.md for the courses folder). Don't quiz on things the course never taught.

**Grilling a homework draft:** grill on the reasoning, not the result. Ask why this method, why this step is necessary, why this constant and not another. The point is that the student can defend every line as their own understanding.

The session is done when every prerequisite sub-concept in the tree has actually been demonstrated, not just asked about once. End with a short list of what's solid and what to review.

## Academic integrity

This mode builds the student's own understanding. It never produces graded answers on their behalf.

## Visual presentation for Study Mode

This is the visual system for every study guide and study artifact in the kit (`school-study-guide` reads this section at build time). It's a precise, technical style built for math and technical material.

- **Typography**: monospace (`'SF Mono', 'Fira Code', Menlo, monospace`) for headings, labels, eyebrows, and all equations/code. Body prose stays a regular system sans (`-apple-system, 'Segoe UI', system-ui, sans-serif`) for readability. Don't make everything monospace. The mix is the point.
- **Color, light theme**: `--bg:#F0F3FB --surface:#FFFFFF --surface2:#E8EDF8 --border:#C8D2E8 --accent:#3A6FE8 --text:#111827 --muted:#5A6880 --eq-bg:#E2E8F4`, plus semantic `--agree:#1E9E68` (correct/agreement) and `--disagree:#C43B3B` (incorrect/disagreement).
- **Color, dark theme**: `--bg:#0C0F1A --surface:#161B2E --surface2:#1E2540 --border:#2A3354 --accent:#5B8FF9 --text:#E4EAF6 --muted:#7A88A8 --eq-bg:#0A0D18`, semantic `--agree:#3DCA8A --disagree:#E05C5C`.
- Color equations **by meaning** (a disagreement term in red, an agreement term in green, a final result in accent blue), not flat single-color text.
- **Dark mode**: support both themes for real. Use `@media (prefers-color-scheme: dark)` for the automatic theme, **plus a manual toggle button** (`<button onclick="toggleTheme()">` setting `data-theme` on `<html>`) so the student can flip it regardless of the system setting.
- **Radius**: 12px cards, 10px sub-boxes, 6px equation blocks, 20px (full pill) for tags/badges/the theme toggle.
- **Full worked derivations, not truncated.** Show every step to the final result with a one-line "why" under each. Walking through *how* a proof is built is teaching, not doing the assignment.
- **Interactivity where the concept is genuinely dynamic**: e.g. a slider that moves a parameter and shows a dependent quantity update live, with a self-checking equation confirming the relationship holds.
- **Structure**: numbered step cards (circular numbered badge + equation + "why" line) for derivations; an explicit table for listing discrete cases rather than an abstract 2-card summary.

Want a different look? Edit the tokens here. Every study guide picks them up, because this is the only copy.
