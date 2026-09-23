# Book audit: lecture content missing from (or enhanceable in) the course book

> **Status (2026-09-22, second pass):** implemented — new chapters *Your Computational Toolkit* (#1, 2, 4, 5, 6, 13, 47, 56-57, 77 in part), *Computing Resources at UO* (#7-11, 17, 72-73), *Coding with AI Assistants* (#16); Talapas updates (#15, 69-71, 74-75); sed/awk (#39-40); book error fixes (#3, 20, 30, 43, 63-65); glossary additions (#79 in part); all lecture-side errors listed at the end, plus Lecture 08's vibe-coding slides.
> **Third pass (2026-09-22):** Python given equal weight — new chapter *Python Programming Fundamentals* (`12-python-programming.qmd`) and *Python Quick Reference* appendix; R/Python tabsets in ch. 6, 7 and 12 (#12, 13); toolkit chapter gained compiler tools, laptop minimums and a setup-troubleshooting section (#5, 6); HPC chapter gained fair-share/backfill, right-sizing (`seff`/`sacct`), pending-reason and `#SBATCH` directive tables, `SLURM_*` variables, software layers, `/scratch` purge, Globus, pipeline design, job arrays and workflow managers (#66-68, 70 in part); data-formats appendix gained *FAIR Data and Public Repositories*; every heading, chunk, figure and table in the book now carries an id and prose cross-references were added throughout; `references.bib` merged with the workshop bibliography and citations added.
> **Still open:** #12, 14, 18-19, 21-29, 31-38, 41-42, 44-46, 48-55, 58-62, 66-68, 76, 78.

Prepared 2026-09-22 after moving the book into `Book/`. Numbers are for picking items to implement.
**M** = missing from the book · **E** = present but can be enhanced from the lecture · **!** = book is out of date or contradicts the lectures.

## Ch. 1 – Introduction (`01-introduction.qmd`)

1. **M** Positron is absent from the whole book (only RStudio). Add Positron to the install list and a short "VS Code vs. Positron / which should I use" subsection from Lecture 00.
2. **M** Setup section lacks Python (python.org, "Add python.exe to PATH", WSL `apt install python3-pip python3-venv`), Quarto + `quarto install tinytex`, and macOS `xcode-select --install`. Add the chip-check table (About This Mac / `uname -m`) since R installers differ.
3. **!/E** WSL steps: book's step 4 ("install Ubuntu from the Store, or `wsl --install -d ubuntu`") is redundant — `wsl --install` already installs Ubuntu. Replace with the bootcamp flow (restart → open Ubuntu → create Linux user → invisible password → `apt update/upgrade`) and add the "Windows: which side am I on?" table (prompts, `/mnt/c/`, `\\wsl$`, R/Python on the Windows side, VS Code "WSL: Ubuntu" badge).
4. **M** A "Your editor" section: VS Code install, Open Folder, Command Palette, integrated terminal, `code .`, extension list (Quarto, Python, R, Jupyter, WSL; Remote-SSH later).
5. **M** Install verification block (`R --version`, `python3 --version`/`py`, `quarto --version`, `quarto check`) and the troubleshooting table (PATH/reopen terminal, Windows Store `python` alias, Gatekeeper, disk space).
6. **M** Laptop minimums callout (≥8 GB RAM, ≥20 GB free, admin rights, no Chromebooks/iPads).
7. **M** Getting help at UO: Duck ID, Duo, when the VPN is/isn't needed; Service Portal, Tech Service Desk, Libraries Data Services (workshops, consults, drop-in desk), RACS; plus the "how to ask a good question" checklist.
8. **M** A new "Where your files live at UO" section (or short appendix): Microsoft 365 table, OneDrive 1 TB, Dropbox eligibility (GEs/staff only since March 2026), "OneDrive is yours, lab data belongs in shared storage", synced-folder paths, and the storage-choice table (code → GitHub, documents → OneDrive/Dropbox, big data → Talapas). The glossary currently punts these topics to "see Lecture 00".
9. **M** Data classification (green/amber/red), HIPAA/IRB rules (OneDrive/Teams approved, Dropbox not), laptop encryption, and the 3-2-1 backup rule with the "a synced folder is not a backup" warning.
10. **E** Generative AI: book has one generic paragraph. Add UO Copilot Chat, green-data-only rule for unsupported tools, GitHub Copilot (Student Pack) and Positron Assistant, and a pointer to the course AI policy. (The discriminative-vs-generative figure is tangential here.)
11. **M** Site-licensed software (software.uoregon.edu; MATLAB, Mathematica, Adobe availability) and Zotero (connector, group libraries, Quarto citation insertion).
12. **E** Coding vs. scripting: replace the two bullet lists with the lecture's comparison table, add the "languages you'll meet" table (Python, MATLAB with UO license) and the paired shell/R loop example. Revise "we focus primarily on Bash and R" — the course now installs and uses Python.
13. **M** Python environments preview (`venv` block; venv/conda/renv/`uv` in one sentence).
14. **E** Cross-reference the Excel gene-name story (already in the data-formats appendix) as motivation in "Why learn computational skills".
15. **!** Book says "off-campus Talapas access requires the UO VPN"; Lecture 00 says the VPN is only for campus-restricted resources. Verify against the Talapas KB and make ch. 1, ch. 11 and the glossary agree.
16. **M** "Vibe coding"/LLM-assisted coding has no real section anywhere (Lecture 08 has only an empty header). Write one: the prompt → run → read → test loop; where the tools live (Copilot, Positron Assistant, Claude/ChatGPT); failure modes (invented functions, outdated APIs, silently wrong statistics); what never to paste (unpublished data, PHI, credentials); attribution expectations. Could be ch. 1 or a short standalone chapter.

## Ch. 2 – Computer Systems (`06-computer-systems.qmd`)

17. **M** The laptop vs. Talapas node vs. whole-cluster comparison table and its "30× RAM, 10× cores" takeaway.
18. **E** Add the callout "the usual bottleneck is RAM — 'out of memory' means more RAM or the cluster, not a faster CPU".
19. **E** Cluster computing: add the resource-manager table (SLURM/PBS/SGE/Kubernetes) and name InfiniBand and parallel filesystems (Lustre/GPFS) from Lecture 02.
20. **E** Operating systems: add the kernel/system-call/driver architecture diagram (SVG now in `Book/images/`) and optionally a sentence on scheduling algorithms. The "Types." line under RAM is a broken list — fix formatting.
21. **E** Reuse the local/cluster/cloud SVGs (`appendix_A_S21/S24/S27`) and the computing-timeline SVG as figures in "Computing Environments" and "Evolution of Scientific Computing".
22. **E** Exercise 1: add the concrete how-to (`uname -m`, About This Mac, Settings → About).

## Ch. 3 – Unix Fundamentals (`04-unix-fundamentals.qmd`)

23. **M** "Spaces in names are trouble": the `cd University of Oregon Dropbox` fail / quoted / backslash-escaped trio, and "Tab completion adds the escapes".
24. **M** Example OneDrive/Dropbox paths on macOS and via `/mnt/c/` in WSL (ties UO storage to paths).
25. **E** Wildcards: book covers only `*` and `?`; add `[abc]`, `[a-z]`, brace expansion `{fastq,md}`, and `mkdir -p bootcamp/{data/{raw,processed},scripts,output/{figures,tables},docs}`.
26. **E** Project organization: replace/augment the `murders/rdas` example with the bootcamp layout (`data/raw` read-only, `output/` expendable, numbered scripts, `2026-09-24_plate_reader.csv`, "`final_FINAL` is a cry for help").
27. **E** Add `history` (and `history | grep cd`) to the shortcut table; add the one-page command reference card at the end of the chapter.
28. **E** Hidden files: add the `ls -a` output showing `.` and `..`, and the point that `cd ..` literally enters the `..` entry.
29. **E** Add the Unix file-hierarchy and shell-command-anatomy SVGs (now in `Book/images/`) — the book has only an ASCII tree and a jpeg.
30. **!** "`/c/Users/yourusername` on Git Bash for Windows" — the course uses WSL; change to `/home/yourname`. "Bash… is what you'll use throughout" vs. macOS defaulting to zsh — reconcile early. "awk is covered in the grep chapter" — it isn't (see #40).

## Ch. 4 – Files, Pipes, Redirection (`07-files-pipes.qmd`)

31. **M** The FASTQ pipeline with per-stage `2>` logs (Lecture 04 "Bioinformatics Example") plus `cat *_errors.log | grep -E "ERROR|WARNING"` — the best motivating example for stderr.
32. **M** `<<` here-documents and explicit `1>` — one short example each.
33. **E** FASTA vs FASTQ: book has FASTA only; add the FASTQ 4-line block, reads = lines/4, `zcat/zless/zgrep`, and a cross-reference to the data-formats appendix.
34. **M** "Test on a subset first": `zcat … | head -n 20000 > subset.fa`, `sed -n '1000,2000p'`, `awk '/^>chr21/,/^>/'`, `shuf -n`. (Note: the lecture's `head`/`grep` on a gzipped file are wrong — use `zcat`/`zgrep` in the book.)
35. **E** Replace the placeholder `curl -O https://example.com/genome.fa.gz` with the real NCBI URL and mention ~1 GB compressed / ~3 GB uncompressed so students plan disk space.
36. **E** Add the multi-line commented pipeline with `tee`, `find | xargs wc -l | sort -n`, and `tail -f log | grep ERROR` (`xargs` is appendix-only now).
37. **E** Best practices: "never load a whole genome into memory — stream it", "work with `.gz` directly", "save pipelines as scripts".
38. **E** Optional: the redirection/pipe figures (`w1_pipes_3/4/5.jpeg`) alongside the ASCII stream diagram.

## Ch. 5 – GREP and Regular Expressions (`09-grep-regex.qmd`)

39. **M** A `sed` section: `s/old/new/`, `/g`, `/^#/d`, `-n '10,20p'`, and the `sed -i` Linux vs macOS (`-i ''`) warning (also missing from appendix-unix).
40. **M** An `awk` section: `{print $1,$3}`, `$5 > 30`, `-F',' 'NR>1'`, sum/average, and "grep finds lines, sed edits text, awk works with columns".
41. **E** Compressed files: add `zcat a.gz b.gz | gzip > combined.gz` and `gzip -k`.
42. **E** Add the UniProt header pattern `^>sp\|[A-Z0-9]+\|` and the `grep "GC*"` example showing `*` binds to the preceding character.
43. **!** "Download human chromosome 21 (smaller for practice)" but the URL is the full GRCh38 genome — fix text or URL. `grep -oE "ATG([ACGT]{3})*?(TAA|TAG|TGA)"` uses a lazy `*?` that ERE doesn't support (needs `-P`). The "degenerate site" `G[ACGT]ANTC` should be `G[ACGT]A[ACGT]TC`.

## Ch. 6 – Shell Scripting (`10-shell-scripting.qmd`)

44. **E** Add "spaces inside the brackets are required (`[ $x -gt 5 ]`, not `[$x -gt 5]`)" to the existing quoting callout.
45. **M** Where to write scripts: `.sh` files in VS Code/Positron/RStudio, LF line endings, the ShellCheck extension, run from the integrated terminal.
46. (Lecture fix, not book) Lecture 06 uses `return $COUNT` in a function (breaks above 255); the book's echo/stdout pattern is correct — fix the lecture.

## Ch. 7 – R Programming (`11-r-programming.qmd`) and R appendix

47. **M** A Positron subsection next to RStudio (Console/Variables/Plots/Data Explorer panes, R and Python, VS Code extensions); rename the section "RStudio and Positron".
48. **E** Packages: add `BiocManager::install()`, what "there is no package called …" means, and `pkg::fun()` framed as "use one function without `library()`".
49. **E** Consolidate the scattered gotchas into one callout (1-indexing, `=` vs `==`, `na.rm`, floating point, case) and add "cannot open file = wrong working directory; check `getwd()`, use project-relative paths".
50. **E** Data-types table: add the tibble/`str()` abbreviations (`int`, `dbl`, `chr`, `lgl`, `fctr`, `date`, `dttm`) and note logical has three values while doubles also have `NaN`, `Inf`, `-Inf`.
51. **E** Boxplots: add the formula interface `boxplot(response ~ treatment, data = df, col=, main=, ylab=)` — what students actually use with a data frame.
52. **E** Recommend `sessionInfo()` at the end of scripts/reports (currently only in ch. 12).
53. **E** appendix-r: add rows for `BiocManager::install()` and `pkg::fun()`.

## Ch. 12 (book order 13) – Quarto (`05-quarto-documents.qmd`)

54. **M** Installing Quarto and TinyTeX (`quarto install tinytex`, why PDF needs LaTeX, `quarto check`).
55. **E** Add the rendering-pipeline diagram (source → Quarto runs code, calls Pandoc → HTML/PDF/Word/slides).
56. **!/E** Rendering is described "from RStudio" only; add VS Code (Quarto extension) and Positron (Preview button, `Cmd/Ctrl-Shift-K`, `Cmd/Ctrl-Shift-V` Markdown preview), `--to docx`, and the `python3 -m pip install jupyter` fix for Python chunks.
57. **M** Jupyter notebooks vs Quarto documents comparison, and `quarto render notebook.ipynb`.
58. **E** Cross-references: add labeling a Markdown image (`{#fig-sem}`), a table (`#tbl-`), and an equation (`{#eq-}`), plus the `title="…"` callout attribute and the five callout types.
59. **E** Add a short "reading older examples" note mapping legacy R Markdown `{r, echo=FALSE, fig.cap=…}` to `#| echo: false` / `#| fig-cap:`; add `fig-cap` to the chunk-options table.
60. **E** State the rule "set defaults under `execute:` in the YAML, override per chunk".
61. **E** Mention Quarto extensions/templates (journal formats, revealjs, books) with a link.

## Ch. 16 (book order 14) – LaTeX

62. No gaps — Poisson, double integral, tridiagonal matrix, inline vs display are all there. (Lecture 08 shows `\int` in the source block but renders `\iint` — fix the lecture.)

## Ch. 10 (book order 15) – Git and GitHub (`20-git-github.qmd`) and Git appendix

63. **!** Both lecture and book teach `git checkout -b` for branches. Switch primary examples to `git switch -c` / `git switch main` and `git restore`, keeping `checkout` as "older syntax you'll still see"; update the troubleshooting block too. (Update Lectures 08–09 to match.)
64. **E** Authentication: add concrete steps students hit on their first push — `ssh-keygen -t ed25519` + add key at GitHub, or a fine-grained token (passwords were removed in 2021), or `gh auth login`. Cross-link from "Connecting Local to Remote".
65. **M** "Starting from a template repository" (green *Use this template* → Create → clone), contrasted with fork/clone — Lecture 09's workflow.
66. **M** GitHub Pages: add the `quarto publish gh-pages` alternative alongside the `/docs` method, and when to prefer each.
67. **E** Add tags/releases + Zenodo DOI for citing code (currently only in the data-formats appendix).
68. **E** Add `git help <cmd>`, `git fetch`, and `git log -p` to the ch. 10 command table. (Lectures still list the retired GitHub Learning Lab — replace with GitHub Skills.)

## Ch. 11 (book order 16) – HPC / Talapas (`16-hpc-talapas.qmd`) and SLURM appendix

69. **!** Node table is out of date. Replace with the Lecture 10 table: 43 standard AMD Milan nodes (128 cores, 512 GB); 24 GPU nodes (48 cores, 256–512 GB, 52 A100 total); large-memory up to 4 TB; 19 interactive nodes; condo-node callout (~166 CPU nodes, V100/A100/H100); RACS source link. Change "89 GPUs (A100 and H100)" to "A100, H100, V100".
70. **!** Partition table lists Talapas-1 names (`short`, `long`, `longgpu`, `fat`, `longfat`, `preempt`). Replace with `compute`/`computelong` (1 d/14 d), `gpu`/`gpulong`, `interactive` (12 h), `interactivegpu` (8 h), `memory`/`memorylong` (up to 4 TB) plus the `sinfo` tip; fix the SLURM-directives example (`fat` → `memory`) and the interactive-job example (`--partition=interactive`).
71. **!** appendix-slurm "Talapas-specific" table: `interactive` listed at 4 h (now 12 h), includes `preempt`, omits `interactivegpu`/`memorylong`. Align module examples with ch. 11/lecture (`R/4.3.3`, `cuda/12.4`, `miniconda3/…` + `conda activate`).
72. **M** RACS service list (Talapas, research storage ~$35/TB/yr, Globus, consulting, grant support, NSF ACCESS/cloud), contact email and service-desk link.
73. **E** Open OnDemand: Duck ID login, Chrome/Firefox private window, JupyterLab, remote desktop with RStudio/MATLAB/Stata, drag-and-drop file explorer, job composer, "sessions keep running after you close the browser", and "ask your PI early — PIRG setup takes days".
74. **M** "Connecting VS Code (or Positron) to Talapas with Remote-SSH": install the extension, `login.talapas.uoregon.edu`, editor local / files and terminal on Talapas, terminal lands on a login node (don't compute there). The lecture's diagram (`vscode_talapas_remote_ssh.svg`) is in `Lecture_Folder/images/`.
75. **E** SSH section: list `login1`–`login4` explicitly (the diagram shows four; the text shows one). Replace "Windows users: PuTTY, MobaXterm" with "Ubuntu terminal or VS Code Remote-SSH".

## Appendices

76. **E** appendix-unix: add `history`, `ls -F`, `ls -S`, `shuf`, `fold -w1`, `uname -m`, `df -h ~`, `<<`, `1>`, brace expansion; the macOS `zcat`/`gzcat` note; the `sed -i ''` caveat.
77. **E** appendix-shortcuts: add a Positron section (VS Code bindings plus `Cmd/Ctrl-Enter` send-to-console, `Cmd/Ctrl-Shift-K` render, `Cmd/Ctrl-Shift-M` pipe); add `Cmd/Ctrl-]`/`[`, `Cmd/Ctrl-Shift-V`, `Cmd/Ctrl-\`, `Cmd/Ctrl-Shift-X` to the VS Code table; note where the backtick key is.
78. **E** appendix-data-formats: add `.md`/`.qmd`/`.ipynb` (JSON) to the plain-text/binary quick-reference table.
79. **M** appendix-glossary: add entries for data classification (green/amber/red), HIPAA/FERPA/IRB, 3-2-1 backup, UO Dropbox, Teams/SharePoint, Globus, Copilot Chat, compiled language, thread, node, firmware, hidden file/dotfile, brace expansion, here document, virtual environment (`venv`/`uv`), Open VSX, Zotero, CBDS. Once #8–9 are in the book, replace the "see Lecture 00" pointers in the OneDrive/Microsoft 365/VPN entries with cross-references; fix the Partition entry per #70.

## Lecture-side errors found while auditing (fix in the slides, not the book)

- L02/L03: "Unix is a scripting language" and "Bash acts as the shell in Macs" — Unix is an OS; macOS defaults to zsh.
- L04: `head -n 20000 human_genome.fa.gz` and `grep "^>" human_genome.fa.gz` operate on a gzipped file — use `zcat`/`zgrep`.
- L05: the FASTQ QC pipeline `grep -A1 "^@"` can also match quality lines that start with `@`.
- L06: `return $COUNT` in a function (see #46).
- L07: slides 32–83 are a duplicated copy of Lecture 06's shell-script intro; `ln(x)` is not an R function; `sample(x, replace = T)` should use `TRUE`.
- L08: the legacy "Chunk options" slide (R Markdown syntax) is superseded by the hashpipe slide that follows; `\int` vs `\iint` mismatch.
- L08/L09: GitHub Learning Lab is retired; `git checkout -b` → `git switch -c`.
- L10: `--account=nereus` is a real PIRG name — use `myPIRG`.

## Lecture content that should stay out of the book

Bootcamp schedule/break slides, class introductions, roadmap and "Coming up", "Before Monday" homework, office hours, Wi-Fi/charger tips, the unfilled CBDS/Knight Campus TODO slide, the Dropbox contract renewal date, Lecture 01 logistics, the Homework 1 announcement (its content maps to ch. 5 Exercise 4), and the lecture practice slides that duplicate book exercises.
