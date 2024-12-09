# WARNING - Generated by {fusen} from dev/fusen_dev.Rmd: do not edit by hand

#' Check if Open Sans font family is installed in the system
#'
#' Verify if you have Open Sans font installed in your system
#'
#' @importFrom systemfonts system_fonts
#' @importFrom extrafont loadfonts
#'
#' @returns TRUE if Open Sans is installed in the system
#' @export
#' @noRd
#' @examples
#' test <- systemfonts::system_fonts() |>
#'              dplyr::filter(  family == "Open Sans"  )
#' package_font_installed()
package_font_installed <- function() { 
  extrafont::loadfonts(device = "win"  , quiet = TRUE)  # For Windows
  extrafont::loadfonts(device = "pdf", quiet = TRUE)  # For PDF output
  suppressMessages(extrafont::loadfonts())
  sys_fonts <- systemfonts::system_fonts()
  any(grepl("Open Sans", sys_fonts$family, ignore.case = TRUE))
  
}
