#!/usr/bin/env Rscript
# Script: plot_gene_panel.R
# Purpose: the Lecture 06/07 "destination figure" (faceted violins + jittered
#          points) for any set of genes, saved as SVG and 300-dpi PNG
# Usage:   ./plot_gene_panel.R [gene gene ...]    e.g. ./plot_gene_panel.R Gene10 Gene20 Gene30 Gene40
#          (default: Gene1 Gene2 Gene3 Gene4; run from the project root)

suppressPackageStartupMessages(library(tidyverse))

args  <- commandArgs(trailingOnly = TRUE)
genes <- if (length(args) >= 1) args else paste0("Gene", 1:4)

infile <- "data/Stickle_RNAseq.tsv"
if (!file.exists(infile)) {
  cat("Error: File", infile, "not found! Run from the project root.\n")
  quit(status = 1)
}

stickle <- read_tsv(infile, show_col_types = FALSE)
missing <- setdiff(genes, names(stickle))
if (length(missing) > 0) {
  cat("Error: no column(s) called", paste(missing, collapse = ", "), "in", infile, "\n")
  quit(status = 1)
}

panel <- stickle |>
  pivot_longer(starts_with("Gene"), names_to = "gene", values_to = "count") |>
  filter(gene %in% genes) |>
  mutate(gene = factor(gene, levels = genes)) |>        # keep the order asked for
  ggplot(aes(Genotype, count, fill = Microbiota)) +
  geom_violin(alpha = 0.4, color = NA, position = position_dodge(0.8)) +
  geom_point(aes(color = Microbiota), alpha = 0.6, size = 1.2,
             position = position_jitterdodge(jitter.width = 0.08, dodge.width = 0.8)) +
  scale_fill_viridis_d(end = 0.7) + scale_color_viridis_d(end = 0.7) +
  facet_wrap(~ gene, scales = "free_y") +
  labs(x = "Host genotype", y = "Read count",
       title = "Stickleback gut RNA-seq",
       subtitle = "Each point is one fish; violins show the full distribution") +
  theme_minimal(base_size = 14) + theme(legend.position = "top")

dir.create("results", showWarnings = FALSE)
ggsave("results/gene_panel.svg", panel, width = 8, height = 6)
ggsave("results/gene_panel.png", panel, width = 8, height = 6, dpi = 300)
cat("Wrote results/gene_panel.svg and results/gene_panel.png for:",
    paste(genes, collapse = ", "), "\n")
