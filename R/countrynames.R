#' @title Country dictionary
#'
#' @description Table of countries, areas, and territories with their official names, M49 and
#' ISO codes, and regional groupings.
#'
#' @details This is the UN's *Standard Country or Area Codes for Statistical
#'   Use*, also known as the M49 standard
#'   (https://unstats.un.org/unsd/methodology/m49), with the following
#'   revisions:
#'   \itemize{
#'     \item "State of Palestine" is replaced with "Occupied Palestinian
#'       Territory" in accordance with the IOM *House Style Manual* (May 2023).
#'     \item "Kosovo (SCR 1244)" is added with ISO codes "XK" and "XKX".
#'       References to Kosovo shall be understood to be in the context of United
#'       Nations Security Council resolution 1244 (1999).
#'     \item "Channel Islands" is added with ISO codes "XC" and "XCX". The
#'       Channel Islands comprise the British crown dependencies of Guernsey
#'       and Jersey, which are present in the table. However, some datasets
#'       (such as UN DESA's international migrant stocks) combine Guernsey and
#'       Jersey under the Channel Islands, so the separate entry accounts for
#'       such cases.
#'     \item "Abyei" is added with ISO-3 code "AB9". This follows the
#'       designations of the IDMC, whose data separately identify this disputed
#'       area on the border between Sudan and South Sudan.
#'     \item "Taiwan Province of China, China" is added with ISO-3 code "TWN".
#'     \item "Stateless" is added with ISO-3 code "STL".
#'     \item "Unknown" is added with ISO-3 code "OOO".
#'      }
#'
#'  \describe{
#'   \item{\code{m49}}{double This is the UN's *Standard Country or Area Codes for Statistical
#'   Use*, also known as the M49 standard (https://unstats.un.org/unsd/methodology/m49)}
#'   \item{\code{iso2}}{character ISO 2 Characters}
#'   \item{\code{iso3}}{character  ISO 3 Characters}
#'   \item{\code{name}}{character COLUMN_DESCRIPTION}
#'   \item{\code{name_sort}}{character COLUMN_DESCRIPTION}
#'   \item{\code{name_text}}{character COLUMN_DESCRIPTION}
#'   \item{\code{with_the}}{double COLUMN_DESCRIPTION}
#'   \item{\code{region_code}}{double COLUMN_DESCRIPTION}
#'   \item{\code{region}}{character COLUMN_DESCRIPTION}
#'   \item{\code{subregion_code}}{double COLUMN_DESCRIPTION}
#'   \item{\code{subregion}}{character COLUMN_DESCRIPTION}
#'   \item{\code{intregion_code}}{double COLUMN_DESCRIPTION}
#'   \item{\code{intregion}}{character COLUMN_DESCRIPTION}
#'   \item{\code{rdh}}{character COLUMN_DESCRIPTION}
#'   \item{\code{ldc}}{double COLUMN_DESCRIPTION}
#'   \item{\code{lldc}}{double COLUMN_DESCRIPTION}
#'   \item{\code{sids}}{double COLUMN_DESCRIPTION}
#'   \item{\code{eu}}{double membership in the  European Union}
#'   \item{\code{schengen}}{double Membership in the Schengen Area}
#'   \item{\code{balkans}}{double the Balkans}
#'   \item{\code{iom.region}}{double IOM Regions as defined in the appeal as
#'   displayed here:
#'    https://www.iom.int/sites/g/files/tmzbdl486/files/appeals/iom-global-appeal-2024_final.pdf#page=21}
#'   }
"countrynames"
