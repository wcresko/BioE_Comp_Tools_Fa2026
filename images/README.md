# Images - single source for lectures AND the book

Every figure used by the lecture decks and the book chapters lives in THIS folder.
Edit an image here once and both the lectures and the book pick up the change.

- Lecture decks reference images as `../images/<name>` (they live in `Lecture_Folder/`).
- Book chapters also reference `../images/<name>`, which resolves to `Book/images/` -
  an automatic MIRROR of this folder. `Book/_sync_images.R` (a pre-render hook) refreshes
  it on every render; never edit `Book/images/` by hand, your changes would be overwritten.

## Naming conventions

- `Lec##_img###.<ext>` - figures made for lecture deck ##, numbered in order of first
  appearance in that deck. A figure reused by a later deck (or by a book chapter) keeps
  the name of the deck that introduced it.
- `Chap##_img###.<ext>` - figures made for book chapter ##, numbered in order of first
  appearance in that chapter. Chapter numbers follow the numeric prefix of the chapter
  file in `Book/chapters/`.
- A short descriptive suffix is fine where it helps (e.g. `Chap17_storage_tree.svg`).

## Adding a figure

1. Save it here with the next free number (`ls images/Lec02_*` shows what exists).
2. Reference it as `../images/<name>` from a lecture or chapter, e.g.
   `![Caption](../images/Chap05_img007.svg){#fig-something width="80%" fig-alt="..."}`

The folder `images_superseded/` at the repository root holds the old duplicate copies
that used to live in `Book/images/`; it is safe to delete.
