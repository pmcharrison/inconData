#' @keywords internal
"_PACKAGE"

#' Bowling et al. (2018)
#'
#' This dataset comes from the supplementary materials of
#' \insertCite{Bowling2018;textual}{inconData}.
#'
#' * \code{id}: Unique ID for each chord.
#' * \code{name}: Chord name (only present for some chords).
#' * \code{chord_size}: Number of chord tones.
#' * \code{rating_mean}:
#' Mean consonance rating. Ratings were on a four-point scale,
#' where high ratings indicated high consonance.
#' * \code{rating_sd}: Standard deviation of consonance ratings.
#' * \code{rating_se}: Standard error of consonance ratings.
#' * \code{fr_chord}: Vector of chord frequencies.
#' * \code{pi_chord}: Vector of chord pitches, on MIDI note scale.
#' * \code{pi_chord_int}: An integer approximation of \code{pi_chord}.
#' * \code{pc_chord_int}:
#' An integer approximation of the chord's pitch-class set,
#' expressed relative to the chord's bass note.
#' @references \insertAllCited
#' @name bowl18
#' @md
#' @docType data
#' @keywords data
NULL
