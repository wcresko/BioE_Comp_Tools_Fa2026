# Quarto post-render hook (see _quarto.yml).
# After a full `quarto render` of the website, also render the nested Book/
# project and copy it into docs/book/ so one command builds everything.
# The book renders into Book/_book (inside its own project, which keeps Quarto
# happy) and is then copied; docs/book is what GitHub Pages serves.
# Skipped for single-file renders.
if (identical(Sys.getenv("QUARTO_PROJECT_RENDER_ALL"), "1")) {
  message("== Rendering the course book ==")
  status <- system2("quarto", c("render", "Book", "--to", "html"))
  if (status != 0) stop("Rendering Book/ failed (exit status ", status, ")")
  message("== Copying Book/_book -> docs/book ==")
  unlink("docs/book", recursive = TRUE)
  dir.create("docs/book", recursive = TRUE, showWarnings = FALSE)
  ok <- file.copy(list.files("Book/_book", full.names = TRUE), "docs/book", recursive = TRUE)
  if (!all(ok)) stop("Copying the rendered book into docs/book failed")
}
