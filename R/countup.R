#' countup
#'
#' Count up widget
#'
#' @param count Numeric or integer to count up to (required).
#' @param start Whether to start the counter.
#' @param ... Any additional options.
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param elementId Specify element id of \code{<span>} (optional).
#'
#' @examples
#' \dontrun{
#' countup(25)
#' }
#' 
#' @return An object of class `countup`
#'
#' @import htmlwidgets
#'
#' @export
countup <- function(
  count = 1000,
  ...,
  start = TRUE,
  width = NULL,
  height = NULL,
  elementId = NULL
) {

  if(missing(count)) stop("must pass count")

  # forward options using x
  x <- list(
    count = count,
    start = start,
    options = list(...)
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
#' @param id Id of \code{countup} object to create a proxy.
#' @param session A valid shiny session.
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

#' @rdname countup-shiny
#' @export
countupProxy <- function(id, session = shiny::getDefaultReactiveDomain()){
  
  proxy <- list(id = id, session = session)
  class(proxy) <- "countupProxy"
  
  return(proxy)
}
