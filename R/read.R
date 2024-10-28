#' Reads in parameter library from JSON
#'
#' @description
#' Read epidemiological parameter database from JSON using
#' [jsonlite::read_json()] and returns the list with a `<epiparameterDB>`
#' class attribute to validate it has been read using this function.
#'
#' @return `list`.
#' @keywords internal
.read_db <- function() {

  if (!.is_pkg_installed("jsonlite")) {
    stop(
      "Cannot use this internal function without {jsonlite} installed",
      call. = FALSE
    )
  }

  params_json <- jsonlite::read_json(
    path = system.file(
      "extdata",
      "parameters.json",
      package = "epiparameter",
      mustWork = TRUE
    )
  )

  # tag with <epiparameterDB> class
  class(params_json) <- "epiparameterDB"

  return(params_json)
}

#' Check whether a package is installed
#'
#' @details This functions allows testing for when a suggested package
#' dependency is not installed to check if conditional code can be run.
#'
#' @inheritParams base::requireNamespace
#'
#' @return Invisibly returns a boolean `logical`.
#' @keywords internal
.is_pkg_installed <- function(package) {
  requireNamespace(package, quietly = TRUE)
}
