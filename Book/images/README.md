# Images Directory

Every figure used by a book chapter lives here and is referenced from the chapter as `../images/<name>`.

## Naming convention

`Chap##_img###.<ext>` for chapter figures and `App#_img###.<ext>` for appendix figures, numbered in order of first appearance within the chapter (e.g. `Chap05_img001.svg` is the first figure in Chapter 5, *Unix Fundamentals*). Chapter numbers follow the rendered book order, which matches the numeric prefix of the chapter file in `chapters/`.

The same convention is used for the lecture decks: `Lecture_Folder/images/Lec##_img###.<ext>`.

## Adding a figure

1. Save it here with the next free number for that chapter (`ls Chap05_*` shows what exists).
2. Reference it with a caption, an id and alt text, e.g.
   `![Caption](../images/Chap05_img007.svg){#fig-something width="80%" fig-alt="..."}`
3. Prefer SVG for diagrams, PNG for screenshots, JPEG for photographs; keep files under ~500 KB where possible.

Unused images are removed at each clean-up pass; everything is recoverable from git history.
