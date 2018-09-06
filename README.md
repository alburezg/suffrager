
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
#> [6] "mary"
```

Palettes
--------

### London Society (from Mary Lowndes Album)

<img src="sources/london_big.png" width="600" />

``` r
# Discrete
suf_palette("london")
```

![](fig/README-unnamed-chunk-5-1.png)

### Example

``` r
library(ggplot2)
data(airquality)

ggplot(airquality, aes(x=Day, y=Month)) +
  geom_tile(aes(fill=Temp)) +
  scale_fill_gradientn(colours = suf_palette("london", 30, type = "continuous")) +
  coord_equal()
```

![](fig/README-unnamed-chunk-6-1.png)

### Never a Step Backward: Oxon Berks Bucks Federation

<img src="sources/oxon.jpg" width="300" />

``` r
# Discrete
suf_palette("oxon")
```

![](fig/README-unnamed-chunk-7-1.png)

### Example

``` r
data(diamonds)

ggplot(diamonds, aes(x=carat, y=price, colour=cut)) +
  geom_point() +
  scale_colour_manual(values = suf_palette("oxon"))
```

![](fig/README-unnamed-chunk-8-1.png)

### Hanwell Women's Institute

<img src="sources/hanwell.jpg" width="300" />

``` r
# Discrete
suf_palette("hanwell")
```

![](fig/README-unnamed-chunk-9-1.png)

### A. Montgomerie B. Eddoe Mary

<img src="sources/mary.jpg" width="300" />

``` r
# Discrete
suf_palette("mary")
```

![](fig/README-unnamed-chunk-10-1.png)

### Manchester & District Federation

<img src="sources/manchester.jpg" width="300" />

``` r
# Discrete
suf_palette("manchester")
```

![](fig/README-unnamed-chunk-11-1.png)

### Classic suffragette flag

<img src="sources/flag.jpg" width="300" />

``` r
# Discrete
suf_palette("flag")
```

![](fig/README-unnamed-chunk-12-1.png)

``` r
# Continuous
suf_palette("flag", n = 6, type = "continuous")
```

![](fig/README-unnamed-chunk-13-1.png)

Acknowledgements
----------------

The package's architecture was taken from [Karthik Ram's wesanderson package](https://github.com/karthik/wesanderson).
