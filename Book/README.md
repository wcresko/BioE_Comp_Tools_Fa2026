# Foundational Computational Tools for Bioengineers

> This book now lives **inside the course-website repository** (`BioE_Comp_Tools_Fa2026/Book/`) as a nested Quarto book project. It renders to `../docs/book/` and is published alongside the website at <https://wcresko.github.io/BioE_Comp_Tools_Fa2026/book/>.

A comprehensive Quarto book for graduate students in bioengineering and life sciences, covering essential computational skills including Unix/Linux, R and Python programming, version control with Git/GitHub, and high-performance computing.

## About

This book accompanies a graduate-level course taught at the University of Oregon's Phil and Penny Knight Campus for Accelerating Scientific Impact. It provides practical, hands-on instruction in foundational computational tools that are essential for modern research.

## Contents

1. **Introduction to Computational Tools** - Why computational skills matter
2. **Your Computational Toolkit** - Installing R, Python, Quarto; VS Code, Positron, RStudio
3. **Computing Resources at the University of Oregon** - Identity, storage, data classification, backups, RACS, Talapas access
4. **Computer Systems Architecture** - Understanding hardware and operating systems
5. **Unix Fundamentals** - Navigation and basic commands
6. **Files, Pipes, and Redirection** - Data processing pipelines
7. **GREP, Regular Expressions, sed and awk** - Pattern matching and text processing
8. **Shell Scripting** - Automation and reproducibility
9. **R Programming Fundamentals** - Statistical computing basics
10. **Python Programming Fundamentals** - Python 3, NumPy, pandas, matplotlib, and an R-to-Python translation table
11. **Tidy Data Principles** and **Data Visualization with ggplot2**
12. **Writing Functions**, **Parallel Computing**, **Databases**
13. **Reproducible Documents with Quarto** and **LaTeX**
14. **Coding with AI Assistants** - Using LLM tools well and safely
15. **Version Control with Git and GitHub** - Tracking changes and collaboration
16. **High-Performance Computing with Talapas** - Using computing clusters

## Building the Book

### Prerequisites

- [Quarto](https://quarto.org/) (version 1.4 or later)
- [R](https://www.r-project.org/) (version 4.0 or later)
- R packages: `tidyverse`, `gt`, `knitr`
- Python chunks in the book are shown with `eval: false`, so Python is not required to render it

### Build Commands

```bash
# From the repository root:
quarto render                 # renders the website AND (via a post-render hook) the book
quarto render Book --to html  # render just the book -> docs/book/
quarto preview Book           # live preview of the book with reload

# Or from inside Book/:
cd Book && quarto render
quarto render --to pdf        # PDF version
```

### Output

- HTML output is written to `../docs/book/` (the website's `docs/` folder) for GitHub Pages deployment
- PDF output is generated alongside HTML

## Deploying to GitHub Pages

The course website repository already publishes `docs/` via GitHub Pages, so after `./render_all.sh`, commit and push `docs/` and the book appears at `https://wcresko.github.io/BioE_Comp_Tools_Fa2026/book/`.

## Directory Structure

```
BioE_Comp_Tools_Fa2026/Book/
├── _quarto.yml          # Book configuration
├── index.qmd            # Preface
├── references.qmd       # Bibliography page
├── references.bib       # BibTeX references
├── custom.scss          # Custom styling
├── apa.csl              # Citation style
├── chapters/            # Chapter content
│   ├── 01-introduction.qmd
│   ├── 02-computer-systems.qmd
│   ├── 03-unix-fundamentals.qmd
│   ├── 04-files-pipes.qmd
│   ├── 05-grep-regex.qmd
│   ├── 06-shell-scripting.qmd
│   ├── 07-r-programming.qmd
│   ├── 08-tidy-data.qmd
│   ├── 09-data-visualization.qmd
│   ├── 10-git-github.qmd
│   ├── 11-hpc-talapas.qmd
│   ├── 12-quarto-documents.qmd
│   ├── 13-writing-functions.qmd
│   ├── 14-parallel-computing.qmd
│   ├── 15-databases.qmd
│   ├── 16-latex-basics.qmd
│   ├── 17-ai-assisted-coding.qmd
│   ├── 18-python-programming.qmd
│   └── appendix-*.qmd   # unix, git, r, python, latex, slurm, regex, shortcuts, data-formats, glossary
├── images/              # Image assets
└── (renders to ../docs/book/)
```

## Customization

### Styling

Edit `custom.scss` to modify colors, fonts, and other visual elements. The book uses University of Oregon colors by default.

### Adding Chapters

1. Create a new `.qmd` file in the `chapters/` directory
2. Add the chapter to the `chapters:` list in `_quarto.yml`
3. Render the book

### Images

Place images in the `images/` directory and reference them in chapters:

```markdown
![Caption](../images/filename.png)
```

## Author

**William A. Cresko**  
Professor of Biology  
Phil and Penny Knight Campus for Accelerating Scientific Impact  
University of Oregon

## License

This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License (CC BY-NC-SA 4.0).

## Acknowledgments

- Research Advanced Computing Services (RACS) at the University of Oregon
- Software Carpentry for foundational teaching materials
- The R and Quarto communities
