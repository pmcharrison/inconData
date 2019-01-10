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
#' * \code{pi_chord}
#' Vector of chord pitches, each expressed as MIDI note numbers.
#' Uses the \code{\link[hrep]{pi_chord}} representation from the
#' \code{hrep} package.
#' These chord pitches are hypothetically averaged over the different
#' transpositions observed in the stimulus set;
#' unfortunately, insufficient data are provided in the
#' supplementary materials of \insertCite{Lahdelma2016;textual}{inconData}
#' to estimate these values with certainty.
#' Here, we give the bass note of each chord a value of 67,
#' working from the following passage in
#' \insertCite{Lahdelma2016;textual}{inconData}:
#' "All selected chords were transposed with a randomization across two octaves
#' (+/- 5 semitones around C4 and C5, the possible chord roots being all
#' equally likely to occur within this range)."
#' We therefore selected G4/67 as the common bass/root note,
#' it being the middle of this randomisation range.
#' @note
#' In the original experiment, chords were played at a variety of transpositions.
#' Unfortunately, insufficient information is provided in the supplementary data
#' to recover which responses correspond to which transpositions.
#' Here, therefore, responses are averaged over transpositions,
#' and an estimate is made of an average pitch height to assign to the chord
#' (see \code{pi_chord} column.)
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
