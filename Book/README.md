# Foundational Computational Tools for Bioengineers

> This book now lives **inside the course-website repository** (`BioE_Comp_Tools_Fa2026/Book/`) as a nested Quarto book project. It renders to `../docs/book/` and is published alongside the website at <https://wcresko.github.io/BioE_Comp_Tools_Fa2026/book/>.

A comprehensive Quarto book for graduate students in bioengineering and life sciences, covering essential computational skills including Unix/Linux, R and Python programming, version control with Git/GitHub, and high-performance computing.

## About

This book accompanies a graduate-level course taught at the University of Oregon's Phil and Penny Knight Campus for Accelerating Scientific Impact. It provides practical, hands-on instruction in foundational computational tools that are essential for modern research.

## Contents

1. Introduction to Computational Tools
2. Your Computational Toolkit
3. Computing Resources at the University of Oregon
4. Computer Systems Architecture
5. Unix Fundamentals
6. Files, Pipes, and Redirection
7. GREP and Regular Expressions
8. Shell Scripting
9. R Programming Fundamentals
10. Python Programming Fundamentals
11. Tidy Data Principles
12. Data Visualization with ggplot2
13. Writing Functions in R
14. Parallel Computing in R
15. Working with Databases
16. Reproducible Documents with Quarto
17. LaTeX for Scientific Documents
18. Coding with AI Assistants
19. Version Control with Git and GitHub
20. High-Performance Computing with Talapas

Appendices A-J: Unix, Git, R, Python, LaTeX, SLURM and regex references; keyboard shortcuts; data formats & public repositories; glossary.

Chapter files in `chapters/` are numbered to match this order (`04-unix-fundamentals.qmd` is Chapter 5; `appendix-B-unix.qmd` is Appendix A), and their figures are named `images/Chap05_img001.svg`, `images/AppA_img001.png`, etc. (see `images/README.md`).

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
│   ├── 06-computer-systems.qmd
│   ├── 04-unix-fundamentals.qmd
│   ├── 07-files-pipes.qmd
│   ├── 09-grep-regex.qmd
│   ├── 10-shell-scripting.qmd
│   ├── 11-r-programming.qmd
│   ├── 08-tidy-data.qmd
│   ├── 13-data-visualization.qmd
│   ├── 19-git-github.qmd
│   ├── 15-hpc-talapas.qmd
│   ├── 05-quarto-documents.qmd
│   ├── 14-writing-functions.qmd
│   ├── 16-parallel-computing.qmd
│   ├── 20-databases.qmd
│   ├── 17-latex-basics.qmd
│   ├── 18-ai-assisted-coding.qmd
│   ├── 12-python-programming.qmd
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
![Caption](../images/Chap05_img001.svg){#fig-example}
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
