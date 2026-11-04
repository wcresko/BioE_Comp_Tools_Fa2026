# Course dataset: stickleback gut RNA-seq

`Stickle_RNAseq.tsv` is the running example used throughout the course - at the shell, in R and Python, on Talapas, and in Quarto reports.

- **What it is:** RNA-seq gene-expression counts from the gut of 80 threespine stickleback (*Gasterosteus aculeatus*) from the Cresko Lab.
- **Design:** 2 host genotypes (A, B) x 2 microbiota treatments (conventional, mono-associated) = 4 groups of 20 fish.
- **Shape:** 81 lines (1 header + 80 fish), 604 tab-separated columns: `Individual`, `Genotype`, `Microbiota`, `Geno&Micro`, then `Gene1` ... `Gene600` (raw read counts).
- **Format:** plain text, tab-separated, Unix (LF) line endings, ~160 KB.

Download from the course site: <https://wcresko.github.io/BioE_Comp_Tools_Fa2026/Data_Folder/Stickle_RNAseq.tsv>

# HW1 dataset: hydrogel BMP-2 release

`Hydrogel_BMP2_release.csv` is the dataset for Homework 1, Question 2 (R/Python analysis).

- **What it is:** Simulated 3-day BMP-2 release assay from GelMA hydrogels (ELISA-style cumulative release), generated for the assignment.
- **Design:** 2 formulations (5% and 10% w/v GelMA) x 20 replicate gels = 40 gels, each loaded with 10 ug BMP-2.
- **Shape:** 41 lines (1 header + 40 gels), 8 comma-separated columns: `gel_id`, `formulation`, `replicate`, `bmp2_loaded_ug`, `release_day1_ug`, `release_day2_ug`, `release_day3_ug`, `diffusion_rate_ug_per_day`.
- **Format:** plain text, comma-separated, Unix (LF) line endings, ~2 KB.
- **Ground truth (for grading):** 5% gels diffuse faster (mean ~2.80 ug/day, sd ~0.25) than 10% gels (mean ~1.63 ug/day, sd ~0.18); medians ~2.81 and ~1.59.

Download from the course site: <https://wcresko.github.io/BioE_Comp_Tools_Fa2026/Data_Folder/Hydrogel_BMP2_release.csv>
