#!/usr/bin/env bash
# Render the course website AND the nested course book into docs/ for GitHub Pages.
#
# NOTE: a plain `quarto render` at the repo root now does BOTH, because _quarto.yml has a
# post-render hook (render_book.R) that renders Book/ afterwards. This script is just an
# explicit alternative, and `quarto render Book --to html` renders the book alone.
set -euo pipefail
cd "$(dirname "$0")"
echo "== Rendering course website (the post-render hook also renders the book) =="
quarto render
echo "Done. Commit and push docs/ to publish."
