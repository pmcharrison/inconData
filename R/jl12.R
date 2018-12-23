#' Johnson-Laird et al. (2012)
#'
#' These datasets were transcribed from
#' \insertCite{Johnson-Laird2012;textual}{inconData}.
#'
#' Two datasets are provided:
#'
#' * \code{jl12a}: corresponds to Figure 2 of
#' \insertCite{Johnson-Laird2012;textual}{inconData}.
#' * \code{jl12b}: corresponds to Figure 3 of
#' \insertCite{Johnson-Laird2012;textual}{inconData}.
#'
#' Each dataset is represented as a [tibble][tibble::tibble-package]
#' with the following columns:
#'
#' * \code{id}: Unique chord identifer.
#' * \code{perceptual_dissonance}: Mean perceptual dissonance rating.
#' * \code{roughness_model}:
#' These are estimates of roughness made by
#' \insertCite{Johnson-Laird2012;textual}{inconData}
#' using the computational model of
#' \insertCite{Hutchinson1978;textual}{inconData}.
#' There seem to be some mistakes in this data;
#' an alternative is to use the model as implemented in
#' the \code{\link[incon]{incon}} package.
#' * \code{tonal_model}:
#' These are consonance ranks from the tonal consonance model of
#' \insertCite{Johnson-Laird2012;textual}{inconData}.
#' Lower values correspond to greater consonance.
#' Again, there seem to be some mistakes in this data;
#' an alternative is to use the model as implemented in
#' the \code{\link[incon]{incon}} package.
#' * \code{pi_chord}:
#' Vector of chord pitches, expressed as MIDI note numbers.
#' Uses the \code{\link[hrep]{pi_chord}} representation from the
#' \code{hrep} package.
#'
#' @note
#' The table uses representations from the \code{hrep} package.
#' Loading the \code{hrep} package
#' improves the way that chord objects are displayed.
#'
#' @references \insertAllCited
#' @name jl12
#' @rdname jl12
#' @md
#' @docType data
#' @keywords data
NULL

#' @name jl12a
#' @rdname jl12
NULL

#' @name jl12b
#' @rdname jl12
NULL
