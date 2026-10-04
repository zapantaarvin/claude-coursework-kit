---
name: school-file-organizer
description: Reads a course syllabus (and any HW/quiz/exam/project prompts, rubrics, or transcripts the student drops in) to identify the graded-work categories a class will have, then creates and maintains a non-destructive folder structure for that course's current and future work. Also files newly dropped documents into the right existing folder. Triggers on "set up folders for this class," "organize this course," "I uploaded the syllabus for X," "where should this HW/quiz/exam/rubric go," "file this," or "add a new course." Purely mechanical: it does not decide how homework gets answered, graded, or styled (that's a course's own skill, made with new-course-skill, if a class needs one).
---

# School File Organizer

## Scope: structure only, across every course

Folder scaffolding and document filing, nothing else. This skill never writes grading rules, answer style, voice, or submission rules into a course folder. If a class needs those, it gets its own skill (see `new-course-skill`). Keeping that line is what keeps this skill reusable across every course.

---

## Step 1 — Locate the course

Read the **Coursework settings** block in CLAUDE.md for the `Courses folder`. If the block is missing or still says `_not set yet_`, stop and suggest `/setup-coursework`.

- If the student names a course that already has a folder there, work inside it.
- If it's a **brand-new course** with no folder yet, confirm the folder name with the student before creating it (suggest `<Code> - <Short Name>`, e.g. `BIO 201 - Genetics`). Don't create course folders anywhere outside the courses folder without asking.

## Step 2 — Read the syllabus before creating anything

Find the syllabus (PDF/DOCX) the student dropped in. If it's a PDF/DOCX and a document skill (`pdf`, `docx`) is installed, use it. Otherwise extract text with whatever tool is available (`pdftotext`, Python). Extract:
- The graded-component **categories** (homework, quizzes, exams, projects, labs, participation, etc.)
- **Counts and cadence** where the syllabus states them (e.g. "6 problem sets, 2 exams, 1 final project," or a week-by-week schedule)

If the syllabus is image-only, has its schedule in a table graphic, or is otherwise unreliable to parse, **say exactly what's unclear and ask**, rather than invent a schedule. A wrong guess here creates a semester's worth of wrong folders.

## Step 3 — Pick the structure for *this* course, not a house style

Different courses organize differently, and none of these is correct everywhere:

| Example course shape | Folder convention that fits |
|---|---|
| Course split into modules, each with its own homework parts | `Module N/` → `HW/Part N/`, `Lectures/`, `Study Guide/`, plus a cross-module `Course Reference/` |
| Short topic-by-topic course with no weekly rhythm | Flat numbered topic folders (`01 Introduction`, `02 Basics`, …) |
| Weekly lecture course | `Week NN - Topic/` with fixed `Slides/`, `Readings/`, `Captions/` subfolders, plus a cross-week `Course Reference/` |

- **If the course folder already has a structure** (even a partial one: a `Module 1/` folder, a `Week 1 - X/` folder, anything), **extend that exact pattern.** Match how existing folders are named and subdivided, down to capitalization. Never introduce a second convention into the same course.
- **If it's new with no structure, ask the student which organizing unit fits** (weeks, modules/parts, flat numbered topics, something else) and show what the syllabus suggests. This is a whole-semester decision.
- Inside the chosen units, only add subfolders per content type (`HW/`, `Readings/`, `Slides/`) the syllabus says the course actually has. Don't build an empty `Exams/` folder for a class with no exams.

### Conventions to reuse in every course

- **`My Work/`**: a subfolder inside any assignment folder for anything the student wrote, kept apart from course-provided handouts. Matters most for anonymous/peer-graded classes, but apply it everywhere for consistency.
- **`OFFICIAL` in the filename**: for any solution file the school posts (e.g. `hw1_OFFICIAL_solution.pdf`), so it never collides with the student's own file and it's obvious which is which.
- **`Course Reference/`**: material not tied to one unit (syllabus, textbook, prerequisite refreshers, the course's keyword index, any templates or build tools the course needs).
- **`Practice Exams/`** and **`Practice Answers/`**: created the first time practice exams show up, at the level the course's structure suggests.
- **A per-course `README.md`** at the course root describing the folder layout in plain terms. Create or update it whenever the structure changes so the tree documents itself.

## Step 4 — Scaffold non-destructively

- Only create folders (and the README) that don't already exist. **Never move, rename, delete, or overwrite anything already there.**
- Safe to re-run mid-semester: inspect the tree first and add only what's missing. There's no separate manifest. The folder tree itself is the source of truth, checked fresh each time.
- Pre-create folders for **known future work the syllabus names** (e.g. `HW4`–`HW6` if it says 6 problem sets and 3 exist) only when the naming pattern is unambiguous. If dates or counts are vague, file new work as it actually arrives instead of making empty shells.

## Step 5 — File a newly dropped document

When the student drops a file (rubric, HW prompt, transcript, quiz) and asks to file it, or hands over a batch:

1. Match the file to a **category** (HW/Quiz/Exam/Project/etc.) and a **unit** (week/module/topic) from its filename and a quick read of its content.
2. **If the match is confident and unique, move it into place**, keeping the original filename unless it collides or breaks a naming rule already set for that course (like the `OFFICIAL` marker or an anonymity rule in the course's own skill/README).
3. **If it's ambiguous** (two possible categories, unclear unit, uninformative filename), **stop and ask**, naming exactly what's unclear. A misfiled HW prompt can sit unnoticed for a whole semester.

## Anti-patterns

| Don't | Why |
|---|---|
| Impose one folder convention on every course | The syllabus's own structure should drive the choice |
| Create the whole semester's folders from a guess at an unclear syllabus | A wrong guess means redoing every folder later; ask instead |
| Move, rename, or delete an existing file or folder | This is real, in-progress schoolwork; scaffolding only adds |
| Silently file an ambiguous document | Ask when unsure |
| Write grading, style, or submission rules into a course folder | That's a course skill's job (`new-course-skill`) |
| Build a manifest/state file to track what's scaffolded | The folder tree is the source of truth; re-inspect it each run |

## Related

`new-course-skill` (rules for one strict class) · `school-coursework-assistant` (uses this skill to decide where every output goes) · `lecture-transcriber` (fills `Captions/` or `Lectures/` folders).
