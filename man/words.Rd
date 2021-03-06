% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/words.R
\docType{data}
\name{words}
\alias{words}
\title{Words Dataset}
\format{A data frame with 127 observations and 6 variables.}
\usage{
data(words)
}
\description{
Sample set of words taken from the first paragraph of James Joyce's
short story "The Dead" to demonstrate the functionality in this package.
}
\details{
The dataset includes the following variables:
\describe{
\item{\code{word}}{Character, word in the sample.}
\item{\code{first_letter}}{Character, first letter of the word.}
\item{\code{last_letter}}{Character, last letter of the word.}
\item{\code{letter_count}}{Integer, number of letters in the word.}
\item{\code{starts_with}}{Character, identifies whether the word starts with
a vowel or consonant.}
\item{\code{ends_with}}{Character, identifies whether the word ends with a
vowel or consonant.}
}
}
\author{
Donnie Minnick \email{donnie.minnick@gmail.com}
}
\keyword{dataset}
