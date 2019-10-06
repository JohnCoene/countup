#' Start
#' 
#' Start the counter.
#' 
#' @param counter An object of class \code{countupProxy} as returned by \code{\link{countupProxy}}.
#' 
#' @examples 
#' library(shiny)
#' 
#' ui <- fluidPage(
#'   countupOutput("cnt"),
#'   actionButton("start", "start")
#' )
#' 
#' server <- function(input, output, session) {
#' 
#'   output$cnt <- renderCountup({
#'     countup(24, start = FALSE)
#'   })
#' 
#'   observeEvent(input$start, {
#'     countupProxy("cnt") %>% 
#'       countup_start()
#'   })
#' 
#' }
#' 
#' \dontrun{shinyApp(ui, server)}
#' 
#' @export
countup_start <- function(counter) UseMethod("countup_start")

#' @export 
#' @method countup_start countupProxy
countup_start.countupProxy <- function(counter){
  counter$session$sendCustomMessage("counter_start", list(id = counter$id))
}

#' Update
#' 
#' Update the counter.
#' 
#' @inheritParams countup_start
#' @param update Integer to update to.
#' 
#' @examples 
#' library(shiny)
#' 
#' ui <- fluidPage(
#'   countupOutput("cnt"),
#'   actionButton("Update", "start")
#' )
#' 
#' server <- function(input, output, session) {
#' 
#'   output$cnt <- renderCountup({
#'     countup(24)
#'   })
#' 
#'   observeEvent(input$start, {
#'     countupProxy("cnt") %>% 
#'       countup_update(50)
#'   })
#' 
#' }
#' 
#' \dontrun{shinyApp(ui, server)}
#' 
#' @export
countup_update <- function(counter, update) UseMethod("countup_update")

#' @export 
#' @method countup_start countupProxy
countup_update.countupProxy <- function(counter, update){
  counter$session$sendCustomMessage("counter_update", list(id = counter$id, update = update))
}

#' Pause Resume
#' 
#' Pause or resume the counter.
#' 
#' @inheritParams countup_start
#' 
#' @examples 
#' library(shiny)
#' 
#' ui <- fluidPage(
#'   countupOutput("cnt"),
#'   actionButton("pause/resume", "pause")
#' )
#' 
#' server <- function(input, output, session) {
#' 
#'   output$cnt <- renderCountup({
#'     countup(1000, duration = 10)
#'   })
#' 
#'   observeEvent(input$pause, {
#'     countupProxy("cnt") %>% 
#'       countup_pause_resume()
#'   })
#' 
#' }
#' 
#' \dontrun{shinyApp(ui, server)}
#' 
#' @export
countup_pause_resume <- function(counter) UseMethod("countup_pause_resume")

#' @export 
#' @method countup_pause_resume countupProxy
countup_pause_resume.countupProxy <- function(counter){
  counter$session$sendCustomMessage("counter_pause_resume", list(id = counter$id))
}
