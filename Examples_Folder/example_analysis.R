# ===================================================================
# example_analysis.R
# BioE Computational Tools, Fall 2026 — example R script
#
# A small but complete analysis of the course RNA-seq dataset:
#   read the data -> explore -> normalize -> fit a linear model ->
#   check the model -> make plots
#
# This script is deliberately parallel to example_analysis.py.
# Open the two side by side in Positron to compare R and Python.
#
# To run in Positron: put the cursor on a line and press
# Cmd/Ctrl + Enter to run it (or a selection), or click
# "Source" to run the whole file at once.
# ===================================================================

## 0. Setup ---------------------------------------------------------
# Install once (not every run) with:
#   install.packages(c("readr", "dplyr", "ggplot2"))
library(readr)    # read rectangular text files
library(dplyr)    # manipulate data frames
library(ggplot2)  # make plots

## 1. Read the data -------------------------------------------------
# Gut RNA-seq counts from 80 threespine stickleback: 2 host
# genotypes (A, B) x 2 microbiota treatments (conventional, mono),
# 600 genes. See Data_Folder/README.md for details.
#
# Look for the file locally first (the path depends on your working
# directory); fall back to downloading it from the course website.
local_paths <- c(
  "Data_Folder/Stickle_RNAseq.tsv",    # working dir = repo root
  "../Data_Folder/Stickle_RNAseq.tsv"  # working dir = Examples_Folder
)
found <- local_paths[file.exists(local_paths)]
data_file <- if (length(found) > 0) {
  found[1]
} else {
  "https://wcresko.github.io/BioE_Comp_Tools_Fa2026/Data_Folder/Stickle_RNAseq.tsv"
}

stickle <- read_tsv(data_file, show_col_types = FALSE)

## 2. First look at the data ----------------------------------------
dim(stickle)                          # 80 fish x 604 columns
stickle[1:5, 1:8]                     # peek at the top-left corner
count(stickle, Genotype, Microbiota)  # 4 groups of 20 fish

## 3. Library sizes and normalization -------------------------------
# Each fish was sequenced to a different total depth ("library
# size"), so raw counts are not comparable across fish. A simple
# fix: convert counts to log2 counts-per-million (CPM).
stickle <- stickle |>
  mutate(lib_size = rowSums(across(starts_with("Gene"))))

# Keep just the columns we need, adding log2 CPM for two genes.
focal <- stickle |>
  transmute(
    Individual, Genotype, Microbiota, lib_size,
    gene369 = log2(Gene369 / lib_size * 1e6 + 1),
    gene208 = log2(Gene208 / lib_size * 1e6 + 1)
  )

summary(focal$lib_size)

## 4. Plot: sequencing depth per fish -------------------------------
ggplot(focal, aes(x = lib_size / 1e6)) +
  geom_histogram(bins = 20, fill = "steelblue", color = "white") +
  labs(
    x = "Library size (millions of reads)",
    y = "Number of fish",
    title = "Sequencing depth varies among fish"
  ) +
  theme_minimal()

## 5. Plot: Gene369 expression by group -----------------------------
ggplot(focal, aes(x = Microbiota, y = gene369, fill = Genotype)) +
  geom_boxplot(outlier.shape = NA, alpha = 0.6) +
  geom_point(
    position = position_jitterdodge(jitter.width = 0.15),
    size = 1.5, alpha = 0.6
  ) +
  labs(
    y = "Gene369 expression (log2 CPM)",
    title = "Gene369 responds to genotype and microbiota"
  ) +
  theme_minimal()

## 6. Fit a linear model --------------------------------------------
# Does Gene369 expression depend on host genotype, microbiota
# treatment, and their interaction?
fit <- lm(gene369 ~ Genotype * Microbiota, data = focal)
summary(fit)  # coefficients: effect sizes, standard errors, tests
anova(fit)    # ANOVA table: variation explained by each term

## 7. Check the residuals -------------------------------------------
# Residuals should scatter symmetrically around zero with no
# trend across the fitted values.
plot(fit, which = 1)

## 8. Plot: co-expression of two genes ------------------------------
ggplot(focal, aes(x = gene208, y = gene369)) +
  geom_point(aes(color = Genotype), size = 2, alpha = 0.7) +
  geom_smooth(method = "lm", formula = y ~ x, color = "black") +
  labs(
    x = "Gene208 expression (log2 CPM)",
    y = "Gene369 expression (log2 CPM)",
    title = "Gene208 and Gene369 are co-expressed"
  ) +
  theme_minimal()

## 9. Saving results (examples; uncomment to use) --------------------
# ggsave("gene369_coexpression.png", width = 6, height = 4, dpi = 300)
# write_csv(focal, "focal_gene_expression.csv")

## 10. Record your session ------------------------------------------
# Always know which package versions produced a result.
sessionInfo()
