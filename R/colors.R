#' Complete list of palettes
#'
#' Use \code{\link{suf_palette}} to construct palettes of desired length.
#'
#' @export
suf_palettes <- list(
  london = c("#BD241E", "#E56B1E","#FFCD22", "#15274D")
  , oxon = c("#4D3161", "#E46E30","#A82A36", "#0D4278", "#A2D2D4")
  , CarolMan = c("#EE2617", "#F2A241", "#558934", "#0E54B6")
  # , hanwell = c("#200E6A", "#B01824", "#90468C",  "#326529", "#82D0F0",  "#D7BB55")
  , hanwell = c("#200E6A", "#B01824", "#90468C",  "#326529", "#82D0F0")
  , chelsea = c("#9C5E51", "#9E864A", "#61714D", "#4B6C7F", "#614927")
  , classic = c("#990099", "#009900")
)

#' SUffragette- and suffragist-inspired palettes
#'
#' @param n Number of colors desired. Number of colours available vary by type of palette.
#'   If omitted, uses all colours.
#' @param name Name of desired palette. Choices are:
#'   \code{BottleRocket1}, \code{BottleRocket2},  \code{Rushmore1},
#'   \code{london}, \code{oxon},  \code{CarolMan}, \code{hanwell},
#'   \code{chelsea},  \code{classic}
#' @param type Either "continuous" or "discrete". Use continuous if you want
#'   to automatically interpolate between colours.
#'   @importFrom graphics rgb rect par image text
#' @return A vector of colours.
#' @export
#' @keywords colors
#' @examples
#' suf_palette("london")
#' suf_palette("chelsea", n = 3)
#'
#' # If you need more colours than normally found in a palette, you
#' # can use a continuous palette to interpolate between existing
#' # colours
#' suf_palette("classic", n = 6, type = "continuous")
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
