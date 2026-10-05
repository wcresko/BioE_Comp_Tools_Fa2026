#!/usr/bin/env bash
#
# backup_project.sh - make a dated, compressed snapshot of a project folder
#
# Creates my_project_backup_2026-10-05_161203.tar.gz next to the project:
# a single compressed file holding everything EXCEPT output/, which is
# expendable (your scripts can regenerate it - Lecture 01). The timestamp
# uses YYYY-MM-DD so backups sort in date order, exactly like the file
# naming convention from Lecture 01.
#
# Usage:
#   ./backup_project.sh my_project
#
# To look inside or restore a backup later:
#   tar -tzf my_project_backup_2026-10-05_161203.tar.gz    # list contents
#   tar -xzf my_project_backup_2026-10-05_161203.tar.gz    # extract
#
# Works on macOS and Linux.

# ----- 1. Check the arguments -------------------------------------------------
PROJECT="${1:?Usage: ./backup_project.sh project_folder}"
PROJECT="${PROJECT%/}"        # trim a trailing / if Tab-completion added one

if [ ! -d "$PROJECT" ]; then
    echo "Error: '$PROJECT' is not a folder" >&2
    exit 1
fi

# ----- 2. Build a dated file name ----------------------------------------------
# $(...) captures a command's output into a variable ("command substitution")
STAMP=$(date '+%Y-%m-%d_%H%M%S')
BACKUP="${PROJECT}_backup_${STAMP}.tar.gz"

# ----- 3. Create the archive ----------------------------------------------------
# tar flags:  -c create   -z compress with gzip   -f write to this file
# --exclude skips the expendable output/ folder
tar --exclude "$PROJECT/output" -czf "$BACKUP" "$PROJECT"

# ----- 4. Confirm, showing the size ----------------------------------------------
echo "Backup written:"
ls -lh "$BACKUP"
