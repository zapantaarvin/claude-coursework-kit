---
name: <course-code>-coursework
description: The working rules for <Course Code> <Course Name> only. Covers homework (read all lectures for the unit first, then the submission instructions, then the handout), <the required answer format>, <submission packaging>, and study guides for this class. Use for any homework, quiz, exam, or study guide in <Course Code>. Do not apply to any other course.
---

# <Course Code> Coursework

## Scope: this class only

These rules apply **only** to <Course Code> and only to files under its course folder. Other courses have different instructors, formats, and rules. Kit skills (`school-coursework-assistant`, `school-study-guide`, `grilling`) defer to this file for anything it covers. Their general logic fills in only what this file leaves unspecified.

<!-- Delete any section below this class doesn't need. Every rule should say WHERE it came from and WHY. -->

---

## Part 1 — Homework

### 1. Read every lecture for the unit, in full
Read the whole `<unit>/<lecture folder>/` in order (<how files are numbered>). Not just the ones that look relevant. All of them. Study guides are a companion, not a substitute.
<!-- Note anything special about this class's lectures, e.g. "captions preserve whiteboard arithmetic slips: re-derive, don't trust board results." -->

### 2. Read the submission instructions before anything else
Each assignment folder has its own instructions. Re-read per assignment; never assume HW2 follows HW1's rules.

Rules that have applied so far (source: <file name>):
- **File format**: <e.g. one PDF under 10 MB / a ZIP containing the .ipynb>
- **Naming**: <e.g. no name or student ID anywhere, including the filename (anonymous grading)>
- **Packaging**: <e.g. ZIP must contain the notebook or the score is 0>
- **Deadline/late policy**: <…>
- **Peer review**: <if part of the grade: when it opens, what's required>

### 3. Map each question to its lecture
Before answering, write down which lecture each question comes from. If one maps to nothing, go back to step 1. Don't reach for outside knowledge.

**Course notation (use this, not textbook-standard):**
| Concept | This course writes | Textbook usually writes |
|---|---|---|
| <…> | <…> | <…> |

### 4. Rubric
<If there's a rubric: map every line item to a specific answer before submitting. Note where weights differ from point values.>

### 5. Written/theory answers
<Required format: e.g. "every derivation step with a one-line why," "state assumptions," "legibility is graded.">

### 6. Programming answers
<e.g. "Start from the provided notebook; never rebuild its structure; answers go in the `Student answer here` cells in order." "Fixed seeds: random_state=<n>." "Run every cell and report real outputs; never type an expected number.">

### 7. Before submitting
- Run `/grilling` on the finished answers so you can defend the reasoning.
- Run `/casual-human-voice` on written prose only (never on equations or code).
- Check every rule in step 2 one more time.

---

## Part 2 — Required document style
<!-- Only if the class requires a specific style, e.g. a LaTeX template, handwritten-look fonts, a lab-report format. Describe: template location, how to build it (exact command), what must NOT change (e.g. equations stay in the math font), and how to verify the output actually built. -->

---

## Part 3 — Study guides for this class
<!-- Only what differs from the general school-study-guide skill, e.g. which worked examples to reproduce exactly. -->

---

## Anti-patterns

| Don't | Why |
|---|---|
| <e.g. Put your name in the file or filename> | <Breaks anonymous grading> |
| <e.g. Submit a bare .ipynb> | <Must be a ZIP containing it, or it's a 0> |
| Generalize these rules to other courses | Other classes have different standards |

## Sources
<List the documents these rules came from, with dates, so they can be re-checked when instructions change.>
