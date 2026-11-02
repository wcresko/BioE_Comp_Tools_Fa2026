#!/usr/bin/env Rscript
# Script: summarize_stickleback.R
# Purpose: per-group medians for one gene (CSV) + the four-distribution
#          gallery from Lecture 06, saved as SVG and 300-dpi PNG
# Usage:   ./summarize_stickleback.R [gene]        e.g. ./summarize_stickleback.R Gene42
#          (default gene: Gene1; run from the project root)

args <- commandArgs(trailingOnly = TRUE)
gene <- if (length(args) >= 1) args[1] else "Gene1"

infile <- "data/Stickle_RNAseq.tsv"
if (!file.exists(infile)) {
  cat("Error: File", infile, "not found! Run from the project root.\n")
  quit(status = 1)
}

stickle <- read.delim(infile, check.names = FALSE)
if (!gene %in% names(stickle)) {
  cat("Error: no column called", gene, "in", infile, "\n")
  quit(status = 1)
}

dir.create("results", showWarnings = FALSE)

# --- 1. per-group medians, written as a CSV --------------------------------
medians <- aggregate(as.formula(paste(gene, "~ Genotype + Microbiota")),
                     data = stickle, FUN = median)
names(medians)[3] <- paste0("median_", gene)

outfile <- file.path("results", paste0(gene, "_group_medians.csv"))
write.csv(medians, outfile, row.names = FALSE)
cat("Wrote", outfile, "\n")

# --- 2. the distribution gallery, as SVG and 300-dpi PNG -------------------
draw_gallery <- function(n = 2000) {
  par(mfrow = c(2, 2), mar = c(4, 4, 2, 1))
  hist(rnorm(n, 50, 10),   breaks = 40, col = "#440154", border = "white",
       main = "Normal(50, 10)",    xlab = "value")
  hist(runif(n, 0, 100),   breaks = 40, col = "#31688e", border = "white",
       main = "Uniform(0, 100)",   xlab = "value")
  hist(rpois(n, 5),        breaks = seq(-0.5, 20.5, 1), col = "#35b779",
       border = "white", main = "Poisson(5)",        xlab = "count")
  hist(rbinom(n, 20, 0.3), breaks = seq(-0.5, 20.5, 1), col = "#fde725",
       border = "white", main = "Binomial(20, 0.3)", xlab = "successes")
}

set.seed(2026)
svg("results/distributions.svg", width = 8, height = 6)
draw_gallery()
invisible(dev.off())

set.seed(2026)                                  # same draws in both files
png("results/distributions.png", width = 8, height = 6, units = "in", res = 300)
draw_gallery()
invisible(dev.off())

cat("Wrote results/distributions.svg and results/distributions.png\n")
