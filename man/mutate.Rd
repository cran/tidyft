% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mutate.R
\name{mutate}
\alias{mutate}
\alias{transmute}
\alias{mutate_when}
\alias{mutate_vars}
\title{Create or transform variables}
\usage{
mutate(.data, ..., by)

transmute(.data, ..., by)

mutate_when(.data, when, ..., by)

mutate_vars(.data, .cols = NULL, .func, ..., by)
}
\arguments{
\item{.data}{A data.table}

\item{...}{Name-value pairs of expressions}

\item{by}{(Optional) Mutate by what group?}

\item{when}{An object which can be coerced to logical mode}

\item{.cols}{Any types that can be accepted by \code{\link[tidyfst]{select_dt}}.}

\item{.func}{Function to be run within each column, should return a value or
vectors with same length.}
}
\value{
A data.table
}
\description{
\code{mutate()} adds new variables and preserves existing ones;
\code{transmute()} adds new variables and drops existing ones.
 Both functions preserve the number of rows of the input.
  New variables overwrite existing variables of the same name.

\code{mutate_when} integrates \code{mutate} and \code{case_when}
in \pkg{dplyr} and make a new tidy verb for data.table. \code{mutate_vars} is
 a super function to do updates in specific columns according to conditions.

If you mutate a data.table, it is forever changed.
No copies made, which is efficient, but should be used with caution.
If you still want the keep the original data.table, use
 \code{\link[data.table]{copy}} first.
}
\examples{
  # Newly created variables are available immediately
  a = as.data.table(mtcars)
  copy(a) \%>\% mutate(cyl2 = cyl * 2)
  a

  # change forever
  a \%>\% mutate(cyl2 = cyl * 2)
  a

  # You can also use mutate() to remove variables and
  # modify existing variables
  a \%>\% mutate(
    mpg = NULL,
    disp = disp * 0.0163871 # convert to litres
  )

  a \%>\% transmute(cyl,one = 1)
  a


 iris[3:8,] \%>\%
   as.data.table() \%>\%
   mutate_when(Petal.Width == .2,
               one = 1,Sepal.Length=2)

 iris[3:8,] \%>\%
   as.data.table() \%>\%
   mutate_vars("Pe",scale)

}
