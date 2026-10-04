# Claude Coursework Kit

A ready-made [Claude Code](https://claude.com/claude-code) setup for school: skills, one subagent, and slash commands that organize your course folders, turn lectures into study guides, quiz you until you actually understand the material, and draft homework and practice-exam answers from **your course's own materials**, not generic internet knowledge.

Clone it, open Claude Code in the folder, and Claude installs it for you.

## Quickstart (about 2 minutes)

```bash
git clone https://github.com/zapantaarvin/claude-coursework-kit.git
cd claude-coursework-kit
claude
```

Then say **"set this up"** (or type `/setup-coursework`). Claude asks 5 quick questions:

1. Where the kit should live: this folder (easiest), an existing folder of yours, or globally for every project
2. Your school's name
3. Where your course folders go
4. A couple of things you've written, so drafts sound like you (optional)
5. Optional add-ons (PDF/Word/PowerPoint reading, lecture transcription)

It installs everything, checks that it all loads, and tells you what to do first. **Restart Claude Code afterward** so the new commands show up, then type `/` to see them.

> Requirements: Claude Code (any 2026 version) on a Claude plan that includes it. macOS, Linux, or Windows. Lecture transcription is optional and needs `ffmpeg` + `whisper.cpp`, which setup can install for you.

## What's inside

| Command | What it does |
|---|---|
| `/setup-coursework` | Guided install and health check |
| `/school-file-organizer` | Reads a syllabus → builds the course's folder structure; files new documents in the right place |
| `/lecture-transcriber` | Lecture video/audio → timestamped transcript, offline and free |
| `/school-study-guide` | One week/module → an interactive HTML study guide (full worked derivations, live sliders, quiz, dark mode) |
| `/grilling` | Study Mode: quizzes you one prerequisite at a time until you can explain it yourself |
| `/visual-first-explanation` | "Explain X" with a concrete example first and the right kind of visual |
| `/course-keyword-index` | A map of where every term is taught in the course, used for exam prep |
| `/research-prompt` | A copy-paste deep-research prompt for a project (Perplexity, ChatGPT/Gemini Deep Research) |
| `/new-course-skill` | Captures one strict class's rules (submission format, notation, naming) so everything else follows them |
| `/casual-human-voice` | Rewrites text in your own voice (emails to professors, discussion posts) |
| `/school-coursework-assistant` | **Subagent.** Scans a course for what's new and pending, then builds study guides, drafts HW, answers practice exams, or writes project research prompts |

Full map and rules: [`CLAUDE.md`](CLAUDE.md). How to change things: [`CUSTOMIZE.md`](CUSTOMIZE.md).

## A typical week

```
drop syllabus  →  /school-file-organizer           (once per course)
drop lectures  →  /lecture-transcriber → /school-study-guide
confused?      →  /visual-first-explanation, then /grilling
homework       →  /school-coursework-assistant → /grilling on the draft
exam coming    →  /course-keyword-index → drop practice exam → /school-coursework-assistant
```

Your folders end up looking like [`examples/sample-course/`](examples/sample-course/).

## How it works

- **The course is the authority.** Every skill reads your actual lectures, slides, and handouts, in full and in order, and uses the course's own notation. If something wasn't taught, it says so instead of guessing.
- **Nothing gets deleted.** Skills only add folders and files. Ambiguous files get a question, not a guess.
- **Strict classes get their own rules.** `/new-course-skill` saves a class's requirements inside that course's folder, and every other skill defers to it.
- **It remembers.** The coursework assistant keeps a run log in your courses folder so it never redoes finished work.

## Recommended add-ons

Setup offers the first two. The rest are worth a look.

| Add-on | Why you'd want it | How |
|---|---|---|
| **Anthropic document skills** (PDF, Word, PowerPoint, Excel) | Most syllabi, slides, and handouts are PDFs/PPTX, and some classes want `.docx` submissions | In Claude Code: `/plugin marketplace add anthropics/skills` then `/plugin install document-skills@anthropic-agent-skills` |
| **Lecture transcription** (ffmpeg + whisper.cpp) | Study guides and homework drafts are much better with real transcripts | `/setup-coursework` → pick the transcription add-on |
| **Excalidraw skill** | Hand-drawn-style diagrams for notes and project reports | Search "excalidraw claude skill" and install your pick |
| **A planning skill** | Breaks group or semester projects into steps before anyone starts building | Anthropic's `example-skills` plugin, or write your own |
| **Calendar connector** | Lets Claude put syllabus deadlines on your calendar | Claude Code `/mcp`, or the claude.ai connectors |

**Ideas for skills to build next** (good first projects. Ask Claude to build one with the `skill-creator` skill from `example-skills`):
- `deadline-tracker`: syllabus → due-date list → calendar reminders
- `flashcards`: study guide or keyword index → an Anki deck
- `citation-helper`: format sources in APA/MLA/Chicago for papers
- `grade-tracker`: log scores, project your final grade against the syllabus weights

## Academic integrity

This kit is built to help you **learn**: organize, understand lectures, quiz yourself, and check your own work. Drafts are study aids. Many schools and classes have explicit AI-use policies, so **follow yours**, disclose AI use where required, and use `/grilling` so you can defend every answer as your own understanding.

## Customize and share

Fork it, rename things, change the study-guide colors, add skills for your own classes. See [`CUSTOMIZE.md`](CUSTOMIZE.md). If you build something useful, open a PR.

## License

MIT. See [`LICENSE`](LICENSE).
