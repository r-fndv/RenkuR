#' Load a Data in Renku a environment
#'
#' This function enables data loading withing Renku instance. It first load the the git lfs files to the
#' current virutal machine and then load the data to session.
#'
#' @param file_name Path to the input file
#' @param e Environment to load the data. Default is global environment.
#' @return A matrix of the infile
#' @export

renku_load <- function(file_name, e = globalenv()){

  print("Pulling data from server")
  (system(paste('git lfs pull --include "', file_name, '"', sep = "")))
  # system(paste('renku storage pull', file_name, sep = " "))

  print("Loading data to environment")
  load(file_name, envir = e)

}

#' Save a Data in a Renku environment
#'
#' This function enables data loading withing Renku instance. It first load the the git lfs files to the
#' current virutal machine and then load the data to session.
#'
#' @param ... the names of the objects to be saved (as symbols or character strings).
#' @param file_name The name of the file where the data will be saved
#' @param e Environment to load the data. Default is global environment.
#' @return A matrix of the infile
#' @export

renku_save <- function(... , file_name, e = globalenv()){

  save(..., file = file_name, envir = e)
  system(paste('git lfs track "', file_name, '"', sep = ""))

}
