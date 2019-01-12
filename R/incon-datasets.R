#' Instantaneous consonance datasets
#'
#' This \code{\link[tibble]{tibble}} summarises the
#' consonance perception datasets available in the \code{inconData} package.
#' * \code{label}: Label for the dataset.
#' * \code{description}: Description of the dataset.
#' @docType data
#' @keywords data
#' @md
#' @export
incon_datasets <- function() {
  tibble::tribble(
    ~ label, ~ description,
    "bowl18", "Bowling et al. (2012)",
    "jl12a", "Johnson-Laird et al. (2012, Experiment 1)",
    "jl12b", "Johnson-Laird et al. (2012, Experiment 2)",
    "lah16", "Lahdelma & Eerola (2016)",
    "sch03", "Schwartz et al. (2003)"
  )
}
