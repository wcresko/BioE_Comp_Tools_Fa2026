#!/usr/bin/env bash
#
# total_counts.sh - total RNA-seq read counts per fish
#
# Second half of a two-script pipeline (see filter_rows.sh). Reads the
# course dataset (or any filtered subset of it) on standard input, adds
# up all the Gene1...Gene600 count columns for each row, and writes a
# two-column table - Individual and Total_counts - to standard output.
#
# Usage:
#   ./total_counts.sh < Stickle_RNAseq.tsv
#
# The point of writing scripts this way: because both scripts read stdin
# and write stdout, the OUTPUT of one is the INPUT of the other -
#
#   ./filter_rows.sh Genotype A < Stickle_RNAseq.tsv \
#       | ./total_counts.sh \
#       | sort -t$'\t' -k2,2nr \
#       | head -5                 # the 5 genotype-A fish with most reads
#
# Works on macOS and Linux.

awk -F'\t' '
    NR == 1 {
        # Remember which columns are gene-count columns (names start
        # with "Gene"), so metadata columns are never added to the sum.
        for (i = 1; i <= NF; i++) if ($i ~ /^Gene/) genecol[i] = 1
        print "Individual\tTotal_counts"
        next
    }
    {
        sum = 0
        for (i in genecol) sum += $i
        print $1 "\t" sum
    }
'
