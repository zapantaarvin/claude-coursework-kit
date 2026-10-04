---
name: school-study-guide
description: Builds a self-contained interactive HTML study guide (plus a short README.md) for one week/module/topic of any course, from the lecture transcripts, slides, and readings already in that unit's folder. Full worked derivations, plain language, live widgets, a quiz, and light/dark themes. Never decides where the guide's folder lives (that's school-file-organizer's job). Triggers on "build a study guide for [course/week]," "make a study guide," or "study guide for Part/Module/Week N."
---

# School Study Guide

This skill owns *how a study guide gets written*. It never owns *where it gets filed*. That belongs to `school-file-organizer`, which knows each course's folder convention.

If the course has its own skill (made with `new-course-skill`) that says something more specific about study guides, that skill wins for that course. This skill is the fallback every other course uses.

## Step 1 — Locate the unit and read its materials in full

Read the **Coursework settings** block in CLAUDE.md to find the courses folder. Take the course and unit from the request, using *that course's own* naming (`Week 05 - Transformers`, `Module 3`, `04 Recursion`). Read every material file in that unit's folder(s) in full, in the course's own order (numeric/chronological), not by keyword search.

A definition often lands several exchanges after a term first appears in a transcript, and a keyword hit finds the term without the explanation around it. Read continuously. If the unit has lecture videos with no transcript yet, run `lecture-transcriber` first.

## Step 2 — Language rules

Write so the guide is easy to read fast, including for students whose first language isn't English:
- Short sentences. Common words. No idioms ("the whole ballgame," "ironclad") that cost more effort than the idea.
- Define every technical term the first time it appears.
- Every module gets a **"Words to know"** table (each symbol/term with a one-line definition) placed *before* those terms are used.
- Open every module with a plain-words box: state the idea with an everyday comparison before any notation appears.

## Step 3 — Content depth rules

**Never cut a derivation short to make it simpler.** Simpler language, same completeness.

- Every proof runs to its final result as numbered step cards, each with the equation and a one-line "why" underneath.
- Use explicit tables to list discrete cases rather than summarizing them in prose.
- **Every numeric worked example shows its full computation**: raw counts, intermediate values, the formula plugged in. Never just a final number. If the source never worked a concrete example for a formula, make a small, clearly labeled one and compute it in full.
- **Every reused number says where it came from before it's used**: name the exact table rows/cells, or cite the earlier step by label ("weight = 1/3 from step 2.1"). Label sub-steps `N.1`, `N.2`, … so later steps can point back.
- **Never skip an arithmetic step that changes a fraction's form** (show common-denominator conversions).
- **Add to the source, don't just compress it.** Add original plugged-in examples or illustrations wherever a formula would otherwise stay abstract. Never replace the original derivation.
- If the materials are lecture transcripts with live derivations, call out any place the lecture itself slipped (sign error, dropped term) and show the correct version. If they're slides/readings, flag any inconsistency between the sources (for example, a symbol reused for two things, or a citation that doesn't match the provided reading). Flag it. Don't silently fix it.

## Step 4 — Visual identity: read `grilling`, don't duplicate it here

Use the system in the `grilling` skill's **"Visual presentation for Study Mode"** section. Read it at build time instead of copying its tokens here, so there's one owner and no drift. The four non-negotiables:
1. Monospace for headings, labels, and all equations, over regular sans body prose.
2. Light and dark palettes, both fully defined, with a **manual toggle**.
3. Radius: 12px cards, 10px sub-boxes, 6px equation blocks, 20px pills.
4. Semantic colors for terms inside equations, not flat color throughout.

## Step 5 — Illustrations

Inline SVG, theme-aware through the same CSS variables. Draw the actual mechanism being taught, never decoration.

## Step 6 — Interactivity and gamification

Prefer a live widget over a static picture wherever the concept genuinely moves: a slider that changes a parameter and shows a dependent quantity update, with a self-checking readout. Add small challenges, a progress bar, and a multiple-choice quiz with instant explanations. Save progress in `localStorage` (wrapped in try/catch) with a reset button.

**Check every challenge can actually be completed.** Pull the page's logic into a scratch script and test it across many random inputs. A challenge that's impossible at a slider's extreme teaches the wrong lesson.

## Step 7 — Verify before handing it over

- Extract the `<script>` block and run `node --check` on it (if Node is installed).
- Confirm every `getElementById` target exists in the markup.
- Re-derive the worked examples against the source's own numbers (a quick Python check is fine).
- Check each section: every numeric result shows its arithmetic, and every formula has a plugged-in example nearby.

## Step 8 — Output and placement

Produce `index.html` (self-contained, no build step, opens by double-click) plus a short `README.md` listing the sources it was built from and anything flagged. If the Artifact tool is available, also offer to publish it as a shareable page.

- If the course already has a Study Guide convention, use that exact pattern.
- If invoked by `school-coursework-assistant`, use the destination it already resolved.
- If no convention exists yet, don't invent one. Hand back to `school-file-organizer` to set it up and document it in the course README first.

## Anti-patterns

| Don't | Why |
|---|---|
| Invent a new visual identity, or copy `grilling`'s tokens into a second file | One owner, no drift |
| Keyword-search transcripts instead of reading in full | Definitions land away from the term |
| Cut a derivation short for simplicity | Simpler words, same completeness |
| Create or name a folder yourself | Placement belongs to `school-file-organizer` |
| Apply `casual-human-voice` to the guide's prose | The guide is Claude teaching the student, not the student's own writing |
| State a number with no worked arithmetic | Every number must be reproducible by hand from the page |

## Related

`grilling` (visual system + live Study Mode quiz) · `school-file-organizer` (placement) · `lecture-transcriber` (transcripts in) · `school-coursework-assistant` (calls this skill as one branch).
