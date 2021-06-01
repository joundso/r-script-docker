## Additional functions needed for the script

#' @title Format Survived and Classes as factors in the titanic dataset
#' @description Format Survived and Classes as factors in the titanic dataset
#' @param dt (data.table) The data of the titanic dataset.
#'
#' @return (dt) The cleaned result dataset as data.table.
#'
clean_titanic_data <- function(dt){
  ## Make the class of the passengers factors:
  dt[, "Pclass" := as.factor(x = get("Pclass"))]

  ## Make the class of the passengers factors:
  dt[, "Survived_new" := ifelse(get("Survived") == 0, "Deceased", "Survived")]
  dt[, "Survived" := get("Survived_new")]
  dt[, "Survived_new" := NULL]
  dt[, "Survived" := as.factor(x = get("Survived"))]

  return(dt)
}
