#' Odometer
#'
#' Create an odometer.
#' 
#' @param count Value to count up to.
#' @param duration Duration of countup.
#' @param format Change how digit groups are formatted, and 
#' how many digits are shown after the decimal point.
#' @param theme An odometer theme, see \url{https://github.hubspot.com/odometer/api/themes/}
#' @param width,height Dimensions.
#' @param elementId Id of element holding the odometer.
#'
#' @import htmlwidgets
#'
#' @export
odometer <- function(count, duration = 2500, format = "(,ddd).dd",
  theme = c("default", "car", "digital", "minimal", "plaza", "slot-machine", "train-station"),
  width = NULL, height = NULL, elementId = NULL) {

  theme <- match.arg(theme)

  # forward options using x
  x = list(
    value = count,
    opts = list(
      duration = duration,
      theme = theme,
      format = format
    )
  )

  # create dependency
  path <- system.file("htmlwidgets/lib/odometer/themes", package = "countup")
  dep <- htmltools::htmlDependency(
    name = "odometer-themes",
    version = "0.4.8",
    src = c(file = path),
    stylesheet = paste0("odometer-theme-", theme, ".css")
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'odometer',
    x,
    width = width,
    height = height,
    package = 'countup',
    elementId = elementId,
    dependencies = list(dep),
    sizingPolicy = htmlwidgets::sizingPolicy(
      defaultWidth = "auto",
      defaultHeight = "auto",
      padding = 0
    )
  )
}

odometer_html <- function(..., height, width, style){
  htmltools::tags$span(...)
}

#' Shiny bindings for odometer
#'
#' Output and render functions for using odometer within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a odometer
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name odometer-shiny
#'
#' @export
odometerOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'odometer', width, height, package = 'countup')
}

#' @rdname odometer-shiny
#' @export
renderOdometer <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, odometerOutput, env, quoted = TRUE)
}
