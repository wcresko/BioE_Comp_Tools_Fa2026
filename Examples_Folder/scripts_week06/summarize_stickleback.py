#!/usr/bin/env python3
# Script: summarize_stickleback.py
# Purpose: per-group medians for one gene (CSV) + the four-distribution
#          gallery from Lecture 06, saved as SVG and 300-dpi PNG
# Usage:   ./summarize_stickleback.py [gene]      e.g. ./summarize_stickleback.py Gene42
#          (default gene: Gene1; run from the project root)

import sys
from pathlib import Path

import numpy as np
import pandas as pd
import matplotlib
matplotlib.use("Agg")                 # draw straight to files - no window
import matplotlib.pyplot as plt

gene = sys.argv[1] if len(sys.argv) > 1 else "Gene1"

infile = Path("data/Stickle_RNAseq.tsv")
if not infile.is_file():
    print(f"Error: File {infile} not found! Run from the project root.")
    sys.exit(1)

stickle = pd.read_csv(infile, sep="\t")
if gene not in stickle.columns:
    print(f"Error: no column called {gene} in {infile}")
    sys.exit(1)

Path("results").mkdir(exist_ok=True)

# --- 1. per-group medians, written as a CSV --------------------------------
medians = (stickle
           .groupby(["Genotype", "Microbiota"], as_index=False)
           .agg(**{f"median_{gene}": (gene, "median")}))

outfile = Path("results") / f"{gene}_group_medians.csv"
medians.to_csv(outfile, index=False)
print(f"Wrote {outfile}")

# --- 2. the distribution gallery, as SVG and 300-dpi PNG -------------------
rng = np.random.default_rng(2026)
n = 2000
draws = {"Normal(50, 10)":    rng.normal(50, 10, n),
         "Uniform(0, 100)":   rng.uniform(0, 100, n),
         "Poisson(5)":        rng.poisson(5, n),
         "Binomial(20, 0.3)": rng.binomial(20, 0.3, n)}

fig, ax = plt.subplots(2, 2, figsize=(8, 6))
for a, (name, d), c in zip(ax.flat, draws.items(),
                           ["#440154", "#31688e", "#35b779", "#fde725"]):
    bins = 40 if d.dtype == float else np.arange(d.max() + 2) - 0.5
    a.hist(d, bins=bins, color=c, edgecolor="white")
    a.set_title(name)
fig.tight_layout()
fig.savefig("results/distributions.svg")
fig.savefig("results/distributions.png", dpi=300)
print("Wrote results/distributions.svg and results/distributions.png")
