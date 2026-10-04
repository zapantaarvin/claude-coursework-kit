# CLAUDE.md — Coursework Kit

This folder is the **Claude Coursework Kit**: a set of Claude Code skills, one subagent, and slash commands for managing school coursework. It covers organizing course folders, turning lectures into study guides, quizzing the student until they actually understand the material, and drafting homework and practice-exam answers grounded in the course's own materials.

## First run: install before anything else

If the file `.kit-installed` does **not** exist next to this CLAUDE.md, the kit has not been set up yet. Before doing anything else the user asks for, tell them in one line that the kit needs a quick setup, then run the `setup-coursework` skill (read `.claude/skills/setup-coursework/SKILL.md` and follow it). The user can also start it any time with `/setup-coursework`.

If `.kit-installed` exists, setup is done. Use the settings block below and the skill map.

## Coursework settings

<!-- setup-coursework fills this block in. Every skill reads it. Do not rename the heading. -->
- School: _not set yet_
- Courses folder: _not set yet_
- Run log: _not set yet_
- Install type: _not set yet_

## Skill and command map

Every skill can be run by typing its slash command, or by just asking in plain words (the trigger phrases below).

| Command | What it does | Use it when |
|---|---|---|
| `/setup-coursework` | Guided install: asks 5 questions, copies files, fills in settings, offers add-ons, checks everything loads | First run, moving the kit, or "check my coursework setup" |
| `/school-file-organizer` | Reads a syllabus and builds the course's folder structure; files newly dropped documents into the right folder | "Set up folders for this class," "file this," "add a new course" |
| `/lecture-transcriber` | Turns lecture videos or audio into transcript files locally (free, offline) | "Transcribe this lecture," "I dropped the lecture videos" |
| `/school-study-guide` | Builds an interactive HTML study guide for one week/module/topic from that unit's materials | "Build a study guide for week 3" |
| `/grilling` | Study Mode: quizzes you on a concept until you can explain it yourself | "Quiz me on X," "make sure I get this before the exam" |
| `/visual-first-explanation` | Explains a concept with a concrete example and the right kind of visual | "Explain X," "how does X work," "walk me through X" |
| `/course-keyword-index` | Builds a per-course map of where every term is taught, used to answer exam questions | "Build the keyword index for this course," before exam prep |
| `/research-prompt` | Writes a copy-paste deep-research prompt (Perplexity, ChatGPT Deep Research, Gemini) for a project | "Help me research this project," "I need sources for X" |
| `/new-course-skill` | Creates a rules skill for one class with strict formats (submission rules, required notation, file naming) | A class has rules the general skills shouldn't apply everywhere |
| `/casual-human-voice` | Rewrites text in your own voice (set up during install) | Emails to professors, discussion posts, your own write-ups |
| `/school-coursework-assistant` | **Subagent.** Scans a course for new material and pending work, then builds study guides, drafts HW/quiz answers, answers practice exams, or writes project research prompts | "What's pending in [course]," "work on HW 3," "answer this practice exam" |

## Typical semester workflow

1. **New course**: drop the syllabus into a new folder under the courses folder, then run `/school-file-organizer`.
2. **Each week**: drop slides/readings/lecture videos in, then run `/lecture-transcriber` (if videos) → `/school-study-guide`.
3. **Learn it**: `/grilling` on anything shaky. `/visual-first-explanation` for "I don't get X."
4. **Homework**: `/school-coursework-assistant` drafts it from the course's own materials, then `/grilling` on the draft so you can defend every step.
5. **Exams**: `/course-keyword-index` once, then drop practice exams in and run `/school-coursework-assistant`.
6. **Projects**: `/school-coursework-assistant` or `/research-prompt` writes a research prompt; you run it and bring the results back.
7. **Strict class?** `/new-course-skill` captures its rules once so every other skill obeys them.

## Rules every skill in this kit follows

- **The course's own materials are the authority.** Notation, methods, and terms come from the lectures and slides, not general knowledge. If a question maps to nothing in the materials, say so instead of reaching outside them.
- **Read all of a unit's lectures in full before any homework in it.** Keyword search misses definitions that land several exchanges after a term first appears.
- **Non-destructive files.** Skills only add folders and files. They never move, rename, delete, or overwrite existing coursework without asking.
- **Ask, don't guess**, when a file's course/unit/category is ambiguous.
- **A course's own skill wins.** If a course has a skill made with `/new-course-skill`, its rules override the general skills for that course.
- **Academic integrity.** These tools exist to help the student learn, check their own work, and organize. Drafts are study aids. The student follows their school's and each class's AI policy, and `/grilling` exists so they can defend every answer as their own understanding.

## Editing the kit

See `CUSTOMIZE.md`. Skills live in `.claude/skills/<name>/SKILL.md`, the subagent in `.claude/agents/`, and slash commands in `.claude/commands/`. A new skill gets a matching command file and a row in the table above.
