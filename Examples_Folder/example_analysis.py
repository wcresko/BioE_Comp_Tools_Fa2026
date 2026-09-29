# ===================================================================
# example_analysis.py
# BioE Computational Tools, Fall 2026 — example Python script
#
# A small but complete analysis of the course RNA-seq dataset:
#   read the data -> explore -> normalize -> fit a linear model ->
#   check the model -> make plots
#
# This script is deliberately parallel to example_analysis.R.
# Open the two side by side in Positron to compare Python and R.
#
# To run in Positron: put the cursor on a line and press
# Cmd/Ctrl + Enter to run it (or a selection), or run the whole
# file with the "Run" button at the top of the editor.
# ===================================================================

## 0. Setup ---------------------------------------------------------
# Install once (not every run) with:
#   pip install pandas numpy matplotlib seaborn statsmodels
from pathlib import Path

import numpy as np              # numerical computing
import pandas as pd             # manipulate data frames
import matplotlib.pyplot as plt # make plots
import seaborn as sns           # nicer statistical plots

try:
    import statsmodels.api as sm
    import statsmodels.formula.api as smf  # R-style model formulas
except ImportError:
    raise SystemExit(
        "This script needs the 'statsmodels' package.\n"
        "Install it into your course environment with:\n"
        "    pip install statsmodels"
    )

## 1. Read the data -------------------------------------------------
# Gut RNA-seq counts from 80 threespine stickleback: 2 host
# genotypes (A, B) x 2 microbiota treatments (conventional, mono),
# 600 genes. See Data_Folder/README.md for details.
#
# Look for the file locally first (the path depends on your working
# directory); fall back to downloading it from the course website.
local_paths = [
    Path("Data_Folder/Stickle_RNAseq.tsv"),     # working dir = repo root
    Path("../Data_Folder/Stickle_RNAseq.tsv"),  # working dir = Examples_Folder
]
found = [p for p in local_paths if p.exists()]
if found:
    data_file = found[0]
else:
    data_file = "https://wcresko.github.io/BioE_Comp_Tools_Fa2026/Data_Folder/Stickle_RNAseq.tsv"

stickle = pd.read_csv(data_file, sep="\t")

## 2. First look at the data ----------------------------------------
print(stickle.shape)                     # 80 fish x 604 columns
print(stickle.iloc[:5, :8])              # peek at the top-left corner
print(stickle.value_counts(["Genotype", "Microbiota"]))  # 4 groups of 20

## 3. Library sizes and normalization -------------------------------
# Each fish was sequenced to a different total depth ("library
# size"), so raw counts are not comparable across fish. A simple
# fix: convert counts to log2 counts-per-million (CPM).
gene_cols = [c for c in stickle.columns if c.startswith("Gene")]
stickle["lib_size"] = stickle[gene_cols].sum(axis=1)

# Keep just the columns we need, adding log2 CPM for two genes.
focal = stickle[["Individual", "Genotype", "Microbiota", "lib_size"]].copy()
focal["gene369"] = np.log2(stickle["Gene369"] / stickle["lib_size"] * 1e6 + 1)
focal["gene208"] = np.log2(stickle["Gene208"] / stickle["lib_size"] * 1e6 + 1)

print(focal["lib_size"].describe())

## 4. Plot: sequencing depth per fish -------------------------------
fig, ax = plt.subplots(figsize=(6, 4))
sns.histplot(x=focal["lib_size"] / 1e6, bins=20, color="steelblue", ax=ax)
ax.set_xlabel("Library size (millions of reads)")
ax.set_ylabel("Number of fish")
ax.set_title("Sequencing depth varies among fish")
fig.tight_layout()
plt.show()

## 5. Plot: Gene369 expression by group -----------------------------
fig, ax = plt.subplots(figsize=(6, 4))
sns.boxplot(
    data=focal, x="Microbiota", y="gene369", hue="Genotype",
    showfliers=False, boxprops={"alpha": 0.6}, ax=ax,
)
sns.stripplot(
    data=focal, x="Microbiota", y="gene369", hue="Genotype",
    dodge=True, size=4, alpha=0.6, legend=False, ax=ax,
)
ax.set_ylabel("Gene369 expression (log2 CPM)")
ax.set_title("Gene369 responds to genotype and microbiota")
fig.tight_layout()
plt.show()

## 6. Fit a linear model --------------------------------------------
# Does Gene369 expression depend on host genotype, microbiota
# treatment, and their interaction?
fit = smf.ols("gene369 ~ Genotype * Microbiota", data=focal).fit()
print(fit.summary())          # coefficients: effect sizes, SEs, tests
print(sm.stats.anova_lm(fit)) # ANOVA table: variation per term

## 7. Check the residuals -------------------------------------------
# Residuals should scatter symmetrically around zero with no
# trend across the fitted values.
fig, ax = plt.subplots(figsize=(6, 4))
ax.scatter(fit.fittedvalues, fit.resid, alpha=0.7)
ax.axhline(0, color="gray", linestyle="--")
ax.set_xlabel("Fitted values")
ax.set_ylabel("Residuals")
ax.set_title("Residuals vs. fitted")
fig.tight_layout()
plt.show()

## 8. Plot: co-expression of two genes ------------------------------
fig, ax = plt.subplots(figsize=(6, 4))
sns.scatterplot(
    data=focal, x="gene208", y="gene369", hue="Genotype",
    s=45, alpha=0.7, ax=ax,
)
sns.regplot(
    data=focal, x="gene208", y="gene369",
    scatter=False, color="black", ax=ax,
)
ax.set_xlabel("Gene208 expression (log2 CPM)")
ax.set_ylabel("Gene369 expression (log2 CPM)")
ax.set_title("Gene208 and Gene369 are co-expressed")
fig.tight_layout()
plt.show()

## 9. Saving results (examples; uncomment to use) --------------------
# fig.savefig("gene369_coexpression.png", dpi=300)
# focal.to_csv("focal_gene_expression.csv", index=False)

## 10. Record your session ------------------------------------------
# Always know which package versions produced a result.
import sys
print("Python:", sys.version)
for mod in (np, pd, sns):
    print(mod.__name__, mod.__version__)
import matplotlib
print("matplotlib", matplotlib.__version__)
import statsmodels
print("statsmodels", statsmodels.__version__)
