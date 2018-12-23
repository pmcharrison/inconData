#' Schwartz et al. (2018)
#'
#' This dataset was transcribed from Figure 6 of
#' \insertCite{Schwartz2003;textual}{inconData}.
#' The authors
#' compiled this data from seven psychophysical studies of dyadic consonance
#' in the late 19th / early 20th centuries.
#'
#' The dataset is represented as a [tibble][tibble::tibble-package]
#' with the following columns:
#'
#' * \code{name}: Chord name.
#' * \code{chord_size}: Number of chord tones.
#' * \code{pi_chord_type}:
#' Vector of chord pitches, each expressed relative to the bass pitch.
#' Uses the \code{\link[hrep]{pi_chord_type}} representation from the
#' \code{hrep} package.
#' * \code{consonance_rank}:
#' Ordinal consonance ranking with respect to the other intervals in the dataset.
#' Lower values indicate greater consonance.
#'
#' @note
#' The table uses representations from the \code{hrep} package.
#' Loading the \code{hrep} package
#' improves the way that chord objects are displayed.
#'
#' @references \insertAllCited
#' @name schwartz2003
#' @md
#' @docType data
#' @keywords data
NULL
