
# countup

R implementation of
[CountUp.js](https://github.com/inorganik/CountUp.js).

## Install

``` r
devtools::install_github("JohnCoene/countup")
```

## Examples

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
