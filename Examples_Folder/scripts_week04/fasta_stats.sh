#!/bin/bash
# Script: fasta_stats.sh
# Purpose: Calculate basic statistics for FASTA files
#
# The Lecture 04 worked example: the counting, N, GC and ORF-finding
# pipelines from the chr21 exploration, wrapped with argument checks
# into one tool that runs on *any* FASTA file.
#
# Usage:
#   chmod +x fasta_stats.sh        # once
#   ./fasta_stats.sh chr21_subset.fa    # test on the small file first...
#   ./fasta_stats.sh chr21.fa           # ...then the whole chromosome
#
# In Lecture 05 this same script is rewritten in R and in Python.

# Check arguments
if [ $# -ne 1 ]; then
    echo "Usage: $0 sequences.fasta"
    exit 1
fi

INPUT=$1

# Check if file exists
if [ ! -f "$INPUT" ]; then
    echo "Error: File $INPUT not found!"
    exit 1
fi

echo "=== FASTA Statistics for $INPUT ==="

# Count sequences
SEQ_COUNT=$(grep -c "^>" "$INPUT")
echo "Number of sequences: $SEQ_COUNT"

# Calculate total length
TOTAL_LENGTH=$(grep -v "^>" "$INPUT" | tr -d '\n' | wc -c)
echo "Total length: $TOTAL_LENGTH bp"

# Average length
AVG_LENGTH=$((TOTAL_LENGTH / SEQ_COUNT))
echo "Average length: $AVG_LENGTH bp"

# Count the N's (unassembled gaps)
N_COUNT=$(grep -v "^>" "$INPUT" | tr -cd 'Nn' | wc -c)
echo "N bases: $N_COUNT"

# GC content
GC_COUNT=$(grep -v "^>" "$INPUT" | tr 'acgt' 'ACGT' | tr -d '\n' | grep -o "[GC]" | wc -l)
GC_PERCENT=$((GC_COUNT * 100 / TOTAL_LENGTH))
echo "GC content: $GC_PERCENT%"

# ORF-like stretches: uppercase-only pattern - the soft-masking does the filtering
ORF_COUNT=$(grep -v "^>" "$INPUT" | tr -d '\n' | grep -oE "ATG([ACGT]{3}){20,}(TAA|TAG|TGA)" | wc -l)
echo "ORF-like stretches: $ORF_COUNT"
