# Merge log: stats-course material pulled into the Comp Tools repo (2026-09-22)

Sources: the Winter 2026 stats book and course site (temporarily copied in as 'BioE_Stats_Book copy' and 'BioE_Stats_Wi2026 copy', then removed). Only computational-tools content was pulled; statistics/probability content was deliberately left out.


---

# A-toolkit change log

Sources compared: `SB/chapters/01-introduction.qmd` (computational parts), `SB/chapters/02-installing-tools.qmd`, `SB/index.qmd` (framing), `SW/Lecture_Folder/Week1.qmd` ("Installing Programs", "Platform Considerations", "Accessing the Shell", Windows slides), `SW/Software.qmd`.

Overall finding: the Comp Tools book's toolkit chapter is already broader and newer than the stats sources (Python, VS Code, Positron, compiler toolchains, WSL "which side" guidance, `quarto install tinytex`). What the stats book adds is a handful of concrete install/verify/update/troubleshoot steps that the target lacked; those were merged surgically. The site `Software.qmd` was a byte-for-byte copy of the *stats* site page (R + RStudio only, dead `rstudio.org` link, "Latest" typos) and did not reflect the Comp Tools course, so it was rewritten in the same list style. The R/Python and VS Code/Positron/RStudio scope of the course was preserved throughout.

## 1. Edits

### `/home/claude/work_Book/chapters/02-your-toolkit.qmd`
- **Learning Objectives** — added "(plus RStudio if you want it)" to the install objective, since an RStudio install item was added below.
- **§ R (`#sec-toolkit-r`)** — expanded with the stats book's concrete steps: install R before RStudio/Positron; exact CRAN click path for macOS ("Download R for macOS" → chip-specific `.pkg`, ends up in Applications) and Windows ("base" → latest → `.exe`, Start menu); **new Linux (Ubuntu/Debian) install** (`sudo apt install r-base r-base-dev`, `R --version`), which the target lacked entirely; `R.version.string` as a quick verification.
- **§ TinyTeX (`#sec-tinytex`)** — kept the target's `quarto install tinytex` route (newer) and added the stats book's R route (`install.packages("tinytex"); tinytex::install_tinytex()`) with a "do not run both" note; added the full-distribution options with links and sizes (MacTeX ~4 GB, MiKTeX with auto-install, `texlive` apt packages); added verification (`quarto check`, `tinytex::is_tinytex()`, `Sys.which("pdflatex")`).
- **§ RStudio (new `#sec-toolkit-rstudio`)** — inserted into the install checklist after Positron. The target discussed RStudio (`#sec-rstudio-overview`, ch. 7) but had no install instructions anywhere in the book; pulled the stats book's per-platform steps (posit.co/download/rstudio-desktop, `.dmg`/`.exe`/`.deb`), "install R first", and the `R.version.string` verification / "cannot find R → reinstall" fix. Marked optional to match the course's VS Code/Positron emphasis.
- **§ Verification Checkpoint (`#sec-toolkit-checkpoint`)** — added `sessionInfo()` as the in-R check and the stats book's end-to-end test (create a Quarto document, set `format: pdf`, render), with the menu path for VS Code/Positron and RStudio.
- **`@tbl-install-troubleshooting`** — added four rows from the stats book's troubleshooting tables, updated to current commands: WSL install fails (Windows Update, enable virtualization in BIOS/UEFI, `wsl --update`, `wsl --install -d Ubuntu`); RStudio/Positron cannot find R; "package not available for this version of R" (update R); `install.packages()` fails partway (`dependencies = TRUE`).
- **§ new `#sec-trouble-latex`** ("Rendering to PDF fails, or LaTeX complains about a missing `.sty` file") inserted in `#sec-setup-troubleshooting` before the stale-results item: stats book's `tinytex::tlmgr_update()` / `tinytex::tlmgr_install()` plus the Quarto equivalents (`quarto update tinytex`, `tlmgr install`), the "no LaTeX found" case, and the "installer hangs → firewall/network" tip.
- **§ new `#sec-keeping-updated`** ("Keeping Software Updated", with `@tbl-keeping-updated`) inserted before the Summary: stats book's update section (R from CRAN, `update.packages(ask = FALSE)`, RStudio Help → Check for Updates, `tinytex::tlmgr_update()`, `brew update && brew upgrade`, `apt update && apt upgrade` for Ubuntu/WSL) extended to the rest of the Comp Tools toolkit (VS Code/Positron, Python/uv/conda, pip, Quarto, `quarto update tinytex`, `wsl --update`) and the "major R upgrade → reinstall packages" caution.
- **Summary** — one bullet amended (missing LaTeX packages) and one bullet added (updating the toolkit).

### `/home/claude/work_Book/chapters/01-introduction.qmd`
- **§ macOS Users** — added the stats book's "5–10 minutes" expectation and "full Xcode also works but is unnecessary" note, plus verification (`xcode-select -p`, `git --version`); added an **Optional: Homebrew** callout-tip (what it is, brew.sh, `brew install`, `brew update && brew upgrade`). The book's Git chapter already assumes Homebrew (`brew install git`) without ever introducing it.
- **§ Linux Users** — one sentence pointing to the apt commands for the toolchain and R (cross-ref to @sec-toolkit).
- **§ Windows Users** — step 1 now also names the **Terminal** app; step 2 adds the `wsl --install -d Ubuntu` / Microsoft Store fallback from the stats slides; the paragraph after the steps now states explicitly (from SW Week1) that the Ubuntu window is Linux, not PowerShell, that it has its own home directory `~`, and that course files belong there; added the Microsoft WSL docs link alongside the Ubuntu tutorial. New **"If WSL will not install"** callout-note: virtualization/Windows Update/`wsl --update` fix (from the stats troubleshooting table) and the stats book's **Git Bash** option, framed as a last-resort fallback for managed laptops rather than a co-equal choice, so the WSL-first course design is not weakened.

### `/home/claude/work_site/Software.qmd`
- Rewritten (same title, same bullet-list style) to reflect the Comp Tools course instead of the stats course: full install list (shell, R, Python, Quarto + TinyTeX, VS Code, Positron, optional RStudio, Git/GitHub) with laptop minimums; Mac/Linux/Windows shell sections updated with the stats site's WSL flow plus the newer `wsl --install -d Ubuntu`, "not PowerShell", virtualization troubleshooting, and "install R/Python/IDEs on the Windows side" guidance; R section gains chip check, Rtools, Ubuntu apt, tidyverse; new Python, Quarto/LaTeX, Editors sections; Git/GitHub section gains the Student Developer Pack; new "Check that it all works" command block; links into the book (`book/chapters/01-introduction.html#sec-intro-setup`, `book/chapters/02-your-toolkit.html`).
- Fixed: dead/outdated `https://www.rstudio.org` link → `posit.co/download/rstudio-desktop/`; `r-project.org` → CRAN; two "Latest" typos; the LaTeX bullet pointed at `latex-project.org/get/` with no mention of TinyTeX, which is what the course actually uses.

## 2. Images to copy

None. `SB/chapters/02-installing-tools.qmd` has no figures; the SW Week1 install slides use `week_01_S28_rstudio_screenshot.jpg` and two Mac Terminal screenshots, for which the target already has `Book/images/rstudio_interface.png` (used in ch. 7) and its own terminal figures in ch. 3.

| source path on disk | destination path |
|---|---|
| (none) | (none) |

## 3. Skipped

- SB ch. 1 "Coding and Scripting for Data Analysis" and SW "Coding vs. Scripting" table — target `#sec-coding-vs-scripting` already covers this in more depth (compiled/interpreted lists, JIT note); nothing new.
- SB ch. 1 "Role of Statistics", "Why Statistics Matters", "Statistical Thinking", "What You Will Learn" — statistics framing, out of scope.
- SB ch. 2 "Overview of Required Software" table — target's "What each of these tools actually is" callout and install checklist are a superset (add Python, VS Code, Positron).
- SB ch. 2 "Checking Your Mac's Processor" callout — target `@tbl-chip-check` is more complete (macOS, Windows, `uname -m`).
- SB ch. 2 "Installing Additional R Packages" (`tidyverse`, `pwr`, `car`, `lme4`, `gapminder`) — package installation already covered in `#sec-installing-packages` (ch. 7); the listed packages are stats-course specific. tidyverse install added only as one bullet on the site page.
- SB ch. 2 Windows "Git Bash" as a co-equal Option 2 — included only as a fallback callout; the Comp Tools course is WSL-first and ch. 2's whole "which side am I on" treatment depends on that.
- SB ch. 2 Exercise I.2 "Explore RStudio" — RStudio panes/shortcuts already in ch. 7 `#sec-rstudio`; target ch. 2 exercises already cover the checkpoint.
- SW Week1 "Installing R and RStudio" slides (r-project.org / rstudio.com links) — older links than the target's; superseded.
- SW Week1 "Platform Considerations" and "Accessing the Shell" (iTerm2) — target ch. 1 already mentions iTerm2 and the platform differences.

---

# B-unix change log

Sources read in full: `SB/chapters/03-unix-command-line.qmd`, `SB/chapters/A3-unix-reference.qmd`, `SW/Lecture_Folder/Appendix_B.qmd`, `SW/Lecture_Folder/Appendix_C.qmd`, and the shell/navigation/files sections of `SW/Lecture_Folder/Week1.qmd` (lines 287-516) plus its pipe-figure slides (lines 1696-1746).
Targets edited: `work_Book/chapters/04-unix-fundamentals.qmd`, `07-files-pipes.qmd`, `09-grep-regex.qmd`, `10-shell-scripting.qmd`, `appendix-B-unix.qmd`. `appendix-D-regex.qmd` was read and left unchanged (nothing in the stats sources adds to it).

All new headings carry `{#sec-...}` ids, all new figures `{#fig-...}` ids with captions, all new tables `{#tbl-...}` ids; fences and `:::` divs verified balanced; no duplicate ids across the book; every `@sec-/@fig-/@tbl-` reference in the edited files resolves.

## 1. Edits

### `04-unix-fundamentals.qmd`
- **Anatomy of a Shell Command** — added the newer SVG figure `appendix_B_S38_shell_command_anatomy.svg` (`#fig-shell-command-anatomy`) and a **Prompt** entry to the definition list, mirroring the Week1/Appendix_B "Recipes for a Shell Command" (prompt / command / options / argument). Book had text only.
- **Understanding the File System** — added `appendix_B_S42_file_structure.svg` (`#fig-file-structure`) after the intro paragraph (Week1 "How is a computer organized?").
- **The Directory Tree** — added `appendix_B_S43_unix_file_hierarchy.svg` (`#fig-unix-file-hierarchy`) with a linking sentence after the ASCII tree (Week1 "UNIX File Hierarchy (SVG)"; audit item #29).
- **Absolute vs. Relative Paths** — *replaced* the old `../images/unix_directory_paths.jpeg` (`#fig-paths`; sourced from the stats book's `00.Maybe_use` folder, caption hard-coded `/home/catchen/working`) with the newer `unix_paths_highlighted.svg` and a generic caption. Same `#fig-paths` id kept. **Deletion logged:** the jpeg reference is gone; `Book/images/unix_directory_paths.jpeg` is now unreferenced by this chapter.
- **NEW `### The Special Entries . and ..` (`#sec-dot-and-dotdot`)** — `ls -a` output showing `.`/`..`, explanation that `cd ..` literally enters the `..` entry and why `./script.sh` works, two figures `unix_dot_files.svg` (`#fig-unix-dot-files`) and `unix_dotdot_navigation.svg` (`#fig-unix-dotdot-navigation`), plus equivalent-command examples (Week1 "Special Files -- dot / dot dot" slides; audit #28).
- **Moving and Renaming: `mv`** — added a "The shell trusts you" caution callout (silent overwrite by `mv`/`cp`, use `-i`) from Week1/Appendix_B "Important Notes".
- **Wild Cards** — extended from `*`/`?` only to include `[123]`, `[0-9]`, `[A-Z]` sets, extra `*`/`?` examples, and a paragraph + examples showing wildcards are expanded by the shell so they work with any command (`wc -l *.csv`, `cp *.R backup/`, `grep "gene" *.txt`); warning callout now also suggests `rm -i` (SB "Wildcards and Pattern Matching"; audit #25 in part).
- **Environment Variables** — added `$PWD`, `env | less`, `printenv HOME`, a new paragraph on defining your own variables (`NAME=value`, `$NAME`) and on `export` making them visible to child programs, with a forward reference to shell scripting (SB "Environment Variables").
- **Shells and Configuration Files** — expanded the single `alias ll` example to the stats book's set: `export PATH="$HOME/bin:$PATH"`, `alias rm='rm -i'`, `export R_LIBS_USER`, plus which file interactive/login/zsh shells read and `source ~/.zshrc` (SB "Shell Configuration Files").
- **File Permissions** — added the worked reading of `-rwxr-xr-x`; symbolic notation now names `u/g/o/a` and `+/-/=`; octal notation now explains the 4/2/1 sum (`rwx` = 7, `r-x` = 5); added `chmod 600` and a sentence on the four common patterns (SB "File Permissions" / "Changing Permissions with chmod").
- **NEW `### Making Scripts Executable` (`#sec-making-scripts-executable`)** — the "Permission denied → `chmod +x` → works" demo with the shebang explanation, cross-referenced to `@sec-dot-and-dotdot` and `@sec-shell-scripting` (SB "Making Scripts Executable"). Checked ch. 6: it shows `chmod +x` but not the failing run, so no duplication.
- **NEW `### Connecting to Remote Computers: ssh and scp` (`#sec-ssh-scp`)** in *Advanced Unix Concepts* — `ssh user@host`, `exit`, `scp` in both directions, pointer to `rsync` and `@sec-file-transfer`/`@sec-hpc-talapas` (SB "Connecting to Remote Systems"). The `ssh` row in the "Commands Worth Learning" table now cross-references it.
- **Summary** — three bullets added (`.`/`..`, permissions/`chmod +x`, wildcards expanded by the shell).
- **Exercises** — added *Exercise 4: Wild Cards and Structure* (adapted from SB Exercise U.1: five `dir_N` directories, `touch`, `nano`, wildcard listing, `rm` then `rmdir`) and *Exercise 5: File Permissions* (SB Exercise U.4).

### `07-files-pipes.qmd`
- **Learning objectives** — now mention capturing errors separately.
- **Standard Streams** — added a paragraph that a program does not know where its output goes, and the figure `pipe_step3_output_to_shell.svg` (`#fig-stream-to-terminal`) (Appendix_B "Unix Three Standard Streams" / Week1 pipe step 3 SVG; audit #38).
- **Output Redirection** — added figure `pipe_step4_redirect_to_file.svg` (`#fig-redirect-to-file`); added the explicit `ls -l 1> file_list.txt` form and a sentence explaining `>` = `1>` (Appendix_B; audit #32).
- **Redirecting Errors** — added the portable `> out 2>&1` spelling with explanation.
- **NEW `### Why Separate Streams Matter: A Pipeline with Error Logs` (`#sec-pipeline-error-logs`)** — the FASTQ pipeline with a `2>` log per stage and `cat *_errors.log | grep -E "ERROR|WARNING"` (Appendix_B "Bioinformatics Pipeline Example"; audit #31). **Corrected** the source's tool chain, which does not actually stream (`fastqc stdin | trimmomatic | ... | samtools index -`): rewritten as `zcat | cutadapt - | bowtie2 -U - | samtools sort -o ... -`, explicitly labelled schematic, with a note on `-` meaning stdin and a forward pointer to SLURM jobs.
- **Input Redirection** — added `wc -w < report.txt`, and a here-document (`<<`) example with explanation and a pointer to the `usage()` heredoc in ch. 6 (Appendix_B "Input Redirection"; audit #32).
- **Pipes: Connecting Commands** — added figure `pipe_step5_chained_pipeline.svg` (`#fig-chained-pipeline`) (Week1 pipe step 5 SVG).
- **Simple Pipe Examples** — added `ls -l | head -n 5`, `grep ... | wc -l`, and the Appendix_B "Advanced Patterns" (`cut | sort | uniq -c | sort -rn`, `find | xargs wc -l | sort -n`, `tail -f log | grep ERROR`) with a sentence introducing `xargs` (audit #36).
- **The `tee` Command** — added the multi-line commented pipeline with `tee` (Appendix_B "Full Pipeline"). **Corrected** the source's syntax: it used `| \   # comment`, where the backslash escapes a space and breaks the command; the book version ends each line with `|` (which legally continues the pipeline) and puts the comment after it, with a note about why `\` cannot be followed by a comment.
- **`sort`** — added `sort -k2,2 -nr` and `sort -u`, plus a paragraph on why `-k2,2` differs from `-k2` (SB "Sorting with Advanced Options").
- **`cut`** — added the `cut -f2-5` range example.
- **NEW `### join: Combine Two Tables on a Shared Column` (`#sec-join`)** — sorted-input requirement, worked example, `-1 2 -2 1`, comparison to `left_join()` (`@sec-tidy-data`) (SB "Column Operations with cut and join"). `join` previously appeared only in the appendix table.
- **Working with Large Genomic Data** — intro now gives sizes (~3.1 Gbp, ~1 GB compressed, >3 GB uncompressed) (Appendix_B "Human Chromosome Data").
- **NEW `### FASTQ Format Basics` (`#sec-fastq-format-basics`)** — four-line record, example, `awk 'NR % 4 == 2'` / `== 0` and reads = lines/4, cross-ref to `@sec-fastq` and `@sec-awk` (SB "FASTQ Format"; audit #33). Deliberately short because the data-formats appendix already covers Phred encoding.
- **Downloading Genomic Data** — **replaced** the placeholder `curl -O https://example.com/genome.fa.gz` with the real NCBI URL via `curl -o human_genome.fa.gz`, added the wget/curl and backslash/`.gz` notes and the disk-space warning (Appendix_B "Downloading Genomic Data"; audit #35).
- **Working with Compressed Files** — added `gunzip -c`, `zless`, the `ls -lh` before/after with `gunzip -k`, `zcat a.gz b.gz | gzip > combined.gz` (audit #41), and a "Don't use cat on huge files" important callout that also carries the macOS `gzcat` note (Appendix_B "Examining Large Files Efficiently"/"Working with Compressed Files").
- **NEW `### Test on a Subset First` (`#sec-test-on-a-subset`)** — `zcat | head -n 20000 > subset.fa`, first 1,000 FASTQ reads, `sed -n '1000,2000p'` (Appendix_B "Key Takeaways"; audit #34, using `zcat` rather than the lecture's `head` on a gzipped file).
- **Stream Processing** — added the `cut -c1-1000000 > first_megabase.txt` pipeline (Appendix_B "Stream Processing").
- **Pipeline Efficiency** — rewritten as the Appendix_B "Unix Best Practices for Large Data" list (never load a genome into memory, work with `.gz` directly, test on subsets, `tee` while debugging, `>` vs `>>`) merged with the existing bullets (audit #37).
- **Summary** — updated bullets (`2>` per stage, `<<`, `join`, streaming/subsets).
- **Exercise 2** — added steps 5-6 (`tee`, count unique numbers and append) from Appendix_B "Practice Exercise: Files and Pipes".

### `09-grep-regex.qmd`
- **Quantifiers** — added `grep "GC*"` with a paragraph explaining that a quantifier binds only to the preceding character/group (Appendix_C; audit #42).
- **The Plus Quantifier** — added `grep -E "[ACGT]{20,}" primers.txt` (Appendix_C "Complex patterns").
- **Working with FASTA Files** — added the UniProt header pattern `^>sp\|[A-Z0-9]+\|` with a comment on the escaped `|` (audit #42) and `grep -v -E "TAA|TAG|TGA"` (Appendix_C "Combining with Pipes").
- **sed substitution** — added `sed 's/^/sample_/'` (SB "Search and Replace with sed").
- **awk filtering** — added `$2 == "control"`, `{ print NR, $0 }`, and a short "arithmetic on fields" example `$2 * 1000` (SB "Flexible Text Processing with awk").
- **NEW `### Putting It Together` (`#sec-text-tools-together`)** after the grep/sed/awk comparison table — the SB "Combining Commands in Pipelines" one-liners (unique gene names, significant rows sorted by effect size, CSV→TSV subset, value counts, sequences per chromosome, GFF feature types) with a closing paragraph naming the select → extract → sort → count idiom.

### `10-shell-scripting.qmd`
- **Exit Status** — added the `if ! grep ... > /dev/null 2>&1; then` idiom with a sentence on any command serving as an `if` condition (Appendix_C "Error Handling" try-catch style). Everything else in Appendix_C (shebang, `$()`, `$(())`, `$0/$#/$@`, arrays, `${var%pattern}`, conditionals table, loops, functions, `set -euo pipefail`, `trap`, `fasta_stats.sh`, best-practices list) was already present, usually in more detail.

### `appendix-B-unix.qmd`
- Text-processing table: `sort -k` row now shows `-k2,2 -n` and explains `-kN,N`; added `sort -t`, `uniq -u`, `cut -f2-5` range note, `join -1 -2`, `fold -w`.
- Redirection table: added `<<` and `1>` rows.
- Compression table: added `gunzip -k` and `gunzip -c`.
- **NEW `### Special Variables in Scripts` (`#sec-script-variables`, `#tbl-script-variables`)** — `$0`, `$1..$9`/`${10}`, `$#`, `$@`, `$*`, `$LINENO` (Appendix_C "Command-Line Arguments"); previously only `$?`/`$$` were tabulated.
- **Error fix:** the three existing `uniq` rows had unescaped `|` inside code spans (`sort file | uniq`), which splits a pipe-table cell; escaped as `\|` to match the redirection table's convention. New rows containing pipes are escaped the same way.

## 2. Images to copy

| Source path on disk | Destination path | Referenced from |
|:--|:--|:--|
| `BioE_Stats_Wi2026 copy/Lecture_Folder/images/week_01_S38_shell_command_anatomy.svg` | `Book/images/appendix_B_S38_shell_command_anatomy.svg` — **already present in `Book/images/` under this name (per `_audit_imagelist.txt`); no copy needed** | ch. 3 `#fig-shell-command-anatomy` |
| `BioE_Stats_Wi2026 copy/Lecture_Folder/images/week_01_S42_file_structure.svg` | `Book/images/appendix_B_S42_file_structure.svg` — **already present; no copy needed** | ch. 3 `#fig-file-structure` |
| `BioE_Stats_Wi2026 copy/Lecture_Folder/images/week_01_S43_unix_file_hierarchy.svg` | `Book/images/appendix_B_S43_unix_file_hierarchy.svg` — **already present; no copy needed** | ch. 3 `#fig-unix-file-hierarchy` |
| `BioE_Stats_Wi2026 copy/Lecture_Folder/images/week_01_S44_unix_paths_highlighted.svg` | `Book/images/unix_paths_highlighted.svg` | ch. 3 `#fig-paths` (replaces `unix_directory_paths.jpeg`) |
| `BioE_Stats_Wi2026 copy/Lecture_Folder/images/week_01_S45_unix_dot_files.svg` | `Book/images/unix_dot_files.svg` | ch. 3 `#fig-unix-dot-files` |
| `BioE_Stats_Wi2026 copy/Lecture_Folder/images/week_01_S48_unix_dotdot_navigation.svg` | `Book/images/unix_dotdot_navigation.svg` | ch. 3 `#fig-unix-dotdot-navigation` |
| `BioE_Stats_Wi2026 copy/Lecture_Folder/images/week_01_S130_pipe_step3.svg` | `Book/images/pipe_step3_output_to_shell.svg` | ch. 4 `#fig-stream-to-terminal` |
| `BioE_Stats_Wi2026 copy/Lecture_Folder/images/week_01_S131_pipe_step4.svg` | `Book/images/pipe_step4_redirect_to_file.svg` | ch. 4 `#fig-redirect-to-file` |
| `BioE_Stats_Wi2026 copy/Lecture_Folder/images/week_01_S132_pipe_step5.svg` | `Book/images/pipe_step5_chained_pipeline.svg` | ch. 4 `#fig-chained-pipeline` |

Notes: the SVG was preferred over the matching `.jpeg` in every case (both exist for S42-S48 and S130-S132). `Book/images/unix_directory_paths.jpeg` is no longer referenced by ch. 3 and can be removed if nothing else uses it (grep found no other reference in the book). I could not view the images; captions are written generically from the filenames and the slide context in which they appear.

## 3. Skipped

- SB *What is Unix? / The Shell and Terminal* prose and jpegs (`ch03_unix_computing.jpeg`, `ch03_shell_diagram.jpeg`, `ch03_pwd/ls/cd_command.jpeg`, `ch03_command_anatomy.jpeg`, `ch03_filesystem_hierarchy.jpeg`) — book text already covers these at least as well, and the SW SVGs are newer and cleaner than the SB jpegs for the same topics.
- SB/Appendix_B/Week1 WSL installation steps — belong to ch. 1/toolkit setup (another agent's targets); ch. 3 already cross-references `@sec-windows-setup`.
- SB *Navigation Commands*, *Working with Files and Directories*, *Viewing File Contents*, *Getting Help* — book already has the same commands with more explanation (`less` keys, `wc` options, `man` navigation, `--help`, `apropos`).
- SB *Pattern Matching with grep*, *Search and Replace with sed*, *awk* basics — ch. 5 already has fuller sed/awk sections (added 2026-09-22); only the few missing examples noted above were pulled. SB's `\s` in basic grep skipped (GNU extension; book uses POSIX classes).
- SB *Bioinformatics File Formats* (CSV/TSV, FASTA, SAM/BAM + `samtools`, BED, VCF + `bcftools`, GFF/GTF, compressed formats) — already covered in `appendix-C-data-formats.qmd` (`@sec-fasta`, `@sec-fastq`, `@sec-sam-bam`, `@sec-genomic-annotation-and-interval-formats`, `@sec-gzip-streaming`); only the FASTQ awk one-liners were added to ch. 4.
- SB *Ctrl-C "Interrupting Commands"* callout — already in the keyboard-shortcut table (`@tbl-keyboard-shortcuts`).
- SB Exercises U.2 and U.3 — equivalent to existing ch. 4 Exercise 3/4 and ch. 5 exercises.
- SB *Additional Resources* list — book's reading lists already include Software Carpentry and the GNU Awk guide; the Stanford cheat-sheet/Korf primer/DataCamp links were not added.
- SB `A3-unix-reference.qmd` — the book's `appendix-B-unix.qmd` is already a strict superset (adds `ls -S/-F`, `shuf`, `history`, `uname -m`, macOS `sed -i ''`, etc.).
- Appendix_B *Accessing the Shell* and *Where Do You Get Help?* (incl. "Generative AI") — covered in ch. 3 and the AI chapter.
- Appendix_B *Human Chromosome Data* `ls -lh`/`gunzip` size demo — folded into the compression section rather than a separate subsection.
- Appendix_B *Practice: File Operations* exercise — equivalent to existing ch. 3 Exercise 2.
- Appendix_C GREP basics, character classes, quantifier examples, extended regex, `grep -oE "gene=[^;]+"`, base counting, GC content, EcoRI/SSR/ATG position pipelines — all already in ch. 4/5 (ch. 5 has a fuller chr21 walkthrough).
- Appendix_C shell scripting slides — all content already present in ch. 6 (see above); its `return $COUNT` pattern was *not* pulled because it breaks for counts > 255 (the book's echo/stdout approach is correct, matching audit #46).
- Appendix_C *Practice: Build Your Own Pipeline* — equivalent to ch. 5 Exercise 4 / ch. 6 Exercise 4.
- Week1 `.jpeg` variants of every SVG figure, `w1_finder.jpeg`, `w1_navigate.jpeg`, `finding_your_way_around.jpeg`, `macterminal_*.jpg`, `terminal_window_showing_direct.jpg`, and the three mislabelled "Relative and Absolute Paths" slides (`S49_statistical_concepts_preview`, `S50_data_analysis_workflow`, `S51_course_roadmap` — filenames indicate they are not path figures).
- Week1 pipe slides S126-S129 (Mario/Magritte memes, pipe steps 1-2 jpegs) — decorative or superseded by the step 3-5 SVGs.
- Audit items not in the stats sources (brace expansion `{a,b}`, `history | grep`, spaces-in-names trio, OneDrive paths, bracket-spacing note in ch. 6) were left alone; they are outside this merge's scope.

---

# C-r change log — R basics / RStudio / R reference

Sources read in full: `SB/chapters/04-r-rstudio.qmd`, `SB/chapters/A4-r-reference.qmd`, `SW/Lecture_Folder/Appendix_D.qmd`, R-basics portions of `SW/Lecture_Folder/Week1.qmd` (lines 518–1397) and the headings of `Week2.qmd` (its R content is dplyr/ggplot/probability, outside this assignment).
Targets read in full: `work_Book/chapters/11-r-programming.qmd`, `work_Book/chapters/appendix-E-r.qmd`; headings of `15-writing-functions.qmd`; relevant sections of `02-your-toolkit.qmd` and `08-tidy-data.qmd` checked for duplication.

Overall finding: the Comp Tools chapter 07 and appendix were already a superset of the stats book's R chapter and R reference on most topics (objects, vectors, sorting, `which()`, floating point, `near()`, vignettes, `conflicted`, lists, matrices, apply family, `replicate()`, cleanup). The additions below are the pieces the stats sources have that the target lacked, plus a few consistency fixes.

## 1. Edits

### `work_Book/chapters/11-r-programming.qmd`

| Section | What + why |
|:--|:--|
| Learning Objectives | Added two bullets (error messages / `NA` handling; working directory & Projects) to match the new material. |
| The Console vs. Scripts (`#sec-the-console-vs-scripts`) | Inserted the stats book's "Scripts and Reproducibility" material: self-contained script layout (header comment → packages → data → analysis → figure), the annotated template script, File → New File → R Script, `Ctrl/Cmd+Enter`, and RStudio's `# ---- ` section folding. Target previously described *why* scripts matter but gave no structure. |
| RStudio Interface (`#sec-the-rstudio-interface`) | Added "R is not RStudio" callout (from SW Week1) with pointer to `@sec-which-ide`; extended shortcuts tip with Tools → Global Options → Pane Layout and the Packages/Help tabs (SW Week1 / SB Exercise R.1). |
| RStudio Projects → renamed heading "RStudio Projects and the Working Directory" (id `#sec-rstudio-projects` kept) | Added the working-directory concept and `getwd()` / `setwd()` / `list.files()` snippet (SW Week1 "Working Directory" slide), and why Projects make `setwd()` unnecessary / non-portable. Book had no `getwd()` outside the glossary and appendix. |
| Creating Variables | Added the note that assignment prints nothing; view with the name or `print()` (SB). |
| Variable Naming Rules | Added: names cannot contain operators (`3*y <- 3` example from SB/SW), R is case-sensitive with three-way example, and SB's advice to prefer underscores over periods (with a Python cross-reference, which is especially relevant in this bilingual book). |
| Reserved Words warning | Retitled "Avoid Common Name Collisions"; added `data` and `df` to the never-use list (SB), explained *why* (`df()` is the F density, `data()` loads datasets) and tied it to the `object of type 'closure' is not subsettable` error. |
| **Fix (consistency):** throughout the chapter | The chapter warned against naming variables `df`/`data` yet used both as variable names in seven code chunks. Renamed: `df` → `samples_df` (objects section), `values` (near() example), `expr` (ranking example); `data` → `measurements` (read-files chunk, four assignments), `values` (histogram), `readings` (custom-functions example); `dplyr::select(data, …)` → `dplyr::select(experiment, …)`. No behaviour change. |
| Vectors intro | Added one sentence on type coercion when mixing types in `c()` (answers SB Exercise R.10 question 4, which the target otherwise never addresses). |
| Creating Vectors | Added "inspecting vectors" chunk: `length()`, `class()`, `head()`, `tail()` (SB "Useful Functions for Vectors") and an explanation of the `[1]` index prefix in printed output. |
| Data Types table (`@tbl-data-types`) | Added a "Tibble abbreviation" column (`<dbl>`, `<int>`, `<chr>`, `<lgl>`, `<fct>`, `<date>`, `<dttm>`) and a `Date`/`POSIXct` row (SW Appendix D "Types of Vectors" / Week1 "Common Data Types"); added sentence that numbers are doubles by default and `42L` makes an integer. Added `as.numeric("hello")` → `NA` line. |
| Data Types — new callout "Coercing Factors to Numbers" | `as.numeric(factor)` returns level codes; use `as.numeric(as.character(x))` (SW Week1 "Data Type Coercion" warning). Not previously in the book. |
| Special Values (`#sec-special-values`) | Was three lines. Added `@tbl-special-values` (NA/NaN/Inf/NULL with test functions, SW "Special Numeric Values"), the SB explanation that blank cells become `NA` and `NA` propagates, an `is.na()` / `na.rm` / `sum(is.na())` / `x[!is.na(x)]` chunk, and an important-callout "Never test for missing values with `==`" (SW Week1) including SB's note that `NA` is logical and distinct from `"NA"`. |
| Getting Help — new `#### Reading Error Messages {#sec-r-error-messages}` | Added `@tbl-common-r-errors` (extended from SW Week1 "Common R Errors": eight messages incl. closure-not-subsettable, missing argument, cannot open file, the `+` continuation prompt) and the "read from the bottom up" tip. |
| Getting Help — new callout "Asking for Help" | SB's minimal-reproducible-example advice, plus `reprex`. |
| Installing Packages note | Added Tools → Install Packages dialog and Packages tab (SW Week1), reinstall-after-R-upgrade, and BiocManager pointer to `@sec-install-checklist`. |
| Creating Data Frames | Added same-length / one-type-per-column rule and a row-names example (`rownames(labelled) <- paste0("Sample_", 1:5)`, from SW Appendix D / Week1) on a copy, with a note that tibbles drop row names and `rownames_to_column()` converts. |
| Accessing Data Frame Elements | Added explanation of `[row, col]` with empty dimensions, why a comparison yields a logical vector usable for row selection (with chunk), and when to use `$` vs `[[ ]]` vs `[, ]` (SW Appendix D "Indexing Data Frames" interpretation). |
| Reading Files | Added meaning of `header`, `sep`, `row.names = 1`, `na.strings`, `stringsAsFactors` (SW Appendix D), a short readr paragraph (`read_csv`/`read_tsv` return tibbles; base functions need no packages, e.g. on a cluster) with `eval: false` chunk and a cross-ref to `@sec-data-import-with-readr` (no duplication of ch08's detail), and a warning callout "Always check what you imported" (`str()/glimpse()/head()/dim()/summary()/View()`, SW Week1). |
| Writing Files | Added readr `write_csv`/`write_tsv` equivalents, explanation of `row.names = FALSE` and `quote = FALSE` (SW Appendix D), and a "Never overwrite the raw data" tip cross-referencing `@sec-preserving-raw-data`. |
| Box Plots | Added formula-interface example `boxplot(response ~ treatment, data = experiment)` as new figure `@fig-base-boxplot-formula` (SB/SW use the formula form; the target only showed the two-vector form). |
| New `### Common Plot Arguments {#sec-plot-arguments}` | `@tbl-plot-arguments` (SB "Useful Plotting Arguments" + `type = "h"`, `breaks`, `add = TRUE`) and the vectorized-graphical-parameters example (`col` from `ifelse()`), new figure `@fig-vectorized-col` (SB "Vectorized Graphical Parameters"). |
| Multiple Plots | Added explanation of `par()` persistence and the left-to-right/top-to-bottom fill order (SW Appendix D), and how to save/restore `par()` settings. |
| Summary | Added bullets on `NA` handling and error messages / reprex. |
| Exercises | Exercise 7: added step 5 (round-trip without `row.names = FALSE`). Added Exercise 8 "Exploring RStudio and the Help System" (SB Exercise R.1 + help tasks + deliberately triggering errors) and Exercise 9 "Base Plotting" (SB Exercise R.7: `type`, `breaks`, `par(mfrow)`, vectorized `col`). |

### `work_Book/chapters/appendix-E-r.qmd`

| Section | What + why |
|:--|:--|
| Basic operations table | Added `args()` and `vignette()` rows (SW Appendix D "Getting Help"; both are taught in ch07 but were missing from the reference). |
| Missing values table | Added `is.nan()/is.infinite()/is.finite()` row and an explicit "`x == NA` is wrong" row (SW Week1). |
| New `## Base R Graphics {#sec-r-base-graphics}` with `@tbl-r-base-graphics` | The appendix had ggplot2 tables but no base-graphics reference, although ch07 teaches `plot/hist/boxplot/barplot/curve/par(mfrow)/pdf()+dev.off()`. Table built from SB "Useful Plotting Arguments", SW Appendix D plotting slides, and the functions ch07 already uses. |
| dplyr / tidyr / stringr / joins / selection helpers / package tables | Compared line-by-line with SB A4: the book's tables are identical or strict supersets (extra `map_*`, `vapply`, forcats, base strings, gotchas). No change. |

### `work_Book/chapters/15-writing-functions.qmd`

No edits. The stats sources contain no function-writing material beyond the `function` reserved word; ch13 already covers everything relevant.

## 2. Images to copy

None. The only R-basics figure in the stats sources is the RStudio IDE screenshot (`BioE_Stats_Book copy/images/ch04/ch04_rstudio_ide.png`, `BioE_Stats_Wi2026 copy/Lecture_Folder/images/week_01_S65_rstudio.jpeg`, `…/week_01_S28_rstudio_screenshot.jpg`). The book already has `Book/images/rstudio_interface.png` with a detailed four-pane caption at `@fig-rstudio-interface`; images are not on disk here, so there is no evidence the stats screenshot is newer or better, and I left the existing figure in place. All other stats figures in these sources are generated R plots (histograms, boxplots) that the target regenerates from code.

## 3. Skipped

- SB §"Installing R and RStudio" and SW Week1 "Installing R and RStudio / Platform Considerations" — installation belongs to `02-your-toolkit.qmd` (`@sec-install-checklist`), assigned elsewhere.
- SB §"Generating Random Numbers", SW "Drawing Samples from Distributions", "Overlaying Density Curves", "Binomial Distribution" — probability content; the mechanics (`rnorm`, `sample`, `set.seed`, `curve(dnorm…, add = TRUE)`) are already in ch07 `#sec-random-sampling`.
- SB §"Introduction to R Markdown" — superseded by the book's Quarto chapter (`@sec-quarto-documents`); R Markdown itself is not taught in this course.
- SW Week1 "Tidy Data & File Types", "Tidy Data Set Rules of Thumb", "Common File Formats", "Genomic Data Formats", SW Appendix D "Tidy Data Principles"/"Types of Data" — tidy-data and data-format material; covered by ch08 and `appendix-C-data-formats.qmd`, assigned to other agents.
- SW Week1 "The Tidyverse Ecosystem" table and `install.packages("tidyverse")` — already in ch08 `#sec-core-tidyverse-packages`.
- SW Week1 "R Resources" table — ch07 "Additional Resources" already lists the same links.
- SW Week1 "Transcriptomic Data Analysis" exercise — course-specific dataset not available in this repo.
- SW Week2 tibble/dplyr/ggplot slides — wrangling and visualization mechanics, outside this assignment (ch08/ch09 agents).
- SB "Practice Exercises" R.2–R.6, R.8–R.10 — equivalent exercises already exist in ch07; only R.1 and R.7 had no counterpart and were added.
- SB "Basic Statistics on Vectors" (`mean/median/var/sd`) — identical to ch07 `#sec-using-functions`.
- SB A4 "Statistical Functions" table — statistics; the book's appendix already carries an identical copy, left untouched.

---

# D-quarto change log

Sources read: `SB/chapters/05-markdown-latex.qmd`, `SB/chapters/A5-quarto-reference.qmd`, `SB/chapters/A6-latex-reference.qmd`, `SB/chapters/A7-greek-letters.qmd`, and the Quarto section of `SW/Lecture_Folder/Week1.qmd` (lines 1399-1866; Week2 only uses LaTeX tabs for statistical formulas).

Overall finding: the Comp Tools chapters 12 and 16 already cover almost everything in SB ch. 05 and Week1, often better; `appendix-H-latex.qmd` is a verbatim copy of A6 (only table captions/ids differ). The real gaps were in A5 (citations, output-format options, CLI commands, subfigures, code-generated tables) and A7 (letter names/pronunciation). No images are involved in any of these sources.

## 1. Edits

### `/home/claude/work_Book/chapters/05-quarto-documents.qmd`

- **Learning Objectives** — added "Cite sources from a BibTeX file"; widened the rendering bullet to "from RStudio and the command line".
- **Lists (`#sec-quarto-lists`)** — added task-list syntax (`- [ ]` / `- [x]`) from A5.
- **Links and Images (`#sec-links-and-images`)** — added automatic links `<url>` from A5.
- **Tables (`#sec-quarto-tables`)** — added "Tables produced by code": R/Python tabset showing a `tbl-` labelled chunk with `tbl-cap` (`knitr::kable`, pandas `to_markdown`), pointing to `gt` in @sec-tidy-data. Fills the gap that SB exercise M.4 and A5 cover (code-generated, cross-referenceable tables).
- **Common YAML Options (`#sec-common-yaml-options`)** — example header and @tbl-yaml-options now include `number-sections`, `execute: message`, and `bibliography` (A5); added a warning callout on YAML indentation/colon pitfalls.
- **Figure Options (`#sec-figure-options`)** — @tbl-figure-options gained `fig-dpi`, `fig-subcap`, `layout-ncol`; added a subfigure example with `@fig-name-1` references (A5 "Multiple Figures").
- **Callout Blocks (`#sec-callout-blocks`)** — added @tbl-callout-types (type / color / use) from A5.
- **Cross-References (`#sec-cross-references`)** — replaced the inline enumeration of prefixes with @tbl-crossref-prefixes (figure, subfigure, table, section, equation, listing, where each id goes) plus a sentence on theorem-style prefixes and capitalised `@Fig-`; added a note under Equations that the label must follow `$$` on the same line and a pointer to the new ch16 aligned-equation section.
- **NEW section `## Citations {#sec-quarto-citations}`** (after Cross-References) — BibTeX entry anatomy, `bibliography:` YAML key, `@key`, `[@a; @b]`, page/prefix forms, in-text vs parenthetical rendering, `::: {#refs}`, `csl`, tip on Zotero/Google Scholar export. From A5 "Citations". The book cites sources on nearly every page but never explained the mechanism.
- **From RStudio (`#sec-from-rstudio`)** — added insert-chunk and run-chunk shortcuts (A5 keyboard shortcuts), cross-ref to @sec-appendix-shortcuts.
- **Live Preview (`#sec-live-preview`)** — added `--port` and `--no-browser` (A5 preview options).
- **NEW subsection `### The Quarto Command Line {#sec-quarto-cli}`** with @tbl-quarto-commands: render/preview variants, `--to all`, `--output`, `-P` params, `quarto create project`, `quarto check`, `quarto install tinytex`, `quarto publish gh-pages`, `--version`. From A5 "Common Quarto Commands".
- **Multiple Output Formats (`#sec-output-formats`)** — fixed the "render all formats" command to `quarto render document.qmd --to all` (plain `quarto render` only produces the first listed format) and said so; added three new subsections from A5 "Document Output Options": `### HTML Options {#sec-html-output}` (+ @tbl-html-options, `embed-resources` advice), `### PDF Options {#sec-pdf-output}` (+ @tbl-pdf-options, tinytex note), `### Word Options {#sec-word-output}` (`reference-doc` and how to obtain a template).
- **Summary** — cross-references bullet now mentions citations.
- **Exercises** — Exercise 4 step 2 uses `--to all`; added **Exercise 5: Tables, Cross-References, and Citations** (adapted from SB exercise M.4 plus the new citations section).

### `/home/claude/work_Book/chapters/18-latex-basics.qmd`

- **Uppercase Greek tip** — extended with `\var...` variants and `\boldsymbol` for bold Greek (A6), pointer to the new @tbl-greek-names.
- **NEW callout "Greek letters in R plot labels"** (after the Greek section) — `expression()` / `latex2exp` for ggplot labels and raw LaTeX strings in matplotlib. From A7 "In R". Nothing in the book previously covered Greek symbols in plot labels.
- **Special Symbols (`#tbl-special-symbols`)** — added `\cup`, `\cap`, `\to`, `\Rightarrow`, `\ldots` rows (with the `\ldots` vs `\cdots` distinction) and a pointer to the appendix for logic/arrow/number-set tables.
- **Binomial Distribution** — one sentence noting `\binom{n}{k}` as the clearer alternative to `{n \choose k}` (A6).
- **Poisson Distribution — FIX**: `Pr(Y=r)` was typeset as the product of italic variables P and r; changed to `P(Y=r)` (as in SB ch. 05) and added a tip explaining `\Pr`, `\text{}`, `\operatorname{}` for upright function names.
- **NEW section `## Numbered and Aligned Equations {#sec-latex-numbered-aligned}`** (before Practical Examples) — `{#eq-...}` labels with a live demo (`#eq-einstein-demo`), `aligned` environment with `&`/`\\` explained and a numbered demo (`#eq-mean-aligned`), and a `cases` example. From A5 "Equations"/A6 "Equation Numbering in Quarto"; previously ch16 had only a one-line tip.
- **Formatting Tips — FIX**: tip said `\;` is "medium" spacing; corrected to `\:` medium / `\;` thick, added `\qquad` and `\!`, cross-ref to @sec-latex-spacing; numbering tip now points to the new section.
- **Summary** — added bullet for numbered/aligned equations.

### `/home/claude/work_Book/chapters/appendix-H-latex.qmd`

- Content already identical to SB A6; no changes to existing tables.
- **NEW subsection `### Names and Pronunciation {#sec-latex-greek-names}`** with @tbl-greek-names: all 24 letters, name, pronunciation, and the LaTeX command for lower/upper case (showing the Latin letter where no command exists). Adapted from A7's alphabet table with the statistical-uses column dropped. Note: A7 itself lists `\Alpha`/`\Beta` as commands, which do not exist in standard LaTeX/MathJax; the table here gives the correct Latin-letter form.

## 2. Images to copy

None. None of the assigned sources contain figures, and no image references were added to the targets.

| source path on disk | destination path |
|---|---|
| (none) | (none) |

## 3. Skipped

- SB 05 "Statistical Formulas" block (mean, variance, binomial, Poisson, normal) — ch16 `#sec-stat-equations` and the appendix already carry the same formulas as typesetting examples; no new syntax.
- SB 05 Markdown basics, headers, block quotes, code, inline/display math, superscripts, fractions, roots, sums, integrals, matrices — all already covered in ch12/ch16 at equal or greater depth.
- SB 05 exercises M.1-M.3 — equivalent to ch12 Exercises 1-3; only M.4 (tables/kable) was new and became Exercise 5. Note that M.1/M.2 still use R Markdown wording (`knit`, `echo=TRUE`), which is older than the Quarto-style exercises already in ch12.
- A5 grid tables — rarely needed; pipe tables suffice for the course.
- A5 Quick Reference Summary — duplicates content that ch12 presents with live examples.
- A5 theorem/lemma/proof prefixes — mentioned in one sentence only; not a bioengineering need.
- A6 "Statistical Notation" and "Common Statistical Formulas" tables — already present in the appendix verbatim.
- A7 "Common Statistical Uses" column, "Most Commonly Used Letters in Statistics", "Conventions and Mnemonics" (Greek = parameter, Roman = statistic), "Common Formulas Using Greek Letters" (regression, chi-square, ANOVA F) — statistics content, out of scope.
- SW Week1 Quarto slides (document structure, markdown table, chunk options, images, equations, cross-referencing table, formats) — subset of ch12; nothing newer. The gene-expression/ANOVA worked example is statistics.
- SW Week2 "LaTeX" tabs — they show the LaTeX source of statistical formulas (probability rules, distributions); typesetting is already covered and the formulas are statistics.

---

# E-tidy-viz change log

Sources read: `SB/chapters/06-tidy-data.qmd`, `SB/chapters/07-data-wrangling.qmd`, `SB/chapters/14-data-visualization.qmd`, the tooling parts of `SB/chapters/08-exploratory-data-analysis.qmd` (data inspection, duplicates), and the tidyverse/ggplot mechanics slides of `SW/Lecture_Folder/Week2.qmd` (lines 115–830). `Week3.qmd` was skimmed by header and contains no tidyverse/ggplot mechanics (hypothesis testing, bootstrapping, loops), so nothing was pulled from it.

Targets: `/home/claude/work_Book/chapters/08-tidy-data.qmd`, `/home/claude/work_Book/chapters/14-data-visualization.qmd`. Neither target chapter uses R/Python tabsets, so none were added. R is not installed in this environment, so code was checked by reading, not by rendering.

## 1. Edits

### `work_Book/chapters/08-tidy-data.qmd`

| Section | Change |
|:--|:--|
| Learning objectives | Added `glimpse()` and missing-value objectives to match new content. |
| The Three Principles (`#sec-tidy-principles`) | Added tidy-structure figure (`tidy_data_structure.jpeg`); added Wickham's alternative third rule (observational unit → table) with cross-ref to Problem 4; added SB's "two practical instructions" and the definition of data wrangling. |
| Preserving Raw Data callout | Added SB's advice to keep raw files in a separate, write-protected directory and to clean programmatically (cross-ref `@sec-chmod`). |
| NEW `### Data File Do's and Don'ts {#sec-data-file-dos-donts}` | Pulled SB's Do/Don't list, keeping only items not already covered by the naming and spreadsheet sections (delimiter characters in values, pasting from Word, Excel converting SEPT1/MARCH1 to dates, empty separator rows/columns, adding observations as rows, ISO dates, consistent NA, metadata). |
| Categorical vs. Quantitative | Added SB's discrete/continuous distinction and the ratio-vs-interval "twice as much" example. |
| R Data Types (`#sec-r-data-types`) | Added SB's kinds-of-data → R type table (`@tbl-r-data-types`, includes Date/POSIXct); added the SW R vector types hierarchy SVG (`@fig-r-vector-types`); added Date and `typeof()` to the code example; added `class()` vs `typeof()` explanation and why types matter. |
| Core Tidyverse Packages | Added SB's concrete conflicts example (`dplyr::filter()` masks `stats::filter()`) with cross-ref to `@sec-namespace-conflicts`. |
| The Pipe Operator (`#sec-pipe`) | Added SB's "read it as *then*" intro and the pipe-operator figure (`pipe_operator.jpeg`); linked to the Unix pipe (`@sec-pipes`). |
| The magrittr Pipe | **Fix:** target said `%>%` "has additional features" without saying what; replaced with a concrete comparison (`.` vs `_` placeholder, parentheses, no package needed) and a recommendation. Added the Ctrl/Cmd+Shift+M shortcut with cross-ref to `@sec-appendix-shortcuts`. |
| `filter()` | Added SW's conditional-operators table (`@tbl-filter-operators`), the Boolean set-operations Venn SVG (`@fig-boolean-venn`), and a warning that `filter()` drops rows where the condition is `NA`. |
| `select()` | Added `everything()` reorder example and SB's list of selection helpers (`ends_with`, `contains`, `matches`, `num_range`, `where`, `everything`) with note that they also work in `pivot_longer()`/`across()`. |
| `arrange()` | Added SB's note that `NA` always sorts last. |
| `mutate()` | Added SB's "new columns can reference earlier ones" and list of common mutate functions, cross-referenced to the existing ch07 sections (`lead/lag`, cumulative, ranking, `if_else`). |
| `summarize()` | Added `summarise()` alias, list of common summary functions, and SW's `na.rm = TRUE` warning callout. |
| `group_by()` | **Fix:** comment "Multiple grouping variables" sat above code that grouped by one variable; reworded to "Several summaries at once, sorted by the result". Added SB's grouped-`mutate()` example (rank within group, centre on group mean), the three facts about grouped tibbles (printing, `summarize()` peels one level, `ungroup()`), and a `.groups = "drop"` example. |
| NEW `## Handling Missing Values {#sec-missing-values}` (after Chaining, before Tibbles) | Pulled SB ch07 missing-value section plus the `colSums(is.na())`/`across()` inspection from SB ch08: detecting (`is.na`, `across`, `colSums`), dropping (`filter(!is.na())`, `drop_na()`), replacing (`replace_na()` single and list form, `if_else` with mean), and an "understand before you delete" warning. Subsections `#sec-detecting-missing-values`, `#sec-dropping-missing-values`, `#sec-replacing-missing-values`. |
| Tibbles intro | Added tibbles figure (`tibbles.jpeg`) and cross-ref to base data frames. |
| NEW `### Inspecting Tibbles {#sec-inspecting-tibbles}` | Pulled SB's column-type abbreviations table (`@tbl-tibble-type-abbreviations`), `glimpse()` (also the only tooling item worth taking from SB ch08), `$`/`[[` extraction, and note that base inspection functions work on tibbles. |
| Tibble Advantages | Added "no row names" advantage with `rownames_to_column()` example (SB); clarified printing/warning behaviour. |
| `count()` | Added SB's equivalence to `group_by/summarize`, counting combinations, and `wt =` weighted counts. |
| `distinct()` | Added SB's multi-column, `.keep_all = TRUE`, and bare `distinct()` forms plus the duplicate-check idiom (`duplicated()`) from SB ch08 data-quality checks. |
| `slice()` | Added `slice_sample(prop =)` and SB's grouped `slice_max()` example. |
| Lumping Rare Levels | Added `fct_lump_prop()` (SB). |
| Types of Joins | Added mutating vs. filtering join terminology (SB). |
| Anti Join | Added the reversed anti-join (measurements with no sample record) as a data-quality check (SB). |
| NEW `### Full and Semi Joins {#sec-full-semi-join}` | Added `full_join()` and `semi_join()` examples on the existing sample tables (SB). |
| NEW `### Cleaning Names While Pivoting {#sec-pivot-longer-options}` | Pulled SB's `names_prefix`/`names_transform` example and the `names_to = c(...)` + `names_sep` split example; noted `cols = -sample`. |
| Pivot Wider | Added `names_prefix` example (SB). |
| Unite | Added `remove = FALSE` (SB) and a new `separate()` by character position example (`sep = c(4, 6)`) (SB). |
| Summary | **Fix:** the "see @sec-appendix-r" callout had been inserted in the middle of the data.table bullet list, splitting it; moved the callout after the list. Updated bullets for missing values, `glimpse()`, and pivot options. |
| Exercises | Added Exercise 12 (missing data + `airquality`/`glimpse`), adapted from SB ch07 Exercise 6 and SB ch06 Exercise 7.6. |

### `work_Book/chapters/14-data-visualization.qmd`

| Section | Change |
|:--|:--|
| Learning objectives | Expanded to cover mapping vs. setting, chart selection, scales, honest axes, saving. |
| Why Visualize Data? | Added SB's one-sentence reading of the four Anscombe panels and the "Always Visualize Your Data" callout. |
| The Grammar of Graphics | Added Wilkinson attribution and SB's component sentence. |
| Choosing the Right Chart Type | Added SB's variable-type decision list (one categorical, one continuous, ...) and the SW chart-selection flow chart SVG (`@fig-chart-selection`). |
| NEW `### Mapping vs. Setting Aesthetics {#sec-mapping-vs-setting}` | Inside-vs-outside `aes()` distinction (SB Aesthetic Mappings + Exercise V.3), with a side-by-side patchwork figure and the `aes(color = "blue")` pitfall. |
| Combining Geoms | Added note on layer-level vs. plot-level aesthetics and that `geom_smooth()` defaults to LOESS/GAM (SB). |
| Faceting | Added SB's small-multiples paragraph with the Tufte quote; added `scales = "free"` note after `facet_grid()` (SB Exercise V.4). |
| Themes | Added `theme_light/dark/void`, ggthemes, and `theme_set()` (SB). |
| NEW `#### Fine-Tuning with theme()` | Rotated axis labels + legend position example from the SW boxplot slide; explanation of `element_*()` and ordering after a complete theme. |
| NEW `### Log Scales {#sec-log-scales}` | SB's log-transformation figure (linear vs. log axes on simulated log-normal expression) and "when to use log scales" guidance; noted zero/negatives and pseudo-log. |
| Color Scales | Expanded with SB's three scale types (qualitative/sequential/diverging), a new figure with `scale_fill_viridis_c()` tile and `scale_fill_gradient2()` correlation heat map, the `scale_<aes>_<family>_d/_c` naming pattern, and SB's "Avoid Rainbow Scales" warning. |
| Best Practices intro | Added Tufte quote and the five principles (SB/SW). |
| Show the Data | Added "Above all else show the data" tagline (SW). |
| Use Position and Length | Added Cleveland–McGill hierarchy of visual encodings (SB). **Fix:** the existing figure's caption promised a bar-vs-pie comparison but showed only a bar chart; replaced with SB's side-by-side bar vs. pie (patchwork, `coord_polar`). Extended the pie-chart callout. |
| Include Zero → retitled "Represent Magnitudes Honestly: When to Include Zero" (id unchanged) | Replaced the single honest bar chart with SB's truncated-vs-full side-by-side; added the `coord_cartesian()` vs `ylim()` mechanics note; added SB's line-chart "context matters" figure; added "The Zero Rule" callout. |
| Consider Color Blindness | Named the Okabe–Ito palette, added red/green warning, and SB's colour + shape redundant-encoding figure with a note on merged legends. |
| Avoid Chart Junk | Added Tufte's data-ink ratio, SB's dual-y-axis warning, and a pointer to the new overplotting section. |
| NEW `### Dense Data and Overplotting {#sec-dense-data}` (under Common Visualization Tasks) | Combined SB's overplotting/alpha figure with the SW `geom_density_2d_filled()` "three-dimensional data" slide into one three-panel figure; mentioned `geom_hex()`/`geom_bin_2d()`. |
| NEW `## Examples of Poor Graphics {#sec-poor-graphics}` | Three SW bad-graphic images (ticker tape, line to no understanding, bake sale of pie charts) each with a caption naming the violated principle; the Fox News truncated-axis vs. correct BLS line plot as a two-panel figure div (`@fig-truncated-axis-news`, referenced from the Zero Rule callout); Tufte's "telling the truth" quote. Used SW's individual images rather than SB's `ch09_poor_graphics_1/2.jpeg` composites because the SW filenames and slide titles make their content unambiguous. |
| NEW `## A Famous Good Example {#sec-minard-map}` | Minard's map (SW S42 image; SB text expanded to say which visual channel carries each of the six variables) and the FiveThirtyEight modern recreation (SW S43). |
| Saving Plots | Added SB's "format inferred from extension", last-plot default, explicit width/height, dpi, and vector-format advice. |
| Summary | Updated bullets for the new material. |
| Exercises | Added Exercise 6 (mapped vs. set, from SB V.3) and Exercise 7 (log scales, `coord_cartesian` vs `ylim`, critique a published chart). |

## 2. Images to copy

| Source path on disk | Destination path |
|:--|:--|
| `BioE_Stats_Book copy/images/ch06/ch06_tidy_structure.jpeg` | `Book/images/tidy_data_structure.jpeg` |
| `BioE_Stats_Book copy/images/ch06/ch06_tibbles.jpeg` | `Book/images/tibbles.jpeg` |
| `BioE_Stats_Book copy/images/ch07/ch07_pipe_operator.jpeg` | `Book/images/pipe_operator.jpeg` |
| `BioE_Stats_Wi2026 copy/Lecture_Folder/images/week_02_S12_r_vector_types_hierarchy.svg` | `Book/images/r_vector_types_hierarchy.svg` |
| `BioE_Stats_Wi2026 copy/Lecture_Folder/images/week_02_S14_boolean_set_operations_venn.svg` | `Book/images/boolean_set_operations_venn.svg` |
| `BioE_Stats_Wi2026 copy/Lecture_Folder/images/week_02_S32_flow_chart_for_choosing_data_v.svg` | `Book/images/chart_selection_flow_chart.svg` |
| `BioE_Stats_Wi2026 copy/Lecture_Folder/images/week_02_S36_bad_ticker_tape_parade_of_data.jpeg` | `Book/images/bad_graphic_ticker_tape.jpeg` |
| `BioE_Stats_Wi2026 copy/Lecture_Folder/images/week_02_S37_bad_a_line_to_no_understanding.jpeg` | `Book/images/bad_graphic_line_to_nowhere.jpeg` |
| `BioE_Stats_Wi2026 copy/Lecture_Folder/images/week_02_S41_bad_a_bake_sale_of_pie_charts.jpeg` | `Book/images/bad_graphic_pie_chart_bake_sale.jpeg` |
| `BioE_Stats_Wi2026 copy/Lecture_Folder/images/week_02_S48_misleading_chart_truncated_yaxis.jpeg` | `Book/images/bad_graphic_truncated_y_axis_news.jpeg` |
| `BioE_Stats_Wi2026 copy/Lecture_Folder/images/week_02_S48_correct_unemployment_line_plot.jpeg` | `Book/images/good_graphic_unemployment_line_plot.jpeg` |
| `BioE_Stats_Wi2026 copy/Lecture_Folder/images/week_02_S42_minards_map_of_napoleons_russi.jpeg` | `Book/images/minard_napoleon_russian_campaign.jpeg` |
| `BioE_Stats_Wi2026 copy/Lecture_Folder/images/week_02_S43_modern_recreation_of_minard_st.jpeg` | `Book/images/minard_style_modern_recreation.jpeg` |

Where a Mermaid/JPEG pair with an SVG export existed in SW (vector types, Boolean Venn, chart-selection flow chart), the SVG was used per the instructions. None of the destination basenames collide with anything in `_audit_imagelist.txt`.

## 3. Skipped

- **SB ch06 `ch06_tidy_principles.jpeg` and `ch06_tidyverse_packages.jpeg`; SW `week_02_S08_tidyverse_packages.jpeg`, `S09_mpg_tibble_variable_definitions.jpeg`, `S11_tidy_data_variables_observations.jpeg`** — the target already has `tidyverse_packages.jpeg`; the tidy-structure image covers the same idea as S11 and the tidy-principles banner; the mpg variable-definitions table is dataset documentation, not a concept.
- **SW `week_02_S23_grammar_of_graphics_layers.jpeg`** — target already has `visualization_grammar_of_graphics.jpeg` for the same topic; could not judge which is better without viewing, so kept the existing one.
- **SW `week_02_S25_boxplot.jpeg/.svg` and the "DRAFT: Boxplot Anatomy with Normal Distribution" slide** — target already has `visualization_boxplot_anatomy.jpeg`; the draft slide is about quantiles of the normal distribution (statistics).
- **SW `S38`, `S39`, `S40` bad-graphic slides ("Wack a mole", "Disk of disinformation", "Steaming pie chart mess")** — auto-generated filenames (`displaying_temporal_patterns`, `choosing_appropriate_bin_width`, `relationships_between_variable`) contradict the slide titles, so the content could not be identified reliably.
- **SW `S45_tufte_1983.jpeg`, `S46_the_economist_2006.jpeg`, `S47_rattenborg_et_al_1999_nature.jpeg`** — no caption text describing what the figure shows or whether it is a good or bad example; the principles they illustrate are covered in prose instead.
- **SB `ch09_poor_graphics_1/2.jpeg`, `ch09_minard_map.jpeg`, `ch09_chart_selection.jpeg`** — superseded by the individually labelled SW images / SVG of the same content.
- **SB ch07 `nycflights13` examples** — the target already demonstrates every verb on its own small `experiments` tibble, which renders without an extra package; only the mechanics (not the flights examples) were carried over.
- **SB ch07 "Why Factor Order Matters" alphabetical-vs-ordered bar charts** — target's `fct_reorder()` and ch09's `reorder()` sections already show this.
- **SB ch09 small-multiples `gapminder` figure** — the idea was added in prose to the Faceting section; the figure needs the `gapminder` package and duplicates the existing facet examples.
- **SB ch09 "Data Transformations" beyond log scales** — nothing else there.
- **SB ch08 (EDA)** — all statistical content (distributions, correlation, outlier detection, robust statistics, Tukey's fences, MCAR/MAR/MNAR) skipped per instructions; only `glimpse()`, `colSums(is.na())`, and the `duplicated()`/`distinct()` idiom were taken.
- **SW Week2 exercises** referencing `Week1b_Stickle_RNAseq.tsv`/`knee_injury.csv` — course-specific data files not present in the Comp Tools book.
- **SW Week3** — no computational-tools content in scope for these chapters (loops/if-else are already in ch07 and ch13).

---

# F-systems-git-hpc — change log

Sources compared: `SW/Lecture_Folder/Appendix_A.qmd` (computer systems), `Appendix_E.qmd` (Git/GitHub/Pages), `Appendix_F.qmd` (Talapas/SLURM), `SB/chapters/A11-high-performance-computing.qmd`, `SB/chapters/A2-keyboard-shortcuts.qmd`.

Overall finding: the Comp Tools book chapters are already broader and newer than these stats appendices on Git and HPC (the book has Talapas-2 partitions, fair-share, `seff`, job arrays, workflow managers, SSH keys, `git switch`, etc., none of which the stats sources have). The useful pulls were (a) the SVG diagram exports, which the book chapters were still drawing as Mermaid, (b) OS/hardware detail from Appendix A that the book skipped, (c) a handful of Git/`parallel` items, and (d) a fuller shortcuts appendix. Several factual errors in the shortcuts appendix were fixed along the way.

## 1. Edits

### `work_Book/chapters/06-computer-systems.qmd`
- **What Is a Computer System?** — replaced the Mermaid `fig-computer-components` with the SVG export `appendix_A_S02_computer_components.svg` (same fig id); added a short paragraph on the input/output system (Appendix A "I/O Systems" slide), including the point that a network interface is both input and output.
- **Fetch-Decode-Execute** — replaced Mermaid `fig-fetch-decode-execute` with `appendix_A_S03_fetch_decode_execute.svg` (same id).
- **RAM** — added "Bandwidth and Latency" (with dual channel) from the Appendix A RAM slide; expanded the DRAM/SRAM bullets (DDR4/DDR5, refresh, cost). This also fixes the "Types." run-in list that BOOK_AUDIT #20 flagged as broken.
- **Operating Systems** — new `### How an Operating System Is Organized {#sec-os-architecture}` with the kernel/system-call/driver explanation and the SVG `appendix_A_S13_os_architecture.svg` as `fig-os-architecture` (BOOK_AUDIT #20).
- **Operating Systems** — new `### CPU Scheduling {#sec-cpu-scheduling}` (FCFS/SJF/RR/priority + the five performance metrics, tied to SLURM via `@sec-scheduler-fairshare`) and `### Security and Protection {#sec-os-security}` (user vs kernel mode, memory protection, permissions → `@sec-file-permissions`, sandboxing → containers `@sec-software-layers`), both from Appendix A.
- **Local Computing** — added `appendix_A_S21_local_computing_arch.svg` as `fig-local-architecture` with one sentence on the hardware abstraction layer (BOOK_AUDIT #21).
- **Cluster Computing** — replaced Mermaid `fig-cluster-architecture` with `appendix_A_S24_cluster_computing.svg`; added **Interconnect** (InfiniBand/10GbE) and named parallel file systems (Lustre, GPFS) in Shared Storage; added the resource-manager table (`tbl-resource-managers`: SLURM/PBS/SGE/Kubernetes) (BOOK_AUDIT #19); added "fault tolerance" advantage and "infrastructure cost" disadvantage from the pros/cons slide.
- **Cloud Computing** — replaced Mermaid `fig-cloud-architecture` with `appendix_A_S27_cloud_computing.svg`; added the one-line characterizations of the three providers and an explanation of regions/availability zones; added "compliance/data residency" and "noisy neighbours" disadvantages.
- **Evolution of Scientific Computing** — replaced Mermaid `fig-computing-evolution` with `appendix_A_S18_computing_timeline.svg` and put the six eras into the lead sentence so the text is self-contained (BOOK_AUDIT #21).

### `work_Book/chapters/20-git-github.qmd`
- **Key Concepts** — replaced Mermaid `fig-git-workflow` with `appendix_E_S03_git_workflow.svg` (same id).
- **Viewing History** — added `git log -p` to the example block and a sentence on what a commit records (hash, author, date, message).
- **Working with GitHub** — added a "for a research project specifically" block (reproducibility, README/wiki/Pages, Issues with `#12` linking, Releases + Zenodo DOI with cross-refs to `@sec-git-tags` and `@sec-general-repositories`) from Appendix E "GitHub for Scientific Collaboration" (closes BOOK_AUDIT #67).
- **Push and Pull** — added a **Fetching** subsection (`git fetch`, `git log main..origin/main`, `git merge origin/main`; "pull = fetch + merge") from Appendix E "Working with Remotes" (BOOK_AUDIT #68).
- **Branching** — replaced Mermaid `fig-git-branching` with `appendix_E_S12_git_branching.svg`.
- **GitHub Pages** — replaced Mermaid `fig-github-pages` with `appendix_E_S16_github_pages.svg`.
- **Useful Commands Reference** — added rows for `git fetch`, `git log -p`, `git help <command>`; clarified `git pull` as "download and merge" (BOOK_AUDIT #68).

### `work_Book/chapters/appendix-I-git.qmd`
- **Setup and Configuration** table — added `git --version` and `git help CMD` rows.
- **Common .gitignore Entries** — added `.ipynb_checkpoints/`, `.Rproj.user/`, and the bioinformatics data patterns (`*.fastq`, `*.fastq.gz`, `*.bam`, `*.vcf`, `data/raw/`) from Appendix E so the appendix matches ch. 10.

### `work_Book/chapters/16-hpc-talapas.qmd`
- **Talapas Architecture** — replaced Mermaid `fig-talapas-architecture` with `appendix_F_S03_talapas_architecture.svg` (same id; caption notes the SVG's "fat nodes" = high-memory nodes and the `sbatch`/`srun` paths).
- **SLURM: The Job Scheduler** — replaced Mermaid `fig-slurm-workflow` with `appendix_F_S10_slurm_workflow.svg`; added the three-term vocabulary sentence (job / partition / account) from Appendix F "Key Concepts".
- Storage diagram (`fig-storage-structure`) deliberately **kept as Mermaid**: the book's version includes `/scratch` and quotas, which the SVG `appendix_F_S09_storage_structure.svg` lacks (it only shows `/home`, `/projects`, `/tmp`).

### `work_Book/chapters/appendix-G-slurm.qmd`
- **Talapas-Specific Information** — new `### Talapas Helper Commands {#sec-talapas-helpers}` table (`groups`, `/packages/racs/bin/slurm-show-gpus`, `SBATCH_ACCOUNT` default, `df -h ~`/`du -sh`) collecting the Appendix F helper commands that were only in ch. 11 prose.
- **Example Job Scripts → Basic R Script** — fix: added `set -euo pipefail` and `module purge` so the example follows the rule the appendix itself states a few lines earlier ("modules must be loaded INSIDE the script").

### `work_Book/chapters/17-parallel-computing.qmd`
- **The Future Ecosystem** — added a callout "Base R's `parallel` package" (`detectCores`/`makeCluster`/`parLapply`/`stopCluster`, `eval: false`) from SB A11 "Parallelization in R", framed as "read it when you meet it, write `future`/`furrr`". Nothing else in A11 adds to the book (its hostname `talapas-login.uoregon.edu` and partition `short` are out of date).

### `work_Book/chapters/appendix-A-shortcuts.qmd`
- Intro — now names Vim, Jupyter, VS Code, Positron and points to the new platform section.
- **RStudio → Code Execution** — fixes: `Cmd/Ctrl+Alt+R` is *Run all* (was "run all code above"), `Cmd/Ctrl+Alt+E` is *run from current line to end* (was "beginning to current line"), added the correct `Cmd/Ctrl+Alt+B` (beginning to current line); replaced the "`Cmd/Ctrl+Shift+P` = run previous code again" row with *Command palette* (that is the binding in RStudio ≥ 1.4); `Cmd/Ctrl+Shift+Enter` now says "source with echo / run current chunk". Added `Esc` (interrupt), `Ctrl+L` (clear console), `Cmd/Ctrl+↑` (history popup), `Cmd/Ctrl+Shift+F10` (restart R) from SB A2.
- **RStudio → Editing** — added `Cmd/Ctrl+Shift+R` (insert section) and `Cmd/Ctrl+F` (find/replace) from A2.
- **RStudio → Files** — fix: *Save all* is `Cmd/Ctrl+Alt+S` (the table had `Cmd/Ctrl+Shift+S`, which duplicated *Source* in the execution table; A2 has the same error).
- **Jupyter** — added command-mode `R` (raw), `1`–`6` (headings), `Shift+O` (output scrolling), `I I` (interrupt kernel), `0 0` (restart kernel), `S` (save); edit-mode `Ctrl+]`/`Ctrl+[`, `Ctrl+/`, undo/redo; plus a sentence that the same keys work in JupyterLab on Open OnDemand and in VS Code/Positron notebooks.
- **VS Code → General** — added Explorer/Search/Source Control/Extensions panels, split editor `Cmd/Ctrl+\`, close tab, new window, Markdown preview `Cmd/Ctrl+Shift+V`, Quarto render `Cmd/Ctrl+Shift+K` (with the note that outside `.qmd` it deletes the line); added the "Where is the backtick?" callout (BOOK_AUDIT #77).
- **VS Code → Editing** — added insert line below/above, indent/outdent `]`/`[`, select line, jump to matching bracket; fix: Mac find-and-replace is `Cmd+Alt+F`, not `Cmd+H` (BOOK_AUDIT #77).
- **VS Code → Navigation** — fix: `Cmd/Ctrl+U` is *cursor undo*, not "go back"; go back/forward on Windows/Linux is `Alt+←`/`Alt+→` (Mac `Ctrl+-`/`Ctrl+Shift+-`); added `Ctrl+Tab`, last-edit location, file start/end.
- **VS Code** — new `### Multiple Cursors and Selection {#sec-vscode-multicursor}` and `### Integrated Terminal {#sec-vscode-terminal}` tables from A2.
- New `## Positron Shortcuts {#sec-positron-shortcuts}` (`tbl-positron`): send to console, run chunk, pipe, assignment, render, Markdown preview, restart interpreter, help (BOOK_AUDIT #77; consistent with `@tbl-vscode-shortcuts` in the toolkit chapter).
- New `## Platform Differences {#sec-shortcut-platforms}` (`tbl-shortcut-platforms`) from A2, extended with the "terminal/Vim keep Ctrl on macOS" rule and the macOS *Option as Meta* setting needed for `Alt+B`/`Alt+F`; plus the "Customizing shortcuts" callout from A2 (RStudio, VS Code/Positron `keybindings.json`, JupyterLab, `~/.inputrc`).
- **Screen** table — fix: escaped the `|` in the `Ctrl+A |` row (unescaped pipe inside a pipe table breaks the row).

## 2. Images to copy

All book references use `../images/<basename>`. The first ten are already listed under `Book/images/` in `_audit_imagelist.txt` (copied during the earlier lecture audit) but were not yet referenced by any chapter; they are listed here so every reference has a source. The last two are new copies.

| Source path on disk | Destination path | Referenced from |
|:--|:--|:--|
| `BioE_Stats_Wi2026 copy/Lecture_Folder/images/appendix_A_S02_computer_components.svg` | `Book/images/appendix_A_S02_computer_components.svg` (already present) | `06-computer-systems.qmd` fig-computer-components |
| `BioE_Stats_Wi2026 copy/Lecture_Folder/images/appendix_A_S03_fetch_decode_execute.svg` | `Book/images/appendix_A_S03_fetch_decode_execute.svg` (already present) | `06-computer-systems.qmd` fig-fetch-decode-execute |
| `BioE_Stats_Wi2026 copy/Lecture_Folder/images/appendix_A_S13_os_architecture.svg` | `Book/images/appendix_A_S13_os_architecture.svg` (already present) | `06-computer-systems.qmd` fig-os-architecture |
| `BioE_Stats_Wi2026 copy/Lecture_Folder/images/appendix_A_S18_computing_timeline.svg` | `Book/images/appendix_A_S18_computing_timeline.svg` (already present) | `06-computer-systems.qmd` fig-computing-evolution |
| `BioE_Stats_Wi2026 copy/Lecture_Folder/images/appendix_A_S21_local_computing_arch.svg` | `Book/images/appendix_A_S21_local_computing_arch.svg` (already present) | `06-computer-systems.qmd` fig-local-architecture |
| `BioE_Stats_Wi2026 copy/Lecture_Folder/images/appendix_A_S24_cluster_computing.svg` | `Book/images/appendix_A_S24_cluster_computing.svg` (already present) | `06-computer-systems.qmd` fig-cluster-architecture |
| `BioE_Stats_Wi2026 copy/Lecture_Folder/images/appendix_A_S27_cloud_computing.svg` | `Book/images/appendix_A_S27_cloud_computing.svg` (already present) | `06-computer-systems.qmd` fig-cloud-architecture |
| `BioE_Stats_Wi2026 copy/Lecture_Folder/images/appendix_E_S03_git_workflow.svg` | `Book/images/appendix_E_S03_git_workflow.svg` (already present) | `20-git-github.qmd` fig-git-workflow |
| `BioE_Stats_Wi2026 copy/Lecture_Folder/images/appendix_E_S12_git_branching.svg` | `Book/images/appendix_E_S12_git_branching.svg` (already present) | `20-git-github.qmd` fig-git-branching |
| `BioE_Stats_Wi2026 copy/Lecture_Folder/images/appendix_E_S16_github_pages.svg` | `Book/images/appendix_E_S16_github_pages.svg` (already present) | `20-git-github.qmd` fig-github-pages |
| `BioE_Stats_Wi2026 copy/Lecture_Folder/images/appendix_F_S03_talapas_architecture.svg` | `Book/images/appendix_F_S03_talapas_architecture.svg` (**new copy**; the same file already exists in `Lecture_Folder/images/`) | `16-hpc-talapas.qmd` fig-talapas-architecture |
| `BioE_Stats_Wi2026 copy/Lecture_Folder/images/appendix_F_S10_slurm_workflow.svg` | `Book/images/appendix_F_S10_slurm_workflow.svg` (**new copy**; also in `Lecture_Folder/images/`) | `16-hpc-talapas.qmd` fig-slurm-workflow |

Not used: `appendix_F_S09_storage_structure.svg` (book's Mermaid storage figure is more complete, see above); `00.not_used/*` and `00.Maybe_use/week5_Talapas.jpg` (excluded folders).

## 3. Skipped

- **Appendix A "Coding vs. Scripting" / "Why coding"** — already covered, in more detail, in ch. 1 `@sec-coding-vs-scripting`.
- **Appendix A GPU slides (SMs, CUDA cores, VRAM, CPU-vs-GPU table)** — book §GPUs already has the same content plus a comparison table and a callout.
- **Appendix A "Computational Tools for This Course" roadmap** — stats-course navigation, not book content.
- **Appendix E install/configure, init/clone, add/commit, branching commands, daily cycle, `.gitignore`, GitHub Pages setup** — book ch. 10 already has all of it, with newer syntax (`git switch`, `git restore`) and authentication (SSH keys / PAT / `gh`) that the stats appendix lacks. The appendix's `git checkout -b` examples were *not* pulled (book standard is `git switch -c`).
- **Appendix E "GitHub Learning Lab" link** — retired service; book already lists GitHub Skills–era resources.
- **Appendix E "Make changes in RStudio" Pages step** — book is editor-agnostic (VS Code/Positron/RStudio).
- **Appendix F node table and partition list** (`short`, `long`, `fat`, `preempt`, K80 GPUs) — Talapas-1 information; the book's ch. 11 and SLURM appendix already carry the Talapas-2 tables (`compute`/`computelong`, `gpu`, `interactive` 12 h, `memory` up to 4 TB).
- **Appendix F "Windows: PuTTY/MobaXterm" and "Off campus: VPN first"** — superseded by the book's WSL/Remote-SSH guidance and its "VPN recommended, not required" statement.
- **Appendix F `--account=nereus` example** — real PIRG name; book uses `myPIRG`.
- **Appendix F batch template, GPU script, LMOD tips, best practices, getting help, acknowledgment text** — identical or less complete than what ch. 11 already has.
- **SB A11 everything except the `parallel` snippet** — outdated hostname/partition/module versions; book ch. 11 and 14 supersede it.
- **SB A2 Bash/Vim tables** — book appendix is already a superset.
- **SB A2 `Ctrl+D` "delete line" in RStudio/Jupyter edit mode** — not pulled; in Jupyter edit mode `Ctrl+D` is not delete-line by default, and RStudio already has it in the book's table.

---

# G-lectures - change log

Scope: Comp Tools reveal.js decks (`work_Lectures/Lecture_00..10`) and site pages (`work_site/Resources.qmd`; `Software.qmd` deliberately **not** edited - see suggestions below). Sources: `SW/Lecture_Folder/Week1.qmd`, `Appendix_A..F.qmd`, tools slides of `Week2.qmd`, `SW/Software.qmd`, `SW/Resources.qmd`, `SW/Policies.qmd`, `SW/scripts/*.py`.

General finding: the Comp Tools decks are already newer and more detailed than the stats decks for almost every *text* topic (Lecture 00 in particular supersedes all of Week 1's shell/R/Quarto material, and Lectures 04-06, 10 fully cover Appendices B, C, F). The real gaps were **figures**: the stats decks have clean SVG redraws (file-system/paths/dot-dot series, pipe/redirection series, computer-system, OS, timeline, Git and GitHub-Pages diagrams) where the Comp Tools decks still use untitled Keynote JPEG exports or live Mermaid blocks. Per the shared instructions I preferred the SVG exports over Mermaid everywhere the stats source has both.

## 1. Edits

### Lecture_00_bootcamp_2026.qmd
- **Part 2 / "Redirection - send output to a file"** - swapped `w1_pipes_3.jpeg` and `w1_pipes_4.jpeg` for the SVG redraws `week_01_S130_pipe_step3.svg` / `week_01_S131_pipe_step4.svg` (same figures, cleaner vector versions from Week 1).
- **Part 2 / "Pipes - chain commands together"** - swapped `w1_pipes_5.jpeg` for `week_01_S132_pipe_step5.svg`.
- **Part 2 / after "Paths - addresses in the tree"** - inserted a figure slide "Paths in the tree" using `week_01_S44_unix_paths_highlighted.svg` (the paths slide was text-only; the Week 1 figure shows a highlighted path in the tree).
- **Part 2 / after "Hidden files and the special directories . and .."** - inserted a figure slide "Moving up the tree with `..`" using `week_01_S48_unix_dotdot_navigation.svg`.

### Lecture_01_BioE_Comp_Tools_2026.qmd
- **"What is a Computer System?"** - replaced the Mermaid block with `appendix_A_S02_computer_components.svg` (Appendix A SVG export of the same diagram).
- **"The Fetch-Decode-Execute Cycle"** - replaced Mermaid with `appendix_A_S03_fetch_decode_execute.svg`.
- **"Operating System Architecture"** - replaced Mermaid with `appendix_A_S13_os_architecture.svg`.
- **Fix:** the bare line `Operating Systems` between the I/O slide and "What is an Operating System?" was plain text (rendered as a stray paragraph on the I/O slide); made it a section header `# Operating Systems`, matching the deck's other section headers.
- **"Accessing the shell - Windows" (both slides)** - updated to the newer WSL flow used by the bootcamp and the site's Software page (`wsl --install` installs Ubuntu by default; `-d Ubuntu` only as fallback), added the "nothing appears while you type the password" note, and added Week 1's `cd /mnt/c` hint for reaching Windows files from Ubuntu.
- **New slide "Programming languages are *languages*"** after "What is the difference between coding and scripting?" - Week 1's "Programming Languages" slide (learning one helps the next, use it or lose it, computers are literal). Lecture 00 has a one-line version of this; Lecture 01 had nothing.

### Lecture_02_BioE_Comp_Tools_2026.qmd
- **"Computing Evolution"** - replaced the Mermaid timeline with `appendix_A_S18_computing_timeline.svg`.
- **"Local Computing Architecture"**, **"Cluster Computing Overview"**, **"Cloud Computing Overview"** - replaced the three Mermaid blocks with the Appendix A SVGs already on disk (`appendix_A_S21/S24/S27_*.svg`; Lecture 00 already uses them).
- **"Recipes for a shell command"** - replaced `w1_shell_command.jpeg` (set to an odd `width="150%"`) with the on-disk `appendix_B_S38_shell_command_anatomy.svg` at 80%, matching Lecture 00.
- **"Where do you get help?"** - added the "Generative AI" bullet that Appendix B and Lecture 03 have, with a read-and-test caveat.

### Lecture_03_BioE_Comp_Tools_2026.qmd
- **"Recipes for a shell command"** - same JPEG-to-SVG swap and 150%-to-80% width fix as Lecture 02.
- **"How is a computer organized?"** - swapped `w1_file_structure.jpeg` for `week_01_S42_file_structure.svg`.
- **File-system figure series** - the seven untitled JPEG slides (`week_01.012, .013, .015, .016, .017, .018, .019`) were **replaced** by the titled Week 1 SVG series: "The Unix file hierarchy" (`appendix_B_S43_unix_file_hierarchy.svg`, already on disk), "Paths - the address of a file in the tree" (S44), "Special files - the 'dot' entries" (S45), "`.` refers to the directory you are in" (S46), "`..` refers to the parent directory" (S47), "Navigating with `..`" (S48), plus a new text/code slide "Relative vs. absolute paths" (Appendix B's Concept/Examples tabset). *Deletion note:* the old JPEGs are the Keynote exports of the same sequence (SW Week 1 shows each JPEG immediately followed by its "(SVG)" redraw, which is how the mapping was inferred); the files stay on disk, so the old slides can be restored if any of them turns out to show something different from its SVG counterpart.
- **New slide "Redirection, visually"** after "Output Redirection" - two-column `week_01_S130_pipe_step3.svg` / `S131_pipe_step4.svg` (this deck had no figure for redirection).
- **New slide "Pipes, visually"** after "What are Pipes?" - `week_01_S132_pipe_step5.svg`.
- **Fix:** typo "ChaptGPT" in "Where do you get help?".

### Lecture_08_BioE_Comp_Tools_2026.qmd
- **New slide "Your IDE: the four panes"** after "Why use Python?" - Week 1's RStudio pane table, extended with the Positron equivalents (the deck subtitle promises RStudio/Positron/VS Code but had no IDE-layout slide). Uses the existing `images/RStudio_Screenshot.png`.
- **New slide "The hierarchy of R vector types"** before the second "Types of vectors of data" slide - `week_02_S12_r_vector_types_hierarchy.svg`.
- **New slide "Logical operators and filtering a vector"** after "Common gotchas" - Week 1's logical-operator table (R and Python columns), the Week 2 Boolean Venn SVG, and the `x[x > 10]` boolean-indexing example in R/Python tabs.
- **New slide "Converting types and handling missing values"** - Week 1's `as.*` coercion table and NA table (never `== NA`, `as.numeric(as.character(factor))`), with a pandas/numpy tab.
- **New slide "Reading error messages"** - Week 1's "Common R Errors" table plus a matching Python table.
- **New slide "The tidyverse family of packages"** before "A taste of the tidyverse" - `week_02_S08_tidyverse_packages.jpeg` and Week 1's tidyverse package table with pandas equivalents.
- **New slides after "A taste of ggplot2"**: "The grammar of graphics: a plot is a stack of layers" (`week_02_S23_grammar_of_graphics_layers.jpeg`), "Common `ggplot2` geoms" (Week 2 geom table with seaborn equivalents, `facet_wrap`/`ggsave` tip), and "Choosing the right kind of plot" (`week_02_S32_flow_chart_for_choosing_data_v.svg`). Chart-selection and ggplot mechanics only; no statistical interpretation pulled.
- **Fix:** escaped the `|` characters inside code spans in the pre-existing "R vs Python" table row `pipe x |> f() |> g()` (unescaped pipes break Pandoc pipe tables); new tables use `\|` likewise.

### Lecture_09_BioE_Comp_Tools_2026.qmd
- **Fix:** "What is Markdown?" said YAML stands for "yet another markdown language" - corrected to "YAML Ain't Markup Language (originally Yet Another Markup Language)".
- **Fix:** the first "This is Quarto Markdown" YAML example used `output: html_document` (R Markdown syntax, not Quarto). Replaced with Week 1's Quarto header (`format: html`, plus author) and a note about the older R Markdown key.
- **New slide "One source, several output formats"** after "Rendering your document" - Week 1's multi-format YAML (`html/pdf/docx: default`) and the documents/presentations/websites table.
- **New slide "Cross-referencing everything"** after "Callouts and cross-references" - Week 1's cross-reference table (fig/tbl/eq/**sec** prefixes and `@` syntax) plus the image-with-options syntax (`{#fig-... fig-align="center" width="70%"}`).
- **"Git Workflow Concept"**, **"Branching and Merging"**, **"GitHub Pages"** - replaced the three Mermaid blocks with Appendix E's SVG exports (`appendix_E_S03_git_workflow.svg`, `S12_git_branching.svg`, `S16_github_pages.svg`).
- **Fix:** GitHub Pages "Your site is live at `https://username.github.io`" -> `https://username.github.io/repo_name` (project sites; matches Lecture 09 and Appendix E).

### Lecture_10_BioE_Comp_Tools_2026.qmd
- **"Git Workflow Concept"**, **"Branching and Merging"**, **"GitHub Pages"** - replaced the Mermaid blocks (identical source to Appendix E's) with the same three Appendix E SVGs.

### work_site/Resources.qmd
- **"Free books and tutorials / R and Python"** - added Bioconductor and Quick-R (from Week 1's "R Resources" table; the other rows - R Project, RStudio, R4DS, Stack Overflow - were already present or superseded).
- **"Getting help"** - added the Stack Overflow `[r]` and `[python]` tag links and Week 1's "paste the error into a search engine" tip.

### Not edited (per task) - suggestions for `work_site/Software.qmd` (A-toolkit owns this file)
- Nothing from `SW/Software.qmd` is missing: the Comp Tools page is a strict superset (newer WSL flow, Rtools, chip-specific R installers, Python/uv, Quarto+TinyTeX, editors, checkpoint). The only line in the stats page not present verbatim is "A terminal that allows ssh connection to Talapas", which the Comp Tools page already states in its first bullet. No changes recommended.
- Unrelated typo spotted in `work_site/Policies.qmd` (not in my target list): "We will discuss during the the class about GenAI can be a tool" - duplicated "the" and garbled clause; the SW version reads "We will discuss during the first week how GenAI can be a tool". Worth fixing by whoever owns Policies.

## 2. Images to copy

All destinations go in `Lecture_Folder/images/` and are referenced as `images/<basename>`. Original basenames kept (they are descriptive and do not collide with anything in `_audit_imagelist.txt`).

| Source path on disk | Destination path | Used in |
|---|---|---|
| `BioE_Stats_Wi2026 copy/Lecture_Folder/images/week_01_S42_file_structure.svg` | `Lecture_Folder/images/week_01_S42_file_structure.svg` | Lecture 03 |
| `BioE_Stats_Wi2026 copy/Lecture_Folder/images/week_01_S44_unix_paths_highlighted.svg` | `Lecture_Folder/images/week_01_S44_unix_paths_highlighted.svg` | Lectures 00, 03 |
| `BioE_Stats_Wi2026 copy/Lecture_Folder/images/week_01_S45_unix_dot_files.svg` | `Lecture_Folder/images/week_01_S45_unix_dot_files.svg` | Lecture 03 |
| `BioE_Stats_Wi2026 copy/Lecture_Folder/images/week_01_S46_unix_dot_current_dir.svg` | `Lecture_Folder/images/week_01_S46_unix_dot_current_dir.svg` | Lecture 03 |
| `BioE_Stats_Wi2026 copy/Lecture_Folder/images/week_01_S47_unix_dotdot_parent.svg` | `Lecture_Folder/images/week_01_S47_unix_dotdot_parent.svg` | Lecture 03 |
| `BioE_Stats_Wi2026 copy/Lecture_Folder/images/week_01_S48_unix_dotdot_navigation.svg` | `Lecture_Folder/images/week_01_S48_unix_dotdot_navigation.svg` | Lectures 00, 03 |
| `BioE_Stats_Wi2026 copy/Lecture_Folder/images/week_01_S130_pipe_step3.svg` | `Lecture_Folder/images/week_01_S130_pipe_step3.svg` | Lectures 00, 03 |
| `BioE_Stats_Wi2026 copy/Lecture_Folder/images/week_01_S131_pipe_step4.svg` | `Lecture_Folder/images/week_01_S131_pipe_step4.svg` | Lectures 00, 03 |
| `BioE_Stats_Wi2026 copy/Lecture_Folder/images/week_01_S132_pipe_step5.svg` | `Lecture_Folder/images/week_01_S132_pipe_step5.svg` | Lectures 00, 03 |
| `BioE_Stats_Wi2026 copy/Lecture_Folder/images/appendix_A_S02_computer_components.svg` | `Lecture_Folder/images/appendix_A_S02_computer_components.svg` | Lecture 01 |
| `BioE_Stats_Wi2026 copy/Lecture_Folder/images/appendix_A_S03_fetch_decode_execute.svg` | `Lecture_Folder/images/appendix_A_S03_fetch_decode_execute.svg` | Lecture 01 |
| `BioE_Stats_Wi2026 copy/Lecture_Folder/images/appendix_A_S13_os_architecture.svg` | `Lecture_Folder/images/appendix_A_S13_os_architecture.svg` | Lecture 01 |
| `BioE_Stats_Wi2026 copy/Lecture_Folder/images/appendix_A_S18_computing_timeline.svg` | `Lecture_Folder/images/appendix_A_S18_computing_timeline.svg` | Lecture 02 |
| `BioE_Stats_Wi2026 copy/Lecture_Folder/images/appendix_E_S03_git_workflow.svg` | `Lecture_Folder/images/appendix_E_S03_git_workflow.svg` | Lectures 08, 09 |
| `BioE_Stats_Wi2026 copy/Lecture_Folder/images/appendix_E_S12_git_branching.svg` | `Lecture_Folder/images/appendix_E_S12_git_branching.svg` | Lectures 08, 09 |
| `BioE_Stats_Wi2026 copy/Lecture_Folder/images/appendix_E_S16_github_pages.svg` | `Lecture_Folder/images/appendix_E_S16_github_pages.svg` | Lectures 08, 09 |
| `BioE_Stats_Wi2026 copy/Lecture_Folder/images/week_02_S08_tidyverse_packages.jpeg` | `Lecture_Folder/images/week_02_S08_tidyverse_packages.jpeg` | Lecture 07 |
| `BioE_Stats_Wi2026 copy/Lecture_Folder/images/week_02_S12_r_vector_types_hierarchy.svg` | `Lecture_Folder/images/week_02_S12_r_vector_types_hierarchy.svg` | Lecture 07 |
| `BioE_Stats_Wi2026 copy/Lecture_Folder/images/week_02_S14_boolean_set_operations_venn.svg` | `Lecture_Folder/images/week_02_S14_boolean_set_operations_venn.svg` | Lecture 07 |
| `BioE_Stats_Wi2026 copy/Lecture_Folder/images/week_02_S23_grammar_of_graphics_layers.jpeg` | `Lecture_Folder/images/week_02_S23_grammar_of_graphics_layers.jpeg` | Lecture 07 |
| `BioE_Stats_Wi2026 copy/Lecture_Folder/images/week_02_S32_flow_chart_for_choosing_data_v.svg` | `Lecture_Folder/images/week_02_S32_flow_chart_for_choosing_data_v.svg` | Lecture 07 |

Already on disk and reused (no copy needed): `appendix_A_S21/S24/S27_*.svg`, `appendix_B_S38_shell_command_anatomy.svg`, `appendix_B_S43_unix_file_hierarchy.svg`, `RStudio_Screenshot.png`.

Now unreferenced by any deck (left on disk, not deleted): `w1_shell_command.jpeg`, `w1_file_structure.jpeg`, `w1_pipes_3/4/5.jpeg`, `week_01.012/.013/.015/.016/.017/.018/.019.jpeg`.

## 3. Skipped

- **Week1.qmd - statistics content**: "Why Do We Need Statistics?", "A few examples of basic R code" (rnorm/hist/density/binomial demos), "Statistical Test" (ANOVA), tidy-data *statistical* vocabulary table (population/sample/variable) - statistics, not tools.
- **Week1.qmd - course-specific slides** (Week 1 topics, packages-for-this-week, craftsmanship photos S08-S11, cover GIF, class logistics, stickleback experiment, "Statistical thinking in action" logo collage, messy-lab and lab-notebook photos) - Comp Tools decks have their own equivalents (Lecture 00 already covers organization and literate programming; `Messy-Lab.jpg` and `example_screenshot_labnotebook.png` are already on disk).
- **Week1.qmd - Mac Terminal / Terminal-within-RStudio screenshots (S36, S37)** and **RStudio screenshot (S28/S65)** - dated screenshots; Lecture 00 explains terminals in text and Lectures 06/07 already use `RStudio_Screenshot.png`.
- **Week1.qmd - "Relative and Absolute Paths" JPEGs S49-S51** - no SVG redraw exists and the auto-generated names (`statistical_concepts_preview`, `data_analysis_workflow`, `course_roadmap`) make their content unverifiable; replaced by the Appendix B text/code slide instead.
- **Week1.qmd - R basics, help, working directory, data frames, reading/writing, Quarto structure, chunk options, images, equations, Markdown basics, pipes meme/Magritte** - Lecture 07 / 08 / 00 already cover each of these as well or better (bilingual R+Python versions); the Mario/Magritte memes are already on disk as `w1_mario.jpeg` / `w1_magritte.jpeg` and were not in the decks before.
- **Week2.qmd** - only the tidyverse overview figure, vector-type hierarchy, Boolean Venn, grammar-of-graphics figure, geom table and plot-chooser flowchart were pulled; the dplyr/ggplot worked examples on `nycflights13`/`mpg`, EDA, the "good, bad and ugly" visualization critiques and everything from "Parameters and Statistics" onward are statistics/EDA content.
- **Appendix_A** - text is identical to Lectures 01/02 (only the SVGs were new). "Computational Tools for This Course" slide is stats-course navigation.
- **Appendix_B, C, D, F** - Lectures 03-07 and 10 already contain every slide (often extended with Python tabs, `sed`/`awk`, the newer `git switch`, status codes, GPU check, RACS office hours and acknowledgment text). Appendix D's base-R plotting is covered in Lecture 07.
- **Appendix_E** - text already in Lectures 08/09; only the SVGs were pulled. GitHub Student Developer Pack is already on the Software page.
- **SW/Software.qmd** - superseded by the Comp Tools Software page (not edited; see suggestions above).
- **SW/Resources.qmd** - all five cheat sheets already present on the Comp Tools Resources page.
- **SW/Policies.qmd** - the GenAI policy is already carried (nearly verbatim) in `work_site/Policies.qmd`; nothing to add beyond the typo noted above.
- **SW/scripts/clt_animation.py, loess_animation.py** - matplotlib scripts that generate the Central Limit Theorem and LOESS animated GIFs for the stats decks (Weeks 5/8-9). Pure statistics illustrations; not pulled.
