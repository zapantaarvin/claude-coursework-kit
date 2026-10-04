#!/usr/bin/env bash
# Transcribe lecture videos/audio to .vtt + .txt with whisper.cpp, fully offline.
# Usage: transcribe.sh <file-or-folder> [more files/folders...]
#   Env: WHISPER_MODEL=/path/to/ggml-*.bin   (default: ~/.local/share/whisper-models/ggml-base.en.bin, then ggml-base.bin)
#        WHISPER_LANG=en|auto|<code>          (default: en, or auto with a multilingual model)
#        OUT_DIR=/path                        (default: next to each input file)
# Skips any input that already has a .vtt with the same name. Never deletes or overwrites.
set -euo pipefail

BIN=""
for b in whisper-cli whisper-cpp whisper.cpp main; do
  if command -v "$b" >/dev/null 2>&1; then BIN="$b"; break; fi
done
[ -n "$BIN" ] || { echo "ERROR: whisper.cpp not found (looked for whisper-cli / whisper-cpp). Run /setup-coursework and pick transcription tools." >&2; exit 2; }
command -v ffmpeg >/dev/null 2>&1 || { echo "ERROR: ffmpeg not found. Run /setup-coursework and pick transcription tools." >&2; exit 2; }

MODEL="${WHISPER_MODEL:-}"
if [ -z "$MODEL" ]; then
  for m in "$HOME/.local/share/whisper-models/ggml-base.en.bin" "$HOME/.local/share/whisper-models/ggml-base.bin"; do
    [ -f "$m" ] && { MODEL="$m"; break; }
  done
fi
[ -n "$MODEL" ] && [ -f "$MODEL" ] || { echo "ERROR: no whisper model found. See the lecture-transcriber SKILL.md for the one-line download." >&2; exit 2; }

LANG_OPT="${WHISPER_LANG:-}"
if [ -z "$LANG_OPT" ]; then
  case "$(basename "$MODEL")" in *.en.bin) LANG_OPT=en ;; *) LANG_OPT=auto ;; esac
fi

EXT_RE='\.(mp4|mov|m4v|mkv|webm|avi|mp3|m4a|wav|aac|flac|ogg)$'
TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT
done_n=0; skip_n=0; fail_n=0

transcribe_one() {
  local in="$1" dir base out
  base="$(basename "${in%.*}")"
  dir="${OUT_DIR:-$(dirname "$in")}"; mkdir -p "$dir"
  out="$dir/$base"
  if [ -f "$out.vtt" ]; then echo "skip (exists): $out.vtt"; skip_n=$((skip_n+1)); return; fi
  echo "transcribing: $in"
  if ffmpeg -nostdin -loglevel error -y -i "$in" -ar 16000 -ac 1 -c:a pcm_s16le "$TMP/a.wav" \
     && "$BIN" -m "$MODEL" -l "$LANG_OPT" -f "$TMP/a.wav" -ovtt -otxt -of "$out" -np >/dev/null 2>"$TMP/err"; then
    echo "  -> $out.vtt, $out.txt"; done_n=$((done_n+1))
  else
    echo "  FAILED: $in" >&2; [ -f "$TMP/err" ] && tail -5 "$TMP/err" >&2; fail_n=$((fail_n+1))
  fi
}

[ $# -gt 0 ] || { echo "Usage: $0 <file-or-folder> [...]" >&2; exit 1; }
for arg in "$@"; do
  if [ -d "$arg" ]; then
    while IFS= read -r -d '' f; do transcribe_one "$f"; done < <(find "$arg" -type f -print0 | grep -zEi "$EXT_RE" | sort -z)
  elif [ -f "$arg" ]; then
    transcribe_one "$arg"
  else
    echo "not found: $arg" >&2; fail_n=$((fail_n+1))
  fi
done
echo "done: $done_n transcribed, $skip_n skipped, $fail_n failed (model: $(basename "$MODEL"), lang: $LANG_OPT)"
[ "$fail_n" -eq 0 ]
