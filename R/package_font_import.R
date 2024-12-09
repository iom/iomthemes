# WARNING - Generated by {fusen} from dev/fusen_dev.Rmd: do not edit by hand

#' Import Open Sans font
#'
#' Import Open Sans font for use in R graphic devices
#'
#' @importFrom systemfonts register_font
#' @importFrom extrafont font_import
#'
#' @return No return value, called for side effects
#' @export
#' @noRd
#' @examples
#' test <- systemfonts::system_fonts() |>
#'              dplyr::filter(  family == "Open Sans"  )
#' package_font_import()
package_font_import <- function() {
  if (!package_font_installed()) {
    font_dir <- system.file("fonts", "OpenSans",
      package = "iomthemes"
    )
    systemfonts::register_font(
      name = "OpenSans",
      plain = file.path(font_dir, "OpenSans-Regular.ttf"),
      italic = file.path(font_dir, "OpenSans-Italic.ttf"),
      bold = file.path(font_dir, "OpenSans-Bold.ttf"),
      bolditalic = file.path(
        font_dir,
        "OpenSans-BoldItalic.ttf"
      )
    )
    pattern <- "(?i)OpenSans-(regular|bold|italic|bolditalic)"
    suppressMessages(extrafont::font_import(font_dir,
      pattern = pattern,
      prompt = FALSE
    ))
    suppressMessages(extrafont::loadfonts())
  } else {
    font_dir <- systemfonts::system_fonts()
    b <- grepl("Open Sans", font_dir$family, ignore.case = TRUE)
    font_dir <- font_dir[b, ]
    font_dir <- unique(dirname(font_dir$path))
    pattern <- "(?i)OpenSans-(regular|bold|italic|bolditalic)"
    suppressMessages(extrafont::font_import(font_dir,
      pattern = pattern,
      prompt = FALSE
    ))
    suppressMessages(extrafont::loadfonts())
  }
  update_geom_font_defaults()
}
