### Short script to demonstrate the function of an R container
### @Date 2021-06-01

## Cleanup the backend in RStudio:
cat("\014") # Clears the console (imitates CTR + L)
rm(list = ls()) # Clears the Global Environment/variables/data
invisible(gc()) # Garbage collector/Clear unused RAM

## Load all functions:
source("./utils.R")

## Load all necessary Variables into the environment:
DIZutils::set_env_vars(env_file = "./.env")

## Variables for this script:
paths <- list("input" = "./data/", "output" = "./out/")
filename_data <- "titanic.csv"
filename_output <- "plot.pdf"


## ------------------
## The script starts here:
## ------------------

## Check paths:
for (path in names(paths)) {
  ## Make sure the path names have a tailing "/":
  paths[path] <- DIZutils::clean_path_name(pathname = paths[path],
                                           remove.slash = FALSE)

  ## Make sure the paths exist and create them if not:
  dir.create(file.path(paths[path]))
}

## Load the dataset:
data <-
  data.table::fread(file = paste0(paths["input"], filename_data))

## Clean the data in an external function loaded above:
data <- clean_titanic_data(data)

## Crate the plot:
plot <-
  ggplot2::ggplot(data, ggplot2::aes(
    x = get("Pclass"),
    y = get("Age"),
    fill = get("Survived")
  )) +
  geom_boxplot() +
  ggplot2::xlab("Class") +
  ggplot2::ylab("Age") +
  ggplot2::labs(fill = "Survived")

## Show the plot:
plot

## Save the plot:
ggplot2::ggsave(filename = paste0(paths$output, filename_output),
                plot = plot)
