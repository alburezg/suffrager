#' Complete list of palettes
#'
#' Use \code{\link{suf_palette}} to construct palettes of desired length.
#'
#' @export
suf_palettes <- list(
  london = c("#122359", "#8F2F3A","#D4332B", "#F88508", "#FECA52") #update
  , oxon = c("#4D3161", "#E46E30","#A82A36", "#0D4278", "#A2D2D4")
  , CarolMan = c("#7C4E1A", "#FF2C00", "#EDD422", "#3A8121", "#4391C2", "#032D67", "#090C2F") #update
  , hanwell = c("#200E6A", "#B01824", "#90468C",  "#326529", "#82D0F0",  "#D7BB55")
  , chelsea = c("#454F63", "#998084", "#9B574E", "#DFA3A2", "#997948", "#6A6A46") #update
  , classic = c("#990099", "#009900")

  # Old palettes
  # , oxon = c("#C10528", "#E46E30", "#BC8B49", "#A2D2D4", "#0D4278", "#4D3161")
  # , CarolMan = c("#7C4E1A", "#FF2C00", "#EDD422", "#3A8121", "#4391C2", "#032D67", "#090C2F")
  # , hanwell = c("#990099", "#009900", "#B01824", "#F52D9C", "#0099C1", "#82D0F0")
  # , equality = c("#455F3F", "#D7BB55", "#2A1440", "#483B7D", "#4C3CBA")
  , mary = c("#24392A", "#463360", "#882635", "#B98B3D", "#D98084", "#93A4B8")
  # , manchester = c("#7C4E1A", "#FF2C00", "#EDD422", "#3A8121", "#4391C2", "#032D67", "#090C2F")
  # , marion = c("#4D7F4C", "#C7A539", "#2A1440", "#4C3CBA")
  # , e17 = c("#85A6D5", "#483B7D", "#D7BB55", "#455F3F")
  # , caroline = c("#D51719", "#C7921F", "#1F2706", "#1674A6")
  # , chelsea = c("#454F63", "#998084", "#9B574E", "#DFA3A2", "#6A6A46")
  # , StGeorge = c("#EBDAC8", "#C0A26D", "#997948", "#65765C", "#476371")

)

#' A Wes Anderson palette generator
#'
#' These are a handful of color palettes from Wes Anderson movies.
#'
#' @param n Number of colors desired. Unfortunately most palettes now only
#'   have 4 or 5 colors. But hopefully we'll add more palettes soon. All color
#'   schemes are derived from the most excellent Tumblr blog:
#'   \href{http://wesandersonpalettes.tumblr.com/}{Wes Anderson Palettes}.
#'   If omitted, uses all colours.
#' @param name Name of desired palette. Choices are:
#'   \code{BottleRocket1}, \code{BottleRocket2},  \code{Rushmore1},
#'   \code{Royal1}, \code{Royal2},  \code{Zissou1}, \code{Darjeeling1},
#'   \code{Darjeeling2},  \code{Chevalier1} , \code{FantasticFox1} ,
#'   \code{Moonrise1}, \code{Moonrise2}, \code{Moonrise3}, \code{Cavalcanti1},
#'   \code{GrandBudapest1}, \code{GrandBudapest2}, \code{IsleofDogs1}, \code{IsleofDogs2}
#' @param type Either "continuous" or "discrete". Use continuous if you want
#'   to automatically interpolate between colours.
#'   @importFrom graphics rgb rect par image text
#' @return A vector of colours.
#' @export
#' @keywords colors
#' @examples
#' wes_palette("Royal1")
#' wes_palette("GrandBudapest1")
#' wes_palette("Cavalcanti1")
#' wes_palette("Cavalcanti1", 3)
#'
#' # If you need more colours than normally found in a palette, you
#' # can use a continuous palette to interpolate between existing
#' # colours
#' pal <- wes_palette(21, name = "Zissou1", type = "continuous")
#' image(volcano, col = pal)
suf_palette <- function(name, n, type = c("discrete", "continuous")) {
  type <- match.arg(type)

  pal <- suf_palettes[[name]]
  if (is.null(pal))
    stop("Palette not found.")

  if (missing(n)) {
    n <- length(pal)
  }

  if (type == "discrete" && n > length(pal)) {
    stop("Number of requested colors greater than what palette can offer")
  }

  out <- switch(type,
    continuous = grDevices::colorRampPalette(pal)(n),
    discrete = pal[1:n]
  )
  structure(out, class = "palette", name = name)
}

#' @export
#' @importFrom graphics rect par image text
#' @importFrom grDevices rgb
print.palette <- function(x, ...) {
  n <- length(x)
  old <- par(mar = c(0.5, 0.5, 0.5, 0.5))
  on.exit(par(old))

  image(1:n, 1, as.matrix(1:n), col = x,
    ylab = "", xaxt = "n", yaxt = "n", bty = "n")

  rect(0, 0.9, n + 1, 1.1, col = rgb(1, 1, 1, 0.8), border = NA)
  text((n + 1) / 2, 1, labels = attr(x, "name"), cex = 1, family = "serif")
}
