#!/usr/bin/env python3
#
# plot_stickleback.py - read the course dataset and make one quick plot
#
# Your first *Python* script (Lecture 03). The script mechanics are
# exactly the same as the week-2 shell scripts - a shebang on line 1,
# `chmod +x` once, then run it with `./` - only the shebang now points
# to python3 instead of bash. The pandas and matplotlib details come
# later (L05-L07); today the point is that scripts are scripts,
# whatever the language inside.
#
# Usage, from your course folder (~/projects/comptools):
#   chmod +x scripts/plot_stickleback.py      # once
#   ./scripts/plot_stickleback.py
#
# Output: results/total_counts_by_group.png

# ----- 0. Setup ---------------------------------------------------------
# Both packages are in the course environment; if not, install once with:
#   pip install pandas matplotlib
from pathlib import Path

import pandas as pd                   # data tables      (L05-L06)
import matplotlib                     # plotting         (L06)
matplotlib.use("Agg")                 # draw straight to a file - no window
import matplotlib.pyplot as plt

# ----- 1. Find the data -------------------------------------------------
# Look in the usual course locations first; if the file isn't there,
# fall back to downloading it from the course website (pandas can read
# a URL just like a local path).
candidates = [
    Path("data/Stickle_RNAseq.tsv"),            # from ~/projects/comptools
    Path("Data_Folder/Stickle_RNAseq.tsv"),     # from the repo root
    Path("../Data_Folder/Stickle_RNAseq.tsv"),  # from Examples_Folder
]
found = [p for p in candidates if p.exists()]
data_file = (
    found[0]
    if found
    else "https://wcresko.github.io/BioE_Comp_Tools_Fa2026/Data_Folder/Stickle_RNAseq.tsv"
)

# ----- 2. Read the tidy table -------------------------------------------
# One line to read the whole thing - possible because the file is TIDY:
# a header line of variable names, one row per fish, one value per cell,
# tab-separated. 80 fish x (4 metadata columns + 600 gene columns).
stickle = pd.read_csv(data_file, sep="\t")
print(f"Read {data_file}: {stickle.shape[0]} fish x {stickle.shape[1]} columns")

# ----- 3. One number per fish -------------------------------------------
# Total RNA-seq reads across the 600 gene columns (axis=1 = "per row"),
# kept in a small two-column table next to each fish's group. (Yes, that
# awkward `Geno&Micro` name - see the tidy-data discussion in Lecture 03.)
genes = [c for c in stickle.columns if c.startswith("Gene")]
totals = pd.DataFrame({
    "Group": stickle["Geno&Micro"],
    "Total": stickle[genes].sum(axis=1),
})

# ----- 4. A quick plot ---------------------------------------------------
# One box per genotype-x-microbiota group.
totals.boxplot(column="Total", by="Group")
plt.ylabel("Total reads per fish")
plt.suptitle("")                      # drop pandas' default super-title
plt.title("Stickleback gut RNA-seq: total counts by group")

# ----- 5. Save the figure ------------------------------------------------
out_dir = Path("results")
out_dir.mkdir(exist_ok=True)          # make results/ if it doesn't exist
out_file = out_dir / "total_counts_by_group.png"
plt.savefig(out_file, dpi=200)
print(f"Wrote {out_file}")
