
'suffrager': a feminist colour palette for R
============================================

Installation
------------

``` r
library(devtools)
install_github("alburezg/suffrager")
```

Usage
-----

``` r
library(suffrager)
```

See all available palettes:

``` r
names(suf_palettes)
#> [1] "london"   "oxon"     "CarolMan" "hanwell"  "chelsea"  "classic"
```

Palettes
--------

### 1. London Society (from Mary Lowndes Album)

<img src="sources/pal1.jpg" width="600" />

 

``` r
# Discrete
suf_palette("london")
```

![](fig/README-unnamed-chunk-5-1.png)

### Example

``` r
library(ggplot2)
#> Warning: package 'ggplot2' was built under R version 3.5.2

data(airquality)

ggplot(airquality, aes(x=Day, y=Month)) +
  geom_tile(aes(fill=Temp)) +
  scale_fill_gradientn(colours = rev(suf_palette("london", 30, type = "continuous"))) +
  coord_equal()
```

![](fig/README-unnamed-chunk-6-1.png)

### 2. Oxon Berks Bucks Federation: Never a Step Backward

<img src="sources/pal2.jpg" width="600" />  

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

### 3. Caroline & Manchester

<img src="sources/pal3.jpg" width="600" />

 

``` r
# Discrete
suf_palette("CarolMan")
```

![](fig/README-unnamed-chunk-9-1.png)

### Example

``` r
data(iris)

ggplot(iris,aes(x = Petal.Length, fill = Species)) + 
  geom_density() +
  scale_color_manual(values = suf_palette("CarolMan"))
```

![](fig/README-unnamed-chunk-10-1.png)

### 4. Hanwell Women's Institute

<img src="sources/pal4.jpg" width="600" />  

``` r
# Discrete
suf_palette("hanwell")
```

![](fig/README-unnamed-chunk-11-1.png)

### Example

``` r
data(diamonds)

ggplot(diamonds, aes(x = carat, fill = cut)) + 
  geom_histogram(bins = 20) +
    scale_fill_manual(values = rev(suf_palette("hanwell")))
```

![](fig/README-unnamed-chunk-12-1.png)

### 5. Chelsea & St George

<img src="sources/pal5.jpg" width="600" />

``` r
# Discrete
suf_palette("chelsea")
```

![](fig/README-unnamed-chunk-13-1.png)

### Example

``` r
data("airquality")

ggplot(airquality, aes(x = factor(Month), y = Ozone, fill = factor(Month))) + 
  geom_violin() +
  scale_fill_manual(values = suf_palette("chelsea"))
#> Warning: Removed 37 rows containing non-finite values (stat_ydensity).
```

![](fig/README-unnamed-chunk-14-1.png)

### 6. Classic suffragette

<img src="sources/pal6.jpg" width="600" />

``` r
# Discrete
suf_palette("classic")
```

![](fig/README-unnamed-chunk-15-1.png)

### Example

``` r
data(iris)

ggplot(iris,aes(x = Petal.Length, y = Petal.Width, color = Species)) + 
  geom_point() +
  geom_smooth(method = 'loess') +
  facet_grid(. ~ Species, scales = 'free') +
  scale_color_manual(values = suf_palette("classic", n = 3, type = "continuous"))
```

![](fig/README-unnamed-chunk-16-1.png)

Create a continuous palette of length `n` based on the suffragette colours:

``` r
# Continuous
suf_palette("classic", n = 6, type = "continuous")
```

![](fig/README-unnamed-chunk-17-1.png)

Acknowledgements
----------------

Developed by [Diego Alburez-Gutierrez](http://www.alburez.me) and [Valentina Iemmi](http://personal.lse.ac.uk/iemmi/). The package's architecture and documentation was taken from Karthik Ram's [wesanderson package](https://github.com/karthik/wesanderson). Images for the `london`, `oxon`, `CarolMan`, `chelsea`, and `classic` palettes used with kind permission from the [LSE Womens Library Collection](http://www.lse.ac.uk/library/collections/collection-highlights/womens-suffrage). Images for palette `hanwell` were provided by the [100 Banners project](http://www.digitaldrama.org/100-banners-images/) and are used with the project's consent. The [banners](https://collections.museumoflondon.org.uk/online/object/91873.html) for the `chelsea` pallete come from the collections of the Museum of London, as well as the [rosette](https://collections.museumoflondon.org.uk/online/object/87712.html) used for the `classic` palette.

Want to help? Create a pull request or share the word: @[d\_alburez](https://twitter.com/d_alburez) @[ValentinaIemmi](https://twitter.com/ValentinaIemmi)!
