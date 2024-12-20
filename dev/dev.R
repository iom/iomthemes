library("usethis")

usethis::create_github_token()
gitcreds::gitcreds_set()

usethis::use_git_remote("origin", url =
                          NULL, overwrite = TRUE)


use_github(
  organisation = "iom",
  private = FALSE,
  visibility =  "public",
  protocol = git_protocol(),
  host = NULL
)


library(tidyverse)
library(iomthemes)

readxl::read_excel(system.file(
  "undesa_pd_2020_ims_stock_by_sex_destination_and_origin.xlsx",
  package = "iomthemes"),
  col_types = c("numeric", "text", "text","numeric", "text",
                "text", "numeric",
                "numeric","numeric", "numeric", "numeric","numeric","numeric",
                "numeric", "numeric", "numeric", "numeric", "numeric", "numeric",
                "numeric","numeric", "numeric", "numeric", "numeric", "numeric",
                "numeric","numeric", "numeric" ),
  sheet = "Table 1", skip = 9) |>
  ## Getting clean variable names
  janitor::clean_names() |>
  dplyr::rename("total.2020"="x2020_14")|>
  # Add ISO2 country code to identify the country level records
  dplyr::mutate(
    origin.iso2 = countrycode::countrycode(
      location_code_of_origin,
      origin = "un",
      destination = "iso2c"),
    destination.iso2 = countrycode::countrycode(
      location_code_of_destination,
      origin = "un",
      destination = "iso2c")) |>
  # Filter out rows where 'origin.iso2' and 'origin.iso2' is NA (missing)
  # We do so to keep only country level records - filter out region subtotal
  filter( !(is.na(origin.iso2)) ) |>
  filter( !(is.na(destination.iso2)) ) |>
  # Group the data by country of origin
  group_by(region_development_group_country_or_area_of_origin) |>
  # Summarize the total number of migrants for the year 2020 & remove NA!
  summarise(total_migrants_2020 = sum(total.2020, na.rm = TRUE)) |>
  # Arrange the summarized data in descending order of total migrants
  arrange(desc(total_migrants_2020)) |>
  # Select the top 10 countries of origin with the highest number of migrants
  slice_head(n = 10)  |>
  ggplot(
    aes(x = reorder(region_development_group_country_or_area_of_origin,
                    total_migrants_2020),
        y = total_migrants_2020)) +
  # Define it as a bar chart and apply IOM color palette
  geom_bar(stat = "identity",
           ## Apply IOM color palette!
           fill = iomthemes::iom_pal(n = 1, name= "pal_blue"),
           width = 0.8) +
  # Flip the chart to make it more legible
  coord_flip()  +
  ## Format the labels for the x axis
  scale_y_continuous(
    labels = scales::label_number(scale_cut = scales::cut_short_scale())) +
  labs(
    title = "Main Countries of Migrant Origin",
    subtitle = "Highlighting the top 10 countries contributing to global
                migration | 2020",
    x = "Country of Origin",
    y = "Total Migrants (2020)",
    caption = "Source: United Nations Department of Economic and Social Affairs,
            Population Division. International Migrant Stock (2020)") +
  ## and apply IOM theme
  iomthemes::theme_iom(grid = "X", axis = "Y", axis_title = "X")
