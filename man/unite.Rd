% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/unite.R
\name{unite}
\alias{unite}
\title{Unite multiple columns into one by pasting strings together}
\usage{
unite(.data, united_colname, ..., sep = "_", remove = FALSE, na2char = FALSE)
}
\arguments{
\item{.data}{A data frame.}

\item{united_colname}{The name of the new column, string only.}

\item{...}{A selection of columns. If want to select all columns,
pass "" to the parameter. See example.}

\item{sep}{Separator to use between values.}

\item{remove}{If \code{TRUE}, remove input columns from output data frame.}

\item{na2char}{If \code{FALSE}, missing values would be merged into \code{NA},
otherwise \code{NA} is treated as character "NA". This is different from
\pkg{tidyr}.}
}
\value{
A data.table
}
\description{
Convenience function to paste together multiple columns into one.
Analogous to \code{tidyr::unite}.
}
\examples{
df <- CJ(x = c("a", NA), y = c("b", NA))
df

# Treat missing value as NA, default
df \%>\% unite("z", x:y, remove = FALSE)
# Treat missing value as character "NA"
df \%>\% unite("z", x:y, na2char = TRUE, remove = FALSE)
# the unite has memory, "z" would not be removed in new operations
# here we remove the original columns ("x" and "y")
df \%>\% unite("xy", x:y,remove = TRUE)

# Select all columns
iris \%>\% as.data.table \%>\% unite("merged_name",".")
}
\seealso{
\code{\link[tidyr]{unite}},\code{\link[tidyft]{separate}}
}
