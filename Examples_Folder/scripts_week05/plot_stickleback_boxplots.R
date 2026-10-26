#!/usr/bin/env Rscript
#
# plot_stickleback_boxplots.R - read the course dataset and write boxplots to an SVG
#
# The warm-up script from Lecture 05: the same job as week 3's
# plot_stickleback.py, now in R, and writing a *vector* SVG figure
# instead of a PNG.
#
# Usage, from your course folder (~/projects/comptools):
#   chmod +x scripts/plot_stickleback_boxplots.R      # once
#   ./scripts/plot_stickleback_boxplots.R
#
# Output: results/total_counts_by_group.svg

# ----- 1. Find the data --------------------------------------------------
# Look in the usual course locations; fall back to the course website
# (read.delim can read a URL just like a local path).
candidates <- c(
  "data/Stickle_RNAseq.tsv",            # from ~/projects/comptools
  "Data_Folder/Stickle_RNAseq.tsv",     # from the repo root
  "../Data_Folder/Stickle_RNAseq.tsv"   # from Examples_Folder
)
found  <- candidates[file.exists(candidates)]
infile <- if (length(found) > 0) {
  found[1]
} else {
  "https://wcresko.github.io/BioE_Comp_Tools_Fa2026/Data_Folder/Stickle_RNAseq.tsv"
}

# ----- 2. Read the tidy table --------------------------------------------
# check.names = FALSE keeps the awkward column name "Geno&Micro" exactly
# as it is in the file (otherwise R would rename it to "Geno.Micro").
stickle <- read.delim(infile, check.names = FALSE)
cat("Read", infile, ":", nrow(stickle), "fish x", ncol(stickle), "columns\n")

# ----- 3. One number per fish --------------------------------------------
# Total RNA-seq reads across the 600 gene columns.
genes  <- grep("^Gene", names(stickle))   # positions of the gene columns
totals <- rowSums(stickle[, genes])       # row sums = one total per fish
group  <- stickle[["Geno&Micro"]]         # [[ ]] works for any column name

# ----- 4. Draw and save the figure ---------------------------------------
# Pattern: open a file 'device' -> plot -> dev.off(). ALWAYS dev.off().
dir.create("results", showWarnings = FALSE)
outfile <- "results/total_counts_by_group.svg"
svg(outfile, width = 7, height = 5)
boxplot(totals ~ group,
        xlab = "Genotype x microbiota group",
        ylab = "Total reads per fish",
        main = "Stickleback gut RNA-seq: total counts by group")
dev.off()
cat("Wrote", outfile, "\n")
