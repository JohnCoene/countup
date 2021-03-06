% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/countup.R
\name{countup}
\alias{countup}
\title{countup}
\usage{
countup(
  count,
  start_at = 0,
  options = NULL,
  duration = 2.5,
  start = TRUE,
  width = NULL,
  height = NULL,
  elementId = NULL
)
}
\arguments{
\item{count}{Numeric or integer to count up to (required).}

\item{start_at}{Integer to start from defaults to \code{0}.}

\item{options}{List of options (see details and examples).}

\item{duration}{duration of the count defaults to \code{2.5}.}

\item{start}{Whether to start the counter.}

\item{width, height}{Must be a valid CSS unit (like \code{'100\%'},
\code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
string and have \code{'px'} appended.}

\item{elementId}{Specify element id of \code{<span>} (optional).}
}
\value{
An object of class \code{countup}
}
\description{
Count up widget
}
\details{
Valid options include:
\itemize{
\item{useEasing }{takes \code{TRUE} or \code{FALSE}}
\item{useGrouping }{takes \code{TRUE} or \code{FALSE}}
\item{separator }{takes a string, i.e.: ","}
\item{decimal }{takes a string, i.e.: "."}
\item{prefix }{takes a string, i.e.: "$"}
\item{suffix }{takes a string, i.e.: "thousands"}
}
}
\examples{
\dontrun{
countup(25)

opts <- list(useEasing = TRUE,
             useGrouping = TRUE,
             separator = "'",
             prefix = "US$",
             suffix = " million")

countup(1234, start = 200, options = opts)
}

}
