#!/usr/bin/env bash
#
# filter_rows.sh - keep the header plus the rows where a column has a value
#
# First half of a two-script pipeline (see total_counts.sh). Reads a
# tab-separated table on standard input, keeps the header line plus every
# row where the named column equals the value you ask for, and writes the
# result to standard output - so it slots straight into a pipe.
#
# Usage (with the course dataset):
#   ./filter_rows.sh Genotype A  < Stickle_RNAseq.tsv  > genotype_A.tsv
#   ./filter_rows.sh Microbiota conventional < Stickle_RNAseq.tsv | head
#
# Chained with total_counts.sh:
#   ./filter_rows.sh Genotype A < Stickle_RNAseq.tsv | ./total_counts.sh
#
# Works on macOS and Linux.

# ----- 1. Check the arguments ------------------------------------------------
COLUMN="${1:?Usage: ./filter_rows.sh column_name value < input.tsv}"
VALUE="${2:?Usage: ./filter_rows.sh column_name value < input.tsv}"

# ----- 2. Filter ---------------------------------------------------------------
# awk reads standard input because no file name is given.
#   NR == 1  -> the header line: find which column has the name we want,
#               print the header, and move to the next line
#   $c == v  -> for every other line, print it when column c equals the value
awk -F'\t' -v col="$COLUMN" -v val="$VALUE" '
    NR == 1 {
        for (i = 1; i <= NF; i++) if ($i == col) c = i
        if (!c) {
            print "Error: no column named \"" col "\" in the header" > "/dev/stderr"
            exit 1
        }
        print          # keep the header so the output is still a valid table
        next
    }
    $c == val          # no action block = print the whole line
'
