#!/usr/bin/env bash
#
# file_inventory.sh - inventory every file in a folder, grouped by file type
#
# Finds every file in the folder you give it (including subfolders),
# groups the files by extension (.csv, .R, .pdf, ...), and writes a
# report in which file types are ordered from largest to smallest TOTAL
# size. Each file is listed with its permissions, size in bytes, and path.
#
# Usage:
#   ./file_inventory.sh                      # inventory the current folder
#   ./file_inventory.sh ~/Documents          # inventory another folder
#   ./file_inventory.sh ~/Documents inv.txt  # also choose the report name
#
# Works on macOS and Linux. Hidden files and folders (names that start
# with ".") are skipped.

# ----- 1. Arguments, with sensible defaults ---------------------------------
# ${1:-.} means "use the first argument, or '.' (= here) if none was given"
TARGET="${1:-.}"
REPORT="${2:-file_inventory.txt}"

if [ ! -d "$TARGET" ]; then
    echo "Error: '$TARGET' is not a folder" >&2   # >&2 sends this to stderr
    exit 1                                        # non-zero exit = failure
fi

# ----- 2. Collect one line per file: extension, size, permissions, path -----
# find ... -type f   -> every regular file;  ! -path '*/.*' skips hidden ones
# -exec ls -l {} +   -> long listing: permissions (field 1), size (field 5),
#                       name (fields 9 to the end - names can contain spaces)
# awk                -> reshape each line into 4 tab-separated columns
INVENTORY=$(
    find "$TARGET" -type f ! -path '*/.*' -exec ls -l {} + |
    awk '{
        name = $9
        for (i = 10; i <= NF; i++) name = name " " $i   # re-join spaced names

        # extension = text after the last "." in the file name (not the path)
        n = split(name, parts, "/"); base = parts[n]
        if (base ~ /\./ && base !~ /^\./) {
            m = split(base, bits, "."); ext = "." bits[m]
        } else {
            ext = "(no extension)"
        }
        print ext "\t" $5 "\t" $1 "\t" name
    }'
)

if [ -z "$INVENTORY" ]; then
    echo "No files found in '$TARGET'" >&2
    exit 1
fi

# ----- 3. Write the report ---------------------------------------------------
# Pass 1: add up the total size and file count of each extension, then sort
#         the extensions by total size, biggest first.
# Pass 2: under each extension's header, list its files, biggest first.
# Everything inside { ... } is redirected to the report file at the end.
{
    echo "File inventory of: $TARGET"
    echo "Generated on:      $(date '+%Y-%m-%d %H:%M:%S')"

    echo "$INVENTORY" |
    awk -F'\t' '{ total[$1] += $2; n[$1]++ }
        END { for (e in total) print e "\t" total[e] "\t" n[e] }' |
    sort -t '	' -k2,2nr |
    while IFS='	' read -r ext total nfiles; do
        echo ""
        echo "=== $ext - $nfiles file(s), $total bytes total ==="
        echo "$INVENTORY" |
            awk -F'\t' -v e="$ext" '$1 == e' |   # keep this type only
            sort -t '	' -k2,2nr |               # biggest file first
            awk -F'\t' '{ printf "  %s  %12d  %s\n", $3, $2, $4 }'
    done
} > "$REPORT"

echo "Report written to: $REPORT"
