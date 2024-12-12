library(colorspace)
library(usethis)

main_blue = "#0033A0"
main_un =  "#418FDE"
main_green = "#5CB8B2"
main_red = "#D22630"
main_grey = "#666666"
main_yellow = "#FFB81C"
alt_yellow = "#FF671F"


pal_blue_iom <- c(
  "blue1" = "#0033AD",
  "blue2" = "#4066B8",
  "blue3" = "#8099D0",
  "blue4" = "#B3C2E3",
  "blue5" = "#D9E0F1"
)

pal_un_iom <- c(
  "un1" = "#418FDE",
  "un2" = "#84ADEC",
  "un3" = "#ADC9F2",
  "un4" = "#CEDEF7",
  "un5" = "#E6EFFB"
)

pal_green_iom <- c(
  "green1" = "#5CB8B2",
  "green2" = "#85CAC5",
  "green3" = "#AEDCD9",
  "green4" = "#CEEAE8",
  "green5" = "#E7F4F3"
)

pal_red_iom <- c(
  "red1" = "#D22630",
  "red2" = "#DD5C64",
  "red3" = "#E99398",
  "red4" = "#F2BEC1",
  "red5" = "#F8DEE0"
)

pal_grey_iom <- c(
  "grey1" = "#E6E6E6",
  "grey2" = "#CCCCCC",
  "grey3" = "#999999",
  "grey4" = main_grey,
  "grey5" = "#333333"
)

pal_yellow_iom <- c(
  "yellow1" = "#FFB81C",
  "yellow2" = "#FFCA55",
  "yellow3" = "#FFDC8E",
  "yellow4" = "#FFEABB",
  "yellow5" = "#FFF4DD"
)

pal_orange_iom <- c(
  "orange1" = "#FF671F",
  "orange2" = "#FF8D57",
  "orange3"= "#FFB38F",
  "orange4" = "#FFD1BC",
  "orange5" = "#FFE8DD")

pal_main <- c(main_blue, pal_blue_iom["blue2"],
              pal_un_iom["un5"], pal_un_iom["un3"],
              pal_green_iom["green4"], pal_green_iom["green2"],
              pal_grey_iom["grey4"], pal_grey_iom["grey2"],
              pal_red_iom["red4"], pal_red_iom["red2"])

pal_iom_region <- c(
  "Central and North America and Caribbean"="#82ABEB",
  "South America"="#FDA880",
  "West and Central Africa"="#FDC854",
  "European Economic Area"="#A1C0F0",
  "Middle East & North Africa"="#DB5A63",
  "Southern Africa"="#E3838A",
  "East and The Horn of Africa"="#A1D5D3",
  "Asia and the Pacific"="#A1D5D3",
  "South-Eastern Europe, Eastern Europe and Central Asia"="#FD8B56")


iomcolors <- tibble::tibble(name = c("pal_iom",
                                       "pal_iom_region",
                                       "pal_blue",
                                       "pal_un",
                                       "pal_green",
                                       "pal_red",
                                       "pal_yellow",
                                       "pal_grey",
                                       "pal_blue_red",
                                       "pal_un_red"),
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
                                        pal_un_iom[5],
                                        pal_green_iom[4],
                                        pal_red_iom[4],
                                        pal_yellow_iom[3],
                                        pal_grey_iom[4],
                                        NULL, NULL),
                              n2 = list(pal_main[1:2],
                                        pal_blue_iom[4:3],
                                        c(pal_blue_iom[2], pal_blue_iom[4]),
                                        c(pal_un_iom[3], pal_un_iom[5]),
                                        c(pal_green_iom[2], pal_green_iom[4]),
                                        c(pal_red_iom[2], pal_red_iom[4]),
                                        c(pal_yellow_iom[3], pal_yellow_iom[4]),
                                        c(pal_grey_iom[2], pal_grey_iom[4]),
                                        c(pal_blue_iom[4], pal_red_iom[4]),
                                        c(pal_un_iom[5], pal_red_iom[4])),
                              n3 = list(c(pal_main[3], pal_main[1:2]),
                                        pal_blue_iom[4:2],
                                        pal_blue_iom[2:4],
                                        pal_un_iom[3:5],
                                        pal_green_iom[2:4],
                                        pal_red_iom[2:4],
                                        pal_yellow_iom[3:5],
                                        pal_grey_iom[2:4],
                                        c(pal_blue_iom[4], pal_grey_iom[1], pal_red_iom[4]),
                                        c(pal_un_iom[5], pal_grey_iom[1], pal_red_iom[4])),
                              n4 = list(c(pal_main[3], pal_main[1:2], pal_main[5]),
                                        c(pal_blue_iom[4:2], pal_un_iom[5]),
                                        pal_blue_iom[2:5],
                                        pal_un_iom[2:5],
                                        pal_green_iom[2:5],
                                        pal_red_iom[2:5],
                                        pal_yellow_iom[2:5],
                                        pal_grey_iom[2:5],
                                        c(pal_blue_iom[4], pal_blue_iom[2],
                                          pal_red_iom[2], pal_red_iom[4]),
                                        c(pal_un_iom[5], pal_un_iom[3],
                                          pal_red_iom[2], pal_red_iom[4])),
                              n5 = list(c(pal_main[3], pal_main[1:2], pal_main[5], pal_main[7]),
                                        c(pal_blue_iom[4:2], pal_un_iom[5], pal_green_iom[4]),
                                        pal_blue_iom[1:5],
                                        pal_un_iom[1:5],
                                        pal_green_iom[1:5],
                                        pal_red_iom[1:5],
                                        pal_yellow_iom[1:5],
                                        pal_grey_iom[1:5],
                                        c(pal_blue_iom[4], pal_blue_iom[2],
                                          pal_grey_iom[1],
                                          pal_red_iom[2], pal_red_iom[4]),
                                        c(pal_un_iom[5], pal_un_iom[3],
                                          pal_grey_iom[1],
                                          pal_red_iom[2], pal_red_iom[4])),
                              n6 = list(c(pal_main[1:5], pal_main[7]),
                                        c(pal_blue_iom[4:2], pal_un_iom[5], pal_green_iom[4],
                                          pal_yellow_iom[4]),
                                        NULL, NULL, NULL,
                                        NULL, NULL, NULL,
                                        c(pal_blue_iom[4:2],  pal_red_iom[2:4]),
                                        c(pal_un_iom[5:3], pal_red_iom[2:4])),
                              n7 = list(pal_main[1:7],
                                        c(pal_blue_iom[4:2], pal_un_iom[5], pal_green_iom[4],
                                          pal_yellow_iom[4], pal_red_iom[4]),
                                        NULL, NULL, NULL,
                                        NULL, NULL, NULL,
                                        c(pal_blue_iom[4:2],  pal_grey_iom[1], pal_red_iom[2:4]),
                                        c(pal_un_iom[5:3], pal_grey_iom[1], pal_red_iom[2:4])),
                              n8 = list(pal_main[1:8],
                                        NULL,
                                        NULL, NULL, NULL,
                                        NULL, NULL, NULL,
                                        c(pal_blue_iom[5:2], pal_red_iom[2:5]),
                                        c(pal_un_iom[5:2], pal_red_iom[2:5])),
                              n9 = list(pal_main[1:9],
                                        NULL,
                                        NULL, NULL, NULL,
                                        NULL, NULL, NULL,
                                        c(pal_blue_iom[5:2], pal_grey_iom[1], pal_red_iom[2:5]),
                                        c(pal_un_iom[5:2], pal_grey_iom[1], pal_red_iom[2:5])),
                              n10 = list(pal_main,
                                         NULL,
                                         NULL, NULL, NULL,
                                         NULL, NULL, NULL,
                                         NULL, NULL))


iomcolors <- as.data.frame(iomcolors)

usethis::use_data(iomcolors,
                  internal = TRUE,
                  overwrite = TRUE)
