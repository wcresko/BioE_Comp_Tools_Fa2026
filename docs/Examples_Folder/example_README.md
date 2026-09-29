<!--
This is an EXAMPLE README for the BioE Computational Tools course,
showing what the top-level README.md of a GitHub repository for a
genomics study typically looks like. The study, authors, and data
accession numbers below are fictional placeholders — do not try to
download them. The reference-genome accession is real.
-->

# stickleback-gut-rnaseq

Analysis code and processed data for:

> Doe, J., Roe, R., and Poe, E. (2026). Host genotype shapes the gut
> transcriptional response to microbiota in threespine stickleback.
> *Journal of Fish Genomics* 12:345–367. doi:10.1234/jfg.2026.0042

This repository contains everything needed to reproduce the figures
and statistical results in the paper, starting from the processed
gene-count table. Raw sequencing reads are archived at NCBI (see
[Data availability](#data-availability)).

## Overview

We raised 80 threespine stickleback (*Gasterosteus aculeatus*) from
two host genotypes under two microbiota treatments (conventional
vs. mono-associated; n = 20 per group) and profiled gut gene
expression with RNA-seq. The analysis tests for genotype, microbiota,
and genotype-by-microbiota effects on gene expression.

## Data availability

| Data | Repository | Accession |
|------|------------|-----------|
| Raw sequencing reads (FASTQ) | [NCBI SRA](https://www.ncbi.nlm.nih.gov/sra) | BioProject [PRJNA000000](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA000000) |
| Processed gene counts | [NCBI GEO](https://www.ncbi.nlm.nih.gov/geo/) | Series [GSE000000](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE000000) |
| Sample metadata | NCBI BioSample | SAMN00000001–SAMN00000080 |
| Reference genome | [NCBI Assembly](https://www.ncbi.nlm.nih.gov/assembly) | [GCF_016920845.1](https://www.ncbi.nlm.nih.gov/assembly/GCF_016920845.1/) (GAculeatus_UGA_version5) |

Small processed files (< 10 MB) are versioned directly in `data/`.
Raw reads are **not** stored in this repository; download them from
the SRA BioProject above (e.g. with `prefetch`/`fasterq-dump` from
the [SRA Toolkit](https://github.com/ncbi/sra-tools)).

## Repository structure

```
stickleback-gut-rnaseq/
├── README.md              <- you are here
├── LICENSE
├── environment.yml        <- conda environment (exact versions)
├── data/
│   ├── README.md          <- provenance and md5 checksums
│   ├── gene_counts.tsv    <- 80 fish x 600 genes, raw counts
│   └── sample_metadata.tsv
├── scripts/
│   ├── 01_download_reads.sh   <- fetch FASTQs from SRA
│   ├── 02_align_count.sh      <- STAR alignment + featureCounts
│   ├── 03_normalize.R         <- filtering and log2 CPM
│   ├── 04_linear_models.R     <- per-gene genotype x microbiota models
│   └── 05_figures.R           <- all main-text figures
├── results/
│   ├── model_coefficients.tsv
│   └── figures/
└── docs/
    └── lab_notebook/      <- dated analysis notebooks (Quarto)
```

## Requirements

- R >= 4.3 with `tidyverse`, `limma`, and `edgeR`
- Python >= 3.10 with `pandas` and `snakemake` (pipeline only)
- STAR 2.7.11, featureCounts (subread 2.0.6) — alignment steps only

Recreate the exact environment with:

```bash
conda env create -f environment.yml
conda activate stickle-rnaseq
```

## Reproducing the analysis

Steps 1–2 (download and alignment) require ~200 GB of scratch space
and a cluster; most users should start at step 3 with the processed
counts already in `data/`.

```bash
# 1. (optional) download raw reads from SRA
bash scripts/01_download_reads.sh

# 2. (optional) align and count
bash scripts/02_align_count.sh

# 3. normalize counts and fit models
Rscript scripts/03_normalize.R
Rscript scripts/04_linear_models.R

# 4. regenerate figures into results/figures/
Rscript scripts/05_figures.R
```

Expected runtime for steps 3–4: about 5 minutes on a laptop.

## How to cite

If you use these data or scripts, please cite the paper above and
the BioProject accession PRJNA000000.

## License

Code is released under the [MIT License](LICENSE). Data files are
released under [CC0](https://creativecommons.org/publicdomain/zero/1.0/);
please cite the source publication.

## Contact

Questions and bug reports: open a
[GitHub issue](https://github.com/example-lab/stickleback-gut-rnaseq/issues)
or email jdoe@example.edu.
