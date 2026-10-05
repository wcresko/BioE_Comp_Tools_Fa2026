#!/usr/bin/env bash
#
# make_project.sh - build the standard course project structure in one command
#
# Creates the directory layout we recommended in Lecture 01, plus starter
# template files (README.md, numbered .R / .py scripts, and a .qmd report)
# so every new analysis project starts organized:
#
#   my_project/
#   |-- README.md
#   |-- data/
#   |   |-- raw/          <- original data: never modify these!
#   |   `-- processed/    <- cleaned / intermediate data
#   |-- scripts/          <- 01_explore.R, 02_analyze.py, ... (.R .py .sh .qmd)
#   |-- output/
#   |   |-- figures/      <- plots made by your scripts
#   |   `-- tables/       <- result tables
#   `-- docs/
#       `-- 03_report.qmd <- notes, manuscripts, reports
#
# Usage:
#   ./make_project.sh my_project
#
# Works on macOS and Linux.

# ----- 1. Check the arguments ------------------------------------------------
# ${1:?...} stops the script with this message if no argument was given
PROJECT="${1:?Usage: ./make_project.sh project_name}"

if [ -e "$PROJECT" ]; then
    echo "Error: '$PROJECT' already exists - refusing to overwrite it" >&2
    exit 1
fi

# ----- 2. Create the directory tree ------------------------------------------
# Brace expansion builds all the nested folders in one mkdir call;
# -p creates parents as needed.
mkdir -p "$PROJECT"/{data/{raw,processed},scripts,output/{figures,tables},docs}

# ----- 3. Write the template files -------------------------------------------
# Each 'cat > file << EOF' block (a "here-document") writes everything up
# to the closing EOF into the file. Quoting the first 'EOF' stops the shell
# from expanding $variables inside the templates - except in README.md,
# where we DO want the project name and today's date filled in.

TODAY=$(date '+%Y-%m-%d')

cat > "$PROJECT/README.md" << EOF
# $PROJECT

Created: $TODAY

## What this project is

(One or two sentences: the question this analysis answers, and for whom.)

## Data

(Where the raw data came from, when, and who collected it.
Files in data/raw/ are originals - never edit them by hand.)

## How to reproduce

Run the scripts in numbered order:

1. scripts/01_explore.R   - first look at the raw data
2. scripts/02_analyze.py  - main analysis; writes to output/
3. docs/03_report.qmd     - renders the final report

## Folder layout

- data/raw/        original data (read-only)
- data/processed/  cleaned / intermediate data made by scripts
- scripts/         all code, numbered in run order
- output/          figures and tables (expendable - regenerate any time)
- docs/            notes, manuscripts, reports
EOF

cat > "$PROJECT/scripts/01_explore.R" << 'EOF'
# 01_explore.R - first look at the raw data
# Author:
# Date:
#
# Reads from data/raw/, writes nothing. Run from the project root:
#   Rscript scripts/01_explore.R

library(readr)

# raw <- read_csv("data/raw/my_data.csv")   # <- edit to your file name
# str(raw)
# summary(raw)
EOF

cat > "$PROJECT/scripts/02_analyze.py" << 'EOF'
# 02_analyze.py - main analysis
# Author:
# Date:
#
# Reads from data/raw/ (or data/processed/), writes results to output/.
# Run from the project root:
#   python scripts/02_analyze.py

import pandas as pd

# df = pd.read_csv("data/raw/my_data.csv")   # <- edit to your file name
# ...analysis...
# df_summary.to_csv("output/tables/summary.csv", index=False)
EOF

cat > "$PROJECT/docs/03_report.qmd" << 'EOF'
---
title: "Report title"
author: "Your name"
date: today
format: html
---

## Objective

(What question does this report answer?)

## Methods

(Point to the scripts in scripts/ - the report should only present
results, the scripts should do the work.)

## Results

(Insert figures from output/figures/ and tables from output/tables/.)
EOF

# ----- 4. Show what was made --------------------------------------------------
echo "Project '$PROJECT' created:"
find "$PROJECT" | sort
