#!/usr/bin/env python3
# Script: plot_gene_panel.py
# Purpose: the Lecture 06/07 "destination figure" (faceted violins + jittered
#          points) for any set of genes, saved as SVG and 300-dpi PNG
# Usage:   ./plot_gene_panel.py [gene gene ...]   e.g. ./plot_gene_panel.py Gene10 Gene20 Gene30 Gene40
#          (default: Gene1 Gene2 Gene3 Gene4; run from the project root)

import sys
from pathlib import Path

import pandas as pd
import matplotlib
matplotlib.use("Agg")                 # draw straight to files - no window
import matplotlib.pyplot as plt
import seaborn as sns

genes = sys.argv[1:] if len(sys.argv) > 1 else [f"Gene{i}" for i in range(1, 5)]

infile = Path("data/Stickle_RNAseq.tsv")
if not infile.is_file():
    print(f"Error: File {infile} not found! Run from the project root.")
    sys.exit(1)

stickle = pd.read_csv(infile, sep="\t")
missing = [g for g in genes if g not in stickle.columns]
if missing:
    print(f"Error: no column(s) called {', '.join(missing)} in {infile}")
    sys.exit(1)

long = stickle.melt(id_vars=["Individual", "Genotype", "Microbiota", "Geno&Micro"],
                    value_vars=genes, var_name="gene", value_name="count")

g = sns.catplot(data=long, x="Genotype", y="count", hue="Microbiota",
                col="gene", col_wrap=2, col_order=genes, kind="violin",
                inner="point", palette=["#440154", "#35b779"],
                sharey=False, height=2.6, aspect=1.3)
g.set_axis_labels("Host genotype", "Read count")
g.set_titles("{col_name}")
g.figure.suptitle("Stickleback gut RNA-seq", y=1.02)

Path("results").mkdir(exist_ok=True)
g.figure.savefig("results/gene_panel.svg", bbox_inches="tight")
g.figure.savefig("results/gene_panel.png", bbox_inches="tight", dpi=300)
print(f"Wrote results/gene_panel.svg and results/gene_panel.png for: {', '.join(genes)}")
