# Customizing the kit

Everything is plain Markdown, so you can edit any of it by hand or just ask Claude: *"change the study guide colors to green," "make grilling go easier on me," "add a skill that…"*.

## Where things live

```
.claude/skills/<name>/SKILL.md     what each skill does (the instructions Claude follows)
.claude/agents/school-coursework-assistant.md   the subagent
.claude/commands/<name>.md          the /slash command for each skill (a short pointer to the skill)
CLAUDE.md                           your Coursework settings + the skill map
templates/                          files setup copies (settings block, run log)
examples/sample-course/             what a course folder looks like
```

If you installed globally, your copies are in `~/.claude/` instead. Edit those.

## Common changes

| I want to… | Edit |
|---|---|
| Move my courses folder | The `Courses folder` + `Run log` lines in the **Coursework settings** block of CLAUDE.md (then move the folder) |
| Change how drafts sound | The `## Your voice` section of `casual-human-voice/SKILL.md`, or ask Claude to "redo my voice profile" with new samples |
| Change study guide colors/fonts | The "Visual presentation for Study Mode" section of `grilling/SKILL.md`. It's the only copy, and every study guide reads it |
| Make study guides shorter or longer | Steps 2–3 of `school-study-guide/SKILL.md` |
| Use a different folder layout | Nothing. `school-file-organizer` asks per course and follows whatever a course already uses |
| Add rules for one strict class | Run `/new-course-skill`. It saves the rules inside that course's folder |
| Change homework answer style | "Answer style" in `agents/school-coursework-assistant.md` |
| Use a better transcription model | Set `WHISPER_MODEL` (see `lecture-transcriber/SKILL.md`) |

## Adding your own skill

1. Create `.claude/skills/<name>/SKILL.md` with frontmatter:
   ```markdown
   ---
   name: <name>
   description: What it does + exact phrases that should trigger it ("Use when the student says…").
   ---
   ```
   The `description` decides when Claude uses the skill on its own, so put real trigger phrases in it.
2. Add `.claude/commands/<name>.md` (copy any existing command file and change the name) so `/<name>` works.
3. Add a row to the skill map table in `CLAUDE.md`.
4. If it reads or writes course files, have it read the **Coursework settings** block for the courses folder and follow `school-file-organizer` for placement.
5. Restart Claude Code and type `/` to check it shows up. Run `/setup-coursework check` to verify.

## Ground rules worth keeping when you edit

- Course materials beat general knowledge.
- Never delete or move coursework without asking.
- One owner per fact. Don't copy the same rule into two skills; reference the other skill instead, or they'll drift apart.
- Course-specific rules go in that course's own skill, not the general ones.
