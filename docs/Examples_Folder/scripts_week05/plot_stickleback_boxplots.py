#!/usr/bin/env python3
#
# plot_stickleback_boxplots.py - read the course dataset and write boxplots to an SVG
#
# The warm-up script from Lecture 05: week 3's plot_stickleback.py,
# lightly upgraded to write a *vector* SVG figure instead of a PNG.
#
# Usage, from your course folder (~/projects/comptools):
#   chmod +x scripts/plot_stickleback_boxplots.py     # once
#   ./scripts/plot_stickleback_boxplots.py
#
# Output: results/total_counts_by_group.svg

# ----- 0. Setup ----------------------------------------------------------
from pathlib import Path

import pandas as pd
import matplotlib
matplotlib.use("Agg")                 # draw straight to a file - no window
import matplotlib.pyplot as plt

# ----- 1. Find the data --------------------------------------------------
# Look in the usual course locations; fall back to the course website
# (pandas can read a URL just like a local path).
candidates = [
    Path("data/Stickle_RNAseq.tsv"),            # from ~/projects/comptools
    Path("Data_Folder/Stickle_RNAseq.tsv"),     # from the repo root
    Path("../Data_Folder/Stickle_RNAseq.tsv"),  # from Examples_Folder
]
found = [p for p in candidates if p.exists()]
infile = (
    found[0]
    if found
    else "https://wcresko.github.io/BioE_Comp_Tools_Fa2026/Data_Folder/Stickle_RNAseq.tsv"
)

# ----- 2. Read the tidy table --------------------------------------------
stickle = pd.read_csv(infile, sep="\t")
print(f"Read {infile}: {stickle.shape[0]} fish x {stickle.shape[1]} columns")

# ----- 3. One number per fish --------------------------------------------
# Total RNA-seq reads across the 600 gene columns (axis=1 = "per row").
genes = [c for c in stickle.columns if c.startswith("Gene")]
totals = pd.DataFrame({
    "Group": stickle["Geno&Micro"],
    "Total": stickle[genes].sum(axis=1),
})

# ----- 4. Draw and save the figure ---------------------------------------
# The file extension picks the format: .svg here, .png or .pdf work too.
totals.boxplot(column="Total", by="Group")
plt.suptitle("")                      # drop pandas' default super-title
plt.title("Stickleback gut RNA-seq: total counts by group")
plt.xlabel("Genotype x microbiota group")
plt.ylabel("Total reads per fish")

out_dir = Path("results")
out_dir.mkdir(exist_ok=True)          # make results/ if it doesn't exist
out_file = out_dir / "total_counts_by_group.svg"
plt.savefig(out_file)
print(f"Wrote {out_file}")
