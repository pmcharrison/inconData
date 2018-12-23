#' Lahdelma & Eerola (2016)
#'
#' This dataset is reproduced from the supplementary materials of
#' \insertCite{Lahdelma2016;textual}{inconData}.
#'
#' The dataset is represented as a [tibble][tibble::tibble-package]
#' with the following columns:
#'
#' * \code{label}: Chord label.
#' * \code{num_ratings}: Number of times that the chord was rated.
#' * \code{rating}: Mean consonance rating.
#' Higher values indicate higher consonance.
#' * \code{rating_sd}: Standard deviation of consonance ratings.
#' * \code{rating_se}: Standard error of the
#' mean consonance rating, computed under the central limit theorem.
#' * \code{pi_chord_type}
#' Vector of chord pitches, each expressed relative to the bass pitch.
#' Uses the \code{\link[hrep]{pi_chord_type}} representation from the
#' \code{hrep} package.
#'
#' @note
#' It seems that the original authors did not store transposition information
#' along with this dataset.
#'
#' @note
#' The table uses representations from the \code{hrep} package.
#' Loading the \code{hrep} package
#' improves the way that chord objects are displayed.
#'
#' @references \insertAllCited
#' @name lah16
#' @md
#' @docType data
#' @keywords data
NULL
