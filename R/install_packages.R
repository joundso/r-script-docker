## Packages needed to run the script:
packages <- "
DIZutils
data.table
ggplot2
# this_one_will_be_ignored
"

## Make a vector out of the `packages` string:
packages <- strsplit(packages, split = "\n")[[1]]

## Remove "uncommented" lines (the ones starting with a '#'):
packages <- packages[!grepl(pattern = "^(#)", x = packages)]

## Remove empty elements:
packages <- packages[nchar(packages) > 0]

## And install all of them:
install.packages("remotes")
for (package in packages) {
  cat(paste0(
    "\n\n## Starting to install '",
    package,
    "' with all dependencies:\n"
  ))
  remotes::update_packages(
    packages = package,
    build_manual = FALSE,
    quiet = TRUE,
    upgrade = "always"
  )
}
