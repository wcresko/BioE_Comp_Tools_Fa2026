# _sync_images.R - pre-render hook (see Book/_quarto.yml)
# The single source of truth for ALL images (lectures and book) is the
# repository-level  images/  folder. Edit images there, once.
# This script mirrors it into Book/images/ before every book render,
# because Quarto cannot reference resources outside the book project.
# Anything placed manually in Book/images/ will be deleted by the mirror.

src <- "../images"
dst <- "images"
unlink(dst, recursive = TRUE)
dir.create(dst, showWarnings = FALSE)
invisible(file.copy(list.files(src, full.names = TRUE), dst, overwrite = TRUE))
cat("Synced", length(list.files(dst)), "images from ../images\n")
