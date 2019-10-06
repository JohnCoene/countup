
countup
=======

R implementation of [CountUp.js](https://github.com/inorganik/CountUp.js).

Install
-------

Install from Github with `remotes`:

``` r
# install.packages("remotes")
remotes::install_github("JohnCoene/countup")
```

Examples
--------

In the R console or R markdown.

``` r
library(countup)

countup(25)

opts = list(
  useEasing = TRUE, 
  useGrouping = TRUE, 
  separator = ',', 
  decimal = '.', 
  prefix = 'US$', 
  suffix = ' bejillion' 
)

countup(count = 1729, start = 10, options = opts)
```

In Shiny (since version `0.1.0`), there are methods to programatically interact with the counter.

``` r
library(shiny)
library(countup)

ui <- fluidPage(
  h1(countupOutput("cnt")),
  actionButton("start", "start"),
  actionButton("pause", "pause / resume"),
  numericInput("value", "update to:", min = 1, max = 1000, value = 24)
)

server <- function(input, output, session) {

  output$cnt <- renderCountup({
    countup(1000, duration = 10, start = FALSE)
  })

  observeEvent(input$start, {
    countupProxy("cnt") %>% 
      countup_start()
  })

  observeEvent(input$value, {
    countupProxy("cnt") %>% 
      countup_update(input$value)
  })

  observeEvent(input$pause, {
    countupProxy("cnt") %>% 
      countup_pause_resume()
  })

}

shinyApp(ui, server)
```
