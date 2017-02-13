[![Travis-CI Build Status](https://travis-ci.org/JohnCoene/countup.svg?branch=master)](https://travis-ci.org/JohnCoene/countup)
[![saythanks](https://img.shields.io/badge/say-thanks-ff69b4.svg)](https://saythanks.io/to/JohnCoene)

countup
=======

![countup](http://johncoene.github.io/projects/img/modals/countuprmd.gif)

R implementation of [CountUp.js](https://github.com/inorganik/CountUp.js).

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

------------------------------------------------------------------------

See [my other projects](http://johncoene.github.io/projects/)
