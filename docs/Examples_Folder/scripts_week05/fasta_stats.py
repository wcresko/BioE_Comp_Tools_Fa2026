#!/usr/bin/env python3
# Script: fasta_stats.py
# Purpose: Calculate basic statistics for a FASTA file
#
# The L04 shell script fasta_stats.sh, rewritten in Python (Lecture 05).
# Same job, same ORF regex - note the raw string r"..." and the
# non-capturing groups (?: ... ) that keep re.findall() returning
# whole matches.
#
# Usage:
#   python3 fasta_stats.py sequences.fasta
#   # or: chmod +x fasta_stats.py && ./fasta_stats.py sequences.fasta

import re
import sys
from pathlib import Path

if len(sys.argv) != 2:                       # sys.argv[0] is the script name, like $0
    print("Usage: python3 fasta_stats.py sequences.fasta")
    sys.exit(1)
input_file = Path(sys.argv[1])
if not input_file.is_file():
    print(f"Error: File {input_file} not found!")
    sys.exit(1)

lines   = input_file.read_text().splitlines()
headers = [line for line in lines if line.startswith(">")]
seq     = "".join(line for line in lines if not line.startswith(">"))

print(f"=== FASTA Statistics for {input_file} ===")
print(f"Number of sequences: {len(headers)}")
print(f"Total length: {len(seq)} bp")
print(f"Average length: {len(seq) / len(headers):.1f} bp")
n_count = seq.count("N") + seq.count("n")
print(f"N bases: {n_count}")
gc = seq.upper().count("G") + seq.upper().count("C")
print(f"GC content: {100 * gc / len(seq):.1f}%")
orfs = re.findall(r"ATG(?:[ACGT]{3}){20,}(?:TAA|TAG|TGA)", seq)
print(f"ORF-like stretches: {len(orfs)}")
