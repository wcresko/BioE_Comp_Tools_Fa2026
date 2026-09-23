# Quarto post-render hook (see _quarto.yml).
# After a full `quarto render` of the website, also render the nested Book/ project
# into docs/book/ so one command builds everything. Skipped for single-file renders.
if (identical(Sys.getenv("QUARTO_PROJECT_RENDER_ALL"), "1")) {
  message("== Rendering the course book into docs/book ==")
  status <- system2("quarto", c("render", "Book", "--to", "html"))
  if (status != 0) stop("Rendering Book/ failed (exit status ", status, ")")
}
