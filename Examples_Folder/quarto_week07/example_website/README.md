# Example academic website (Quarto)

A minimal personal site for a biology / bioengineering graduate
student, built as a Quarto **website project**: four pages
(`index.qmd`, `research.qmd`, `publications.qmd`, `cv.qmd`), one
shared configuration (`_quarto.yml`), and a stylesheet.

## Try it now (Week 7)

From a terminal *inside this folder*:

```bash
quarto preview    # opens a live local preview; edits re-render on save
quarto render     # writes the finished site into docs/
```

Or open any page in Positron and use the Preview button. Then make it
yours: your name in `_quarto.yml` and `index.qmd`, your photo in
`images/`, your projects on the research page.

## Publish it (Week 10)

The site is pre-configured for GitHub Pages (`output-dir: docs`). In
Week 10 we will:

1. make this folder a Git repository and push it to GitHub;
2. in the repository settings, turn on **Pages**, serving from the
   `docs/` folder on `main`.

After that, `quarto render` + commit + push updates your live site.
Course book chapter 21 covers the details (including the alternative
`quarto publish gh-pages` route).
