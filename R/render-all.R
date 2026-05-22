rmds <- fs::dir_ls(glob = "*.Rmd", recurse = TRUE)
purrr::walk(
  rmds,
  \(x) rmarkdown::render(x)
)
