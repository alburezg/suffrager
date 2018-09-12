
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
#>  [1] "flag"       "london"     "hanwell"    "oxon"       "manchester"
#>  [6] "mary"       "marion"     "e17"        "equality"   "caroline"  
#> [11] "CarolMan"   "chelsea"    "StGeorge"   "chelsea2"
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

### Oxon Berks Bucks Federation: Never a Step Backward

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

### Caroline & Manchester

<img src="sources/carol_man.png" width="600" />

``` r
# Discrete
suf_palette("CarolMan")
```

![](fig/README-unnamed-chunk-9-1.png)

### Hanwell Women's Institute

<img src="sources/hanwell.jpg" width="300" />

``` r
# Discrete
suf_palette("hanwell")
```

![](fig/README-unnamed-chunk-10-1.png)

### Equality

<img src="sources/equality.png" width="600" />

``` r
# Discrete
suf_palette("equality")
```

![](fig/README-unnamed-chunk-11-1.png)

### Chelsea & St George

<img src="sources/chelsea2.png" width="600" />

``` r
# Discrete
suf_palette("chelsea2")
```

![](fig/README-unnamed-chunk-12-1.png)

### Mary

<img src="sources/mary.jpg" width="300" />

``` r
# Discrete
suf_palette("mary")
```

![](fig/README-unnamed-chunk-13-1.png)

### Classic suffragette flag

<img src="sources/flag.jpg" width="300" />

``` r
# Discrete
suf_palette("flag")
```

![](fig/README-unnamed-chunk-14-1.png)

``` r
# Continuous
suf_palette("flag", n = 6, type = "continuous")
```

![](fig/README-unnamed-chunk-15-1.png)

Acknowledgements
----------------

The package's architecture was taken from [Karthik Ram's wesanderson package](https://github.com/karthik/wesanderson).
