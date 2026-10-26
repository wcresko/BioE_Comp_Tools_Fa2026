#!/bin/bash
# gene_means.sh - mean count of one gene per treatment group
# Usage: ./gene_means.sh <gene column number>
#
# The Lecture 04 "from one-liner to tool" example: the group-means awk
# one-liner from the grep/sed/awk trio, wrapped in a script with an
# argument check and strict mode so it works for *any* gene column.
#
# It expects the cleaned copy of the course table that Lecture 04
# makes with sed (results/stickle_clean.tsv); point infile at
# data/Stickle_RNAseq.tsv instead if you skipped that step.
#
#   chmod +x gene_means.sh         # once
#   ./gene_means.sh 5              # Gene1 (first gene column)
#   for c in 5 6 7; do ./gene_means.sh $c; done    # loop over several genes

set -euo pipefail
col=${1:?Give a gene column number, e.g. 5 for Gene1}
infile=results/stickle_clean.tsv

gene=$(head -n 1 "$infile" | cut -f "$col")
echo "Mean of $gene by group:"
awk -F'\t' -v c="$col" 'NR > 1 { sum[$4] += $c; n[$4]++ } END { for (g in sum) printf "  %-6s %8.1f\n", g, sum[g]/n[g] }' "$infile"
