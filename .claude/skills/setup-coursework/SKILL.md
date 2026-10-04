---
name: setup-coursework
description: Guided installer and health check for the Claude Coursework Kit. Use when the user types /setup-coursework, when this kit's CLAUDE.md says `.kit-installed` is missing, or when they say "install the coursework kit," "set this up," "move my coursework setup," or "check my coursework setup." Asks a few questions, installs the skills/agent/commands where the user wants them, fills in the Coursework settings block, sets up the voice profile, offers optional add-ons, and verifies everything loads.
---

# Setup Coursework

Install the kit for one student, in their own words and folders. Ask, don't assume: every question below is the student's call. Keep the conversation short and friendly. Most students have never edited a Claude Code config.

`KIT` below means the folder this kit was cloned into (the one holding this repo's `CLAUDE.md`).

## Step 0 — Check what's already there

- If `KIT/.kit-installed` exists, this is a re-run. Read the **Coursework settings** block in the CLAUDE.md it points to, show it, and ask whether they want to **check health** (jump to Step 6), **change a setting**, or **reinstall**.
- Check that the `claude` CLI version supports skills and subagents (`claude --version`). Any 2026 release does. If it's very old, tell them to update first.

## Step 1 — Ask the setup questions

Ask these together in one message (use the AskUserQuestion tool if available, otherwise a numbered list), with the recommended answer marked:

1. **Where should the kit live?**
   - **A. Use this folder as my school workspace (recommended for most).** Nothing gets copied. Courses go in `KIT/Courses/` (or a folder they name). They open Claude Code in this folder whenever they do schoolwork.
   - **B. Add it to an existing folder or project** (for example an Obsidian vault or a school folder they already have). Ask for the path.
   - **C. Install globally** into `~/.claude/` so the commands work in every project. Tell them this one adds to their personal Claude config.
2. **What school do you go to?** (Only used to word things, for example "your school's academic integrity policy.")
3. **Where are (or will) your course folders live?** Default: `<workspace>/Courses/`. One subfolder per course, named however they like (`BIO 201 - Genetics`, `Calc II`, …).
4. **Your writing voice.** Ask them to paste 2–3 things they actually wrote (a discussion post, an email to a professor, a paragraph of an essay), or say "skip" to keep the general human-voice rules only.
5. **Optional add-ons** (multi-select; see Step 5 for what each one is):
   - Document skills: PDF, Word, PowerPoint, Excel (recommended: syllabi and slides are usually PDFs/PPTX)
   - Lecture transcription tools: ffmpeg + whisper.cpp (recommended if their classes post lecture videos)
   - None for now

## Step 2 — Install the files

**Option A (this folder):** nothing to copy. `TARGET = KIT`.

**Option B (existing folder):** `TARGET = <their path>`.
- Copy `KIT/.claude/skills/*`, `KIT/.claude/agents/*`, and `KIT/.claude/commands/*` into `TARGET/.claude/` (create folders as needed).
- **Never overwrite.** Before copying, list any same-named file already in `TARGET/.claude/`. If there are conflicts, show them and ask: skip, rename the kit's copy, or replace. Default is skip.
- Copy `KIT/templates/coursework-section.md` into `TARGET/CLAUDE.md`: append it if the file exists, create it if it doesn't. Never rewrite the rest of their CLAUDE.md.

**Option C (global):** `TARGET = ~/.claude`.
- Same copy rules into `~/.claude/skills`, `~/.claude/agents`, `~/.claude/commands`, conflicts checked the same way.
- Append `templates/coursework-section.md` to `~/.claude/CLAUDE.md` (create if missing).

Shell notes: use `cp -R` / `mkdir -p` on macOS and Linux. On Windows (no WSL), use PowerShell `Copy-Item -Recurse`. Quote every path, because course folders often have spaces.

## Step 3 — Fill in the Coursework settings block

In the CLAUDE.md you wrote to (Option A: `KIT/CLAUDE.md`), replace the placeholder lines under `## Coursework settings` with real values. Use **absolute paths**:

```
- School: <school name>
- Courses folder: <absolute path to the courses folder>
- Run log: <courses folder>/_coursework-log.md
- Install type: <workspace | existing folder: <path> | global> (installed <YYYY-MM-DD>)
```

Then:
- Create the courses folder if it doesn't exist (`mkdir -p`).
- Create the run log by copying `KIT/templates/coursework-log.md` to the Run log path, but only if no file is there already.
- Copy `KIT/examples/sample-course/` into the courses folder **only if** they want an example to look at (ask; default no).

## Step 4 — Set up the voice profile

Open the installed `casual-human-voice/SKILL.md` and find the `## Your voice` section.
- If they pasted samples: study them and write 5–8 concrete bullets describing how they actually write. Cover sentence length, capitalization and punctuation habits, how formal they get with professors, words and phrases they use, how they open and close emails, and how they hedge. Describe patterns. Don't copy whole sentences from the samples. Show the bullets and ask "does this sound like you?" before saving.
- If they skipped, leave the section as-is. The general rules still apply.

## Step 5 — Optional add-ons

Only what they picked in Step 1.

**Document skills (Anthropic's official PDF/DOCX/PPTX/XLSX skills).** These are Claude Code plugins, so the student types the commands themselves:
```
/plugin marketplace add anthropics/skills
/plugin install document-skills@anthropic-agent-skills
```
Tell them to run those two lines, then come back.

**Lecture transcription tools** (used by `/lecture-transcriber`):
- macOS: `brew install ffmpeg whisper-cpp`
- Linux: install `ffmpeg` with the package manager, then build or install `whisper.cpp` (https://github.com/ggml-org/whisper.cpp).
- Windows: `winget install ffmpeg`, then download a whisper.cpp release from the GitHub releases page and add it to PATH.
- Then download a model (about 150 MB, one time):
  ```
  mkdir -p ~/.local/share/whisper-models
  curl -L -o ~/.local/share/whisper-models/ggml-base.en.bin https://huggingface.co/ggerganov/whisper.cpp/resolve/main/ggml-base.en.bin
  ```
  Use `ggml-base.bin` instead (same URL pattern) if any lectures aren't in English.
- Run the installs for them if they say yes and the platform supports it. Otherwise give them the exact lines.

**Other skills worth knowing about.** Mention these once, but don't install them:
- `excalidraw`, for drawing diagrams for notes and reports
- A planning skill that breaks big projects into steps before building anything
- See the README's "Recommended add-ons" list for more

## Step 6 — Verify (also the health check)

Check every item below and report a short pass/fail list:

1. Each kit skill folder exists with a `SKILL.md` at the install target: `setup-coursework, school-file-organizer, school-study-guide, grilling, visual-first-explanation, course-keyword-index, research-prompt, new-course-skill, casual-human-voice, lecture-transcriber`.
2. `agents/school-coursework-assistant.md` exists.
3. A command file exists in `commands/` for every skill plus the agent.
4. The Coursework settings block has no `_not set yet_` left, and the courses folder and run log exist.
5. If transcription was picked: `ffmpeg -version`, `whisper-cli --help` (or `whisper-cpp`/`main`, depending on how it was installed), and the model file all exist.

Then write `KIT/.kit-installed` with the date, install type, and target path. Tell them to **restart Claude Code** (or start a new session) so new skills and commands load, then type `/` to see them.

## Step 7 — Hand-off

End with a 4-line "you're set" message:
1. Where their courses go.
2. The first thing to do: drop a syllabus into a new course folder and run `/school-file-organizer`.
3. Where the full skill map lives (`CLAUDE.md`).
4. How to change anything (`CUSTOMIZE.md`, or just ask Claude to edit a skill).

## Don't

| Don't | Why |
|---|---|
| Overwrite an existing skill, agent, command, or CLAUDE.md | It's the student's own setup; conflicts get shown and decided |
| Pick the install location for them | It decides how they'll open Claude Code all semester |
| Paste their writing samples into the skill verbatim | The profile describes patterns; copied text is private and makes Claude parrot it |
| Run `/plugin` commands yourself | Plugin installs are the user's action in their own Claude Code |
| Mark setup done before Step 6 passes | A half-installed kit fails confusingly later |
