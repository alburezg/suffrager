
'Suffrage': a colour palette for data visualisation in R (beta)
===============================================================

Installation
------------

``` r
# library(devtools)
# install_github("alburezg/suffrage")
```

Usage
-----

``` r
library(suffrage)
```

See all available palettes:

``` r
names(suf_palettes)
#> [1] "flag"       "london"     "hanwell"    "oxon"       "manchester"
```

Palettes
--------

### Never a Step Backward: Oxon Berks Bucks Federation

<img src="oxon.jpg" width="300" />

 

``` r
# Discrete
suf_palette("oxon")
```

![](README-unnamed-chunk-5-1.png)

### London Society (from Mary Lowndes Album)

<img src="london.jpg" width="300" />

 

``` r
# Discrete
suf_palette("london")
```

![](README-unnamed-chunk-6-1.png)

### Hanwell Women's Institute

<img src="hanwell.jpg" width="300" />

 

``` r
# Discrete
suf_palette("hanwell")
```

![](README-unnamed-chunk-7-1.png)

### Classic suffragette flag

<img src="flag.jpg" width="300" />

 

``` r
# Discrete
suf_palette("flag")
```

![](README-unnamed-chunk-8-1.png)

``` r
# Continuous
suf_palette("flag", n = 6, type = "continuous")
```

![](README-unnamed-chunk-9-1.png)

Examples
--------

``` r
library(ggplot2)
data(diamonds)

pal <- suf_palette("oxon")

ggplot(diamonds, aes(x=carat, y=price, colour=cut)) +
  geom_point() +
  scale_colour_manual(values = pal)
```

![](README-unnamed-chunk-10-1.png)
