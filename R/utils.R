#' Format author names for short citation from epidemiological parameter
#' database
#'
#' @param x A single `list` entry from the list of epidemiological parameter
#' database.
#'
#' @return A `character` string with the short citation.
#' @keywords internal
.cite_author <- function(x) {
  aut <- x$citation$author
  num_author <- length(aut)
  # check if first author is an organisation
  is_org_author <- is.null(aut[[1]]$family)
  # this covers single author entries
  if (is_org_author) {
    # organisation name stored in $given
    cit <- aut[[1]]$given
  } else {
    cit <- aut[[1]]$family
  }
  # append second author or et al for multi-author entries
  if (num_author == 2) {
    cit <- paste(cit, "&", aut[[2]]$family)
  } else if (num_author > 2) {
    cit <- paste(cit, "et al.")
  }
  return(cit)
}
