# WARNING - Generated by {fusen} from dev/fusen_dev.Rmd: do not edit by hand

#' IOM color palettes viewer
#'
#' Displays a set of the color palettes from IOM color
#'
#' @param n Number of different colors in the palette, minimum depending on 
#'    the palette (2), maximum depending on the palette (5, 7 or 10)
#' @param type Type of the palette, can be "sequential", "diverging", "qualitative" or "all"
#'
#' @importFrom graphics par plot rect text
#'
#' @return No return value, called for side effects
#'
#' @export
#' @noRd
#' @examples
#' library(iomthemes)
#'
#' # Display all iom color palette
#' iom_pal_display_all()
#'
#' # Display all IOM color palette with filters
#' iom_pal_display_all(type = "diverging")
#' iom_pal_display_all(type = c("diverging", "qualitative", "sequential"))
#' iom_pal_display_all(n = 3, type = "sequential")
#' iom_pal_display_all(n = 5, type = "sequential")
iom_pal_display_all <- function(n = NULL, type = "all") {
  iomcolors <- iomcolors[nrow(iomcolors):1, ]
  if (any(type == "all")) {
    selected_type <- iomcolors
  } else if (any(type %in% c("qualitative", "sequential", "diverging"))) {
    selected_type <- iomcolors[iomcolors$type %in% type, ]
  } else {
    stop(paste(type, "is not a valid name for a color type\n"))
  }
  selected_metadata <- iomcolors[iomcolors$name %in% selected_type$name, ]

  n_colors <- nrow(selected_metadata)

  if (is.null(n)) {
    my_n <- selected_metadata$max_n
  } else {
    my_n <- rep(n, n_colors)
  }

  selected_colors <- vector("list", n_colors)

  ylim <- c(0, n_colors)
  oldpar <- par(
    mgp = c(2, 0.25, 0),
    pty = "s",
    mar = c(0, 0, 0, 0)
  )
  on.exit(par(oldpar))
  max_my_n <- max(my_n)
  plot(1, 1,
    xlim = c(-1.5, max_my_n), ylim = ylim,
    type = "n", axes = FALSE, bty = "n", xlab = "", ylab = ""
  )

  for (i in seq_len(n_colors)) {
    one_color <- iom_pal(
      n = my_n[i],
      name = selected_metadata$name[i]
    )
    rect(
      xleft = 0:(my_n[i] - 1),
      ybottom = i - 1,
      xright = 1:my_n[i],
      ytop = i - 0.2,
      col = one_color,
      border = "light grey"
    )
    text(-0.1, i - 0.6,
      labels = selected_metadata$name[i],
      xpd = TRUE,
      adj = 1
    )
  }
}
