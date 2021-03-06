% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sch03.R
\docType{data}
\name{sch03}
\alias{sch03}
\title{Schwartz et al. (2018)}
\description{
This dataset was transcribed from Figure 6 of
\insertCite{Schwartz2003;textual}{inconData}.
The authors
compiled this data from seven psychophysical studies of dyadic consonance
in the late 19th / early 20th centuries.
}
\details{
The dataset is represented as a \link[tibble:tibble-package]{tibble}
with the following columns:
\itemize{
\item \code{name}: Chord name.
\item \code{chord_size}: Number of chord tones.
\item \code{pi_chord_type}:
Vector of chord pitches, each expressed relative to the bass pitch.
Uses the \code{\link[hrep]{pi_chord_type}} representation from the
\code{hrep} package.
\item \code{rating}:
Ordinal consonance ranking with respect to the other intervals in the dataset.
Lower values indicate greater consonance.
}
}
\note{
The table uses representations from the \code{hrep} package.
Loading the \code{hrep} package
improves the way that chord objects are displayed.
}
\references{
\insertAllCited
}
\keyword{data}
