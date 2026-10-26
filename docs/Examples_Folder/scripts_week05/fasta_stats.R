#!/usr/bin/env Rscript
# Script: fasta_stats.R
# Purpose: Calculate basic statistics for a FASTA file
#
# The L04 shell script fasta_stats.sh, rewritten in R (Lecture 05).
# Same job, same ORF regex - but counting and arithmetic are far more
# natural here than in bash.
#
# Usage:
#   Rscript fasta_stats.R sequences.fasta
#   # or: chmod +x fasta_stats.R && ./fasta_stats.R sequences.fasta

args <- commandArgs(trailingOnly = TRUE)     # like $1 $2 ... in bash
if (length(args) != 1) {
  cat("Usage: Rscript fasta_stats.R sequences.fasta\n")
  quit(status = 1)
}
input <- args[1]
if (!file.exists(input)) {
  cat("Error: File", input, "not found!\n")
  quit(status = 1)
}

lines   <- readLines(input)
headers <- grepl("^>", lines)                # TRUE for header lines
seq     <- paste(lines[!headers], collapse = "")

cat("=== FASTA Statistics for", input, "===\n")
cat("Number of sequences:", sum(headers), "\n")
cat("Total length:", nchar(seq), "bp\n")
cat("Average length:", nchar(seq) / sum(headers), "bp\n")
n_count <- sum(strsplit(seq, "")[[1]] %in% c("N", "n"))
cat("N bases:", n_count, "\n")
gc <- sum(strsplit(toupper(seq), "")[[1]] %in% c("G", "C"))
cat("GC content:", round(100 * gc / nchar(seq), 1), "%\n")
orfs <- regmatches(seq, gregexpr("ATG([ACGT]{3}){20,}(TAA|TAG|TGA)", seq))[[1]]
cat("ORF-like stretches:", length(orfs), "\n")
