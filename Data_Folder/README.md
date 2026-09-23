# Course dataset: stickleback gut RNA-seq

`Stickle_RNAseq.tsv` is the running example used throughout the course - at the shell, in R and Python, on Talapas, and in Quarto reports.

- **What it is:** RNA-seq gene-expression counts from the gut of 80 threespine stickleback (*Gasterosteus aculeatus*) from the Cresko Lab.
- **Design:** 2 host genotypes (A, B) x 2 microbiota treatments (conventional, mono-associated) = 4 groups of 20 fish.
- **Shape:** 81 lines (1 header + 80 fish), 604 tab-separated columns: `Individual`, `Genotype`, `Microbiota`, `Geno&Micro`, then `Gene1` ... `Gene600` (raw read counts).
- **Format:** plain text, tab-separated, Unix (LF) line endings, ~160 KB.

Download from the course site: <https://wcresko.github.io/BioE_Comp_Tools_Fa2026/Data_Folder/Stickle_RNAseq.tsv>
