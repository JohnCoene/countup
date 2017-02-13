#' countup
#'
#' Count up widget
#'
#' @param count numeric or integer to count up to (required).
#' @param start integer to start from defaults to \code{0}.
#' @param options list of options (see details and examples).
#' @param duration duration of the count defaults to \code{2.5}.
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param elementId Specify element id of \code{<div>} (optional).
#'
#' @details Valid options include:
#' \itemize{
#' \item{useEasing}{takes \code{TRUE} or \code{FALSE}}
#' \item{useGrouping}{takes \code{TRUE} or \code{FALSE}}
#' \item{separator}{takes a string, i.e.: ","}
#' \item{decimal}{takes a string, i.e.: "."}
#' \item{prefix}{takes a string, i.e.: "$"}
#' \item{suffix}{takes a string, i.e.: "thousands"}
#' }
#'
#' @examples
#' \dontrun{
#' countup(25)
#'
#' opts <- list(useEasing = TRUE,
#'              useGrouping = TRUE,
#'              separator = "'",
#'              prefix = "US$",
#'              suffix = " million")
#'
#' countup(1234, start = 200, options = opts)
#' }
#'
#' @import htmlwidgets
#'
#' @export
countup <- function(count, start = 0, options = NULL, duration = 2.5, 
                    width = NULL, height = NULL, elementId = NULL) {

  if(missing(count)) stop("must pass count")

  # forward options using x
  x = list(
    count = count,
    start = start,
    options = options,
    duration = duration
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'countup',
    x,
    width = width,
    height = height,
    package = 'countup',
    elementId = elementId
  )
}

countup_html <- function(id, style, class, ...){
  htmltools::tags$span(id = id, class = class)
}

#' Shiny bindings for countup
#'
#' Output and render functions for using countup within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a countup
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name countup-shiny
#'
#' @export
countupOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'countup', width, height, package = 'countup')
}

#' @rdname countup-shiny
#' @export
renderCountup <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, countupOutput, env, quoted = TRUE)
}
