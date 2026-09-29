# Example files

Small, complete examples of the file types you will work with in
this course. Every file is meant to be **opened, edited, and run in
Positron** — download it (or clone the repo), break it, fix it,
make it your own.

The two scripts and both notebook templates all analyze the same
course dataset (`Data_Folder/Stickle_RNAseq.tsv`) with the same
steps — read the data, normalize counts, fit a linear model, make
plots — so you can compare languages and formats side by side.

| File | What it is |
|------|------------|
| `example_analysis.R` | R script: read → explore → normalize → linear model → plots |
| `example_analysis.py` | Python script: the same analysis, line for line |
| `lab_notebook_template.qmd` | Quarto (R) template for a computational lab notebook, with a worked example entry |
| `lab_notebook_template.ipynb` | Jupyter (Python) version of the same lab notebook template |
| `example_README.md` | Example README.md for a GitHub repository holding genomic data and analysis scripts, with NCBI data-deposit links |

## Notes

- **Data paths.** The scripts look for the dataset at
  `Data_Folder/Stickle_RNAseq.tsv` (relative to the repo root) or
  `../Data_Folder/` (relative to this folder), and otherwise
  download it from the course website — so each file also runs as a
  standalone download.
- **R packages:** `readr`, `dplyr`, `ggplot2`
  (`install.packages(c("readr", "dplyr", "ggplot2"))`).
- **Python packages:** `pandas`, `numpy`, `matplotlib`, `seaborn`,
  and `statsmodels` for the linear model
  (`pip install statsmodels` if it is not already installed).
- The Markdown example (`example_README.md`) is best viewed both
  ways: rendered (click it on GitHub) and as source (open it in
  Positron) — note the HTML comment at the top, which only shows in
  the source.
