% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/lah16.R
\docType{data}
\name{lah16}
\alias{lah16}
\title{Lahdelma & Eerola (2016)}
\description{
This dataset is reproduced from the supplementary materials of
\insertCite{Lahdelma2016;textual}{inconData}.
}
\details{
The dataset is represented as a \link[tibble:tibble-package]{tibble}
with the following columns:
\itemize{
\item \code{label}: Chord label.
\item \code{num_ratings}: Number of times that the chord was rated.
\item \code{rating}: Mean consonance rating.
Higher values indicate higher consonance.
\item \code{rating_sd}: Standard deviation of consonance ratings.
\item \code{rating_se}: Standard error of the
mean consonance rating, computed under the central limit theorem.
\item \code{pi_chord_type}
Vector of chord pitches, each expressed relative to the bass pitch.
Uses the \code{\link[hrep]{pi_chord_type}} representation from the
\code{hrep} package.
\item \code{pi_chord}
Vector of chord pitches, each expressed as MIDI note numbers.
Uses the \code{\link[hrep]{pi_chord}} representation from the
\code{hrep} package.
These chord pitches are hypothetically averaged over the different
transpositions observed in the stimulus set;
unfortunately, insufficient data are provided in the
supplementary materials of \insertCite{Lahdelma2016;textual}{inconData}
to estimate these values with certainty.
Here, we give the bass note of each chord a value of 67,
working from the following passage in
\insertCite{Lahdelma2016;textual}{inconData}:
"All selected chords were transposed with a randomization across two octaves
(+/- 5 semitones around C4 and C5, the possible chord roots being all
equally likely to occur within this range)."
We therefore selected G4/67 as the common bass/root note,
it being the middle of this randomisation range.
}
}
\note{
In the original experiment, chords were played at a variety of transpositions.
Unfortunately, insufficient information is provided in the supplementary data
to recover which responses correspond to which transpositions.
Here, therefore, responses are averaged over transpositions,
and an estimate is made of an average pitch height to assign to the chord
(see \code{pi_chord} column.)

The table uses representations from the \code{hrep} package.
Loading the \code{hrep} package
improves the way that chord objects are displayed.
}
\references{
\insertAllCited
}
\keyword{data}
