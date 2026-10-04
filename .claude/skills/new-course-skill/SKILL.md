---
name: new-course-skill
description: Creates a rules skill for ONE specific class that has its own strict requirements (submission format, file naming, anonymous grading, required notation, a notebook template, LaTeX style, rubric mapping), from that class's syllabus and submission instructions, using the template in this skill's folder. The general kit skills then defer to it for that class. Use when the student types /new-course-skill or says "this class has special rules," "make a skill for [course]," "remember how [course] wants homework submitted," or a general skill keeps getting a class's format wrong.
---

# New Course Skill

General skills stay general. When one class has rules that shouldn't apply everywhere, those rules go in a skill **scoped to that class only**, stored inside the course folder so it moves with it.

## When it's worth it

Make one when the class has at least one of these: specific submission rules (file type, size, ZIP contents, anonymity), notation that differs from the textbook standard, a provided template that must be used as-is, fixed random seeds or required outputs, a rubric to map answers to, or a required document style. If the class is just "do the reading, answer the questions," the general skills are enough. Say so and stop.

## Step 1 — Gather the rules from the class's own documents

Read the **Coursework settings** block in CLAUDE.md for the courses folder. Then read the course's syllabus, every submission-instructions document, any rubric, one handout, and (if present) the student's graded work in `My Work/` with feedback. Pull out only rules those documents actually state. Ask the student about anything they know that isn't written down ("the TA takes points off for…").

## Step 2 — Fill in the template

Copy `template.md` (in this skill's folder) and fill every section from Step 1. Delete any section the class doesn't need. Don't leave empty headings. Every rule gets a short **why** (usually "graders check X" or "the instructions say Y"), so a later Claude knows how strictly to apply it.

Name the skill `<course-code>-coursework` in lowercase with hyphens (e.g. `bio201-coursework`, `calc2-coursework`).

## Step 3 — Save it inside the course folder

Save to `<course folder>/.claude/skills/<name>/SKILL.md`, plus a pointer command at `<course folder>/.claude/commands/<name>.md`:

```markdown
---
description: Rules for <Course>. Use when working on any homework, quiz, exam, or study guide for this class.
---
Read `<course folder>/.claude/skills/<name>/SKILL.md` in full and follow it for this request.

Request: $ARGUMENTS
```

Claude Code loads skills from the folder it's opened in, so also add one line to the course's `README.md`: "This course has its own rules skill at `.claude/skills/<name>/`. General kit skills defer to it." That way the agent and the other skills always find it, even from the courses folder. Then the student can either open Claude Code inside the course folder, or just mention the class and Claude finds the rules via the README.

## Step 4 — Confirm

Show the student a 5-line summary of the strictest rules captured and ask if anything's missing. Remind them to re-run this skill when a new assignment's instructions change the rules. Rules can differ per assignment, so the skill notes which assignment each rule came from.

## Don't

| Don't | Why |
|---|---|
| Invent rules the class's documents don't state | A wrong rule applied with confidence costs real points |
| Copy one class's rules into a general kit skill | Other classes have different standards |
| Assume HW2 has HW1's submission rules | Re-read per assignment; note which assignment each rule came from |
