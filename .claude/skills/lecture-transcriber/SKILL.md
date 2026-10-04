---
name: lecture-transcriber
description: Turns lecture videos and audio recordings into timestamped transcripts (.vtt + .txt), locally and for free, with whisper.cpp, so the study-guide, homework, and keyword-index skills can read what was actually said in class. Use when the student types /lecture-transcriber or says "transcribe this lecture," "I dropped the lecture videos," "make captions for week N," or when another kit skill needs transcripts that don't exist yet.
---

# Lecture Transcriber

Everything runs on the student's own computer. No uploads, no API keys, no cost.

## Step 1 — Check the tools

Run `.claude/skills/lecture-transcriber/transcribe.sh` with no arguments (use `~/.claude/skills/...` if the kit was installed globally). It prints usage if everything's ready, or a clear error naming what's missing:
- **whisper.cpp / ffmpeg missing**: point the student to `/setup-coursework` (transcription add-on), or give the install line for their OS: macOS `brew install ffmpeg whisper-cpp`, Windows `winget install ffmpeg` plus a whisper.cpp release from GitHub, Linux via the package manager plus whisper.cpp.
- **No model**: one-time download, about 150 MB:
  ```
  mkdir -p ~/.local/share/whisper-models
  curl -L -o ~/.local/share/whisper-models/ggml-base.en.bin https://huggingface.co/ggerganov/whisper.cpp/resolve/main/ggml-base.en.bin
  ```
  Swap in `ggml-base.bin` for non-English lectures, or `ggml-small.en.bin` for better accuracy on heavy technical vocabulary (slower, about 470 MB).

## Step 2 — Find the recordings

Read the **Coursework settings** block in CLAUDE.md for the courses folder. Find video/audio files (`mp4 mov m4v mkv webm avi mp3 m4a wav aac flac ogg`) in the unit the student named, or across the course if they said "all." If lectures are only links (Zoom/Canvas/YouTube), ask the student to download them first, or check whether the platform already offers a caption file. A downloaded official caption file beats a Whisper transcript.

## Step 3 — Transcribe

```
.claude/skills/lecture-transcriber/transcribe.sh "<file or folder>" ["<more>" ...]
```
- Output lands **next to each recording** by default, with the same name: `lecture 1.vtt` (timestamped) + `lecture 1.txt` (plain). To put transcripts in the course's captions folder instead (for example `Week 03/Captions/`), set `OUT_DIR="<that folder>"`. Use whatever folder `school-file-organizer` says the course uses.
- Already-transcribed files are skipped, so it's safe to re-run on a whole course.
- Long lectures take a few minutes each. For more than about 3 lectures, run it in the background and tell the student it's working.
- `WHISPER_LANG=auto` forces language detection. `WHISPER_MODEL=<path>` picks a different model.

## Step 4 — Report and clean up

Report how many were transcribed, skipped, and failed, plus where they landed. Skim one transcript and warn the student if it looks wrong (repeated lines, wrong language, garbled technical terms). Whisper often mishears course-specific terms and symbols, so other skills should treat transcripts as "what was said, roughly" and check slides for exact notation.

Never delete or move the original recordings.
