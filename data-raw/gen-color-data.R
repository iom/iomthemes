library(colorspace)
library(usethis)

main_blue = "#0033A0"
main_navy = "#18375F"
main_green = "#5CB8B2"
main_red = "#D22630"
main_grey = "#666666"
main_yellow = "#FFB81C"
alt_yellow = "#FF671F"

second_blue = "#418FDE"

pal_blue_iom <- c(
  "blue1" = colorspace::lighten(second_blue, 0.75),
  "blue2" = colorspace::lighten(second_blue, 0.50),
  "blue3" = colorspace::lighten(second_blue, 0.3),
  "blue4" = second_blue,
  "blue5" = colorspace::darken(second_blue, 0.3)
)

pal_navy_iom <- c(
  "navy1" = colorspace::lighten(main_navy, 0.9),
  "navy2" = colorspace::lighten(main_navy, 0.75),
  "navy3" = colorspace::lighten(main_navy, 0.5),
  "navy4" = colorspace::lighten(main_navy, 0.25),
  "navy5" = main_navy
)

pal_green_iom <- c(
  "green1" = colorspace::lighten(main_green, 0.9),
  "green2" = colorspace::lighten(main_green, 0.55),
  "green3" = colorspace::lighten(main_green, 0.3),
  "green4" = main_green,
  "green5" = colorspace::darken(main_green, 0.3)
)

pal_red_iom <- c(
  "red1" = colorspace::lighten(main_red, 0.85),
  "red2" = colorspace::lighten(main_red, 0.6),
  "red3" = colorspace::lighten(main_red, 0.3),
  "red4" = main_red,
  "red5" = colorspace::darken(main_red, 0.3)
)

pal_grey_iom <- c(
  "grey1" = "#E6E6E6",
  "grey2" = "#CCCCCC",
  "grey3" = "#999999",
  "grey4" = main_grey,
  "grey5" = "#333333"
)

pal_yellow_iom <- c(
  "yellow1" = colorspace::lighten(main_yellow, 0.7),
  "yellow2" = colorspace::lighten(main_yellow, 0.4),
  "yellow3" = main_yellow,
  "yellow4" = hex(colorspace::mixcolor(0.4,
                                       hex2RGB(main_yellow),
                                       hex2RGB(alt_yellow))),
  "yellow5" = alt_yellow
)

pal_main <- c(main_blue, pal_blue_iom["blue2"],
              pal_navy_iom["navy5"], pal_navy_iom["navy3"],
              pal_green_iom["green4"], pal_green_iom["green2"],
              pal_grey_iom["grey4"], pal_grey_iom["grey2"],
              pal_red_iom["red4"], pal_red_iom["red2"])



iomcolors <- tibble::tibble(name = c("pal_iom",
                                       "pal_iom_region",
                                       "pal_blue",
                                       "pal_navy",
                                       "pal_green",
                                       "pal_red",
                                       "pal_yellow",
                                       "pal_grey",
                                       "pal_blue_red",
                                       "pal_navy_red"),
                              type = c(rep("qualitative", 2),
                                       rep("sequential", 6),
                                       rep("diverging", 2)),
                              min_n = 1,
                              max_n = c(c(10,
                                          7),
                                        rep(5, 6),
                                        rep(9, 2)),
                              n1 = list(pal_main[1],
                                        pal_blue_iom[4],
                                        pal_blue_iom[4],
                                        pal_navy_iom[5],
                                        pal_green_iom[4],
                                        pal_red_iom[4],
                                        pal_yellow_iom[3],
                                        pal_grey_iom[4],
                                        NULL, NULL),
                              n2 = list(pal_main[1:2],
                                        pal_blue_iom[4:3],
                                        c(pal_blue_iom[2], pal_blue_iom[4]),
                                        c(pal_navy_iom[3], pal_navy_iom[5]),
                                        c(pal_green_iom[2], pal_green_iom[4]),
                                        c(pal_red_iom[2], pal_red_iom[4]),
                                        c(pal_yellow_iom[3], pal_yellow_iom[4]),
                                        c(pal_grey_iom[2], pal_grey_iom[4]),
                                        c(pal_blue_iom[4], pal_red_iom[4]),
                                        c(pal_navy_iom[5], pal_red_iom[4])),
                              n3 = list(c(pal_main[3], pal_main[1:2]),
                                        pal_blue_iom[4:2],
                                        pal_blue_iom[2:4],
                                        pal_navy_iom[3:5],
                                        pal_green_iom[2:4],
                                        pal_red_iom[2:4],
                                        pal_yellow_iom[3:5],
                                        pal_grey_iom[2:4],
                                        c(pal_blue_iom[4], pal_grey_iom[1], pal_red_iom[4]),
                                        c(pal_navy_iom[5], pal_grey_iom[1], pal_red_iom[4])),
                              n4 = list(c(pal_main[3], pal_main[1:2], pal_main[5]),
                                        c(pal_blue_iom[4:2], pal_navy_iom[5]),
                                        pal_blue_iom[2:5],
                                        pal_navy_iom[2:5],
                                        pal_green_iom[2:5],
                                        pal_red_iom[2:5],
                                        pal_yellow_iom[2:5],
                                        pal_grey_iom[2:5],
                                        c(pal_blue_iom[4], pal_blue_iom[2],
                                          pal_red_iom[2], pal_red_iom[4]),
                                        c(pal_navy_iom[5], pal_navy_iom[3],
                                          pal_red_iom[2], pal_red_iom[4])),
                              n5 = list(c(pal_main[3], pal_main[1:2], pal_main[5], pal_main[7]),
                                        c(pal_blue_iom[4:2], pal_navy_iom[5], pal_green_iom[4]),
                                        pal_blue_iom[1:5],
                                        pal_navy_iom[1:5],
                                        pal_green_iom[1:5],
                                        pal_red_iom[1:5],
                                        pal_yellow_iom[1:5],
                                        pal_grey_iom[1:5],
                                        c(pal_blue_iom[4], pal_blue_iom[2],
                                          pal_grey_iom[1],
                                          pal_red_iom[2], pal_red_iom[4]),
                                        c(pal_navy_iom[5], pal_navy_iom[3],
                                          pal_grey_iom[1],
                                          pal_red_iom[2], pal_red_iom[4])),
                              n6 = list(c(pal_main[1:5], pal_main[7]),
                                        c(pal_blue_iom[4:2], pal_navy_iom[5], pal_green_iom[4],
                                          pal_yellow_iom[4]),
                                        NULL, NULL, NULL,
                                        NULL, NULL, NULL,
                                        c(pal_blue_iom[4:2],  pal_red_iom[2:4]),
                                        c(pal_navy_iom[5:3], pal_red_iom[2:4])),
                              n7 = list(pal_main[1:7],
                                        c(pal_blue_iom[4:2], pal_navy_iom[5], pal_green_iom[4],
                                          pal_yellow_iom[4], pal_red_iom[4]),
                                        NULL, NULL, NULL,
                                        NULL, NULL, NULL,
                                        c(pal_blue_iom[4:2],  pal_grey_iom[1], pal_red_iom[2:4]),
                                        c(pal_navy_iom[5:3], pal_grey_iom[1], pal_red_iom[2:4])),
                              n8 = list(pal_main[1:8],
                                        NULL,
                                        NULL, NULL, NULL,
                                        NULL, NULL, NULL,
                                        c(pal_blue_iom[5:2], pal_red_iom[2:5]),
                                        c(pal_navy_iom[5:2], pal_red_iom[2:5])),
                              n9 = list(pal_main[1:9],
                                        NULL,
                                        NULL, NULL, NULL,
                                        NULL, NULL, NULL,
                                        c(pal_blue_iom[5:2], pal_grey_iom[1], pal_red_iom[2:5]),
                                        c(pal_navy_iom[5:2], pal_grey_iom[1], pal_red_iom[2:5])),
                              n10 = list(pal_main,
                                         NULL,
                                         NULL, NULL, NULL,
                                         NULL, NULL, NULL,
                                         NULL, NULL))


iomcolors <- as.data.frame(iomcolors)

usethis::use_data(iomcolors,
                  internal = TRUE,
                  overwrite = TRUE)
