[![Travis-CI Build Status](https://travis-ci.org/JohnCoene/countup.svg?branch=master)](https://travis-ci.org/JohnCoene/countup)
[![saythanks](https://img.shields.io/badge/say-thanks-ff69b4.svg)](https://saythanks.io/to/JohnCoene)

countup
========

R implementation of [CountUp.js](https://github.com/inorganik/CountUp.js).

See [site](http://john-coene.com/countup) for all details.

Install
-------

``` r
devtools::install_github("JohnCoene/countup")
```

Examples
--------

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

Waypoints
---------

The htmlwidget uses standalone waypoints.js to trigger the counter, see `offset` argument.
