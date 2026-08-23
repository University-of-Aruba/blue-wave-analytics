# Blue Wave Analytics - build the teaching datasets
# Iteration: 2
#
# Purpose: assemble the small, clean files the course reads in the room, from
# public sources only. Nothing is scraped live during teaching; everything the
# learners touch is produced here and committed.
#
# Iteration 2 (23 Aug 2026) replaced the squad dataset. Iteration 1 used a
# hand-coded research file from Cornerstone Economics working paper WP-2026-01.
# That is CE's data, and a DCDC training repository in the University of Aruba
# org is the wrong place for it. The squad list is now rebuilt from Wikipedia
# national-team squad tables, which are public and CC-BY-SA.
#
# Sources:
#   Squads         Wikipedia national football team articles (four squads)
#   FIFA rankings  FIFA world ranking points and positions, joined to UN DESA
#                  population estimates. Published statistics, tabulated.
#   Diaspora       UN DESA international migrant stock by country of origin.
#
# Writes into episodes/data/:
#   blue_wave_squad.csv    primary teaching dataset (episodes 2-4, 6)
#   blue_wave_squad.xlsx   same data, two sheets, for the readxl section
#   blue_wave_squad.sav    same data as SPSS, for the haven round-trip demo
#   fifa_rankings.csv      cross-country panel (episodes 4-5)
#   diaspora_change.csv    diaspora stock 1990/2010/2024 (episode 5 paired test)
#
# Run from the repository root:  Rscript scripts/00_build_teaching_data.R
# Re-run it when a squad is re-called; the numbers quoted in the episode prose
# will move, so re-read the episodes after you do.

suppressPackageStartupMessages({
  library(rvest)
  library(dplyr)
  library(stringr)
  library(purrr)
  library(readr)
  library(writexl)
  library(haven)
  library(countrycode)
})

data_dir <- file.path("episodes", "data")

# ---- 1. Squads from Wikipedia ------------------------------------------------

squad_pages <- tribble(
  ~team_code, ~url,
  "CUW-M", "https://en.wikipedia.org/wiki/Cura%C3%A7ao_national_football_team",
  "CUW-W", "https://en.wikipedia.org/wiki/Cura%C3%A7ao_women%27s_national_football_team",
  "ARU-M", "https://en.wikipedia.org/wiki/Aruba_national_football_team",
  "ARU-W", "https://en.wikipedia.org/wiki/Aruba_women%27s_national_football_team"
)

# The squad tables are not at a stable index and do not all carry the same
# columns, so find the table by its header names rather than by position, and
# skip the "recent call-ups" table that follows it on some pages.
scrape_squad <- function(team_code, url) {
  page <- tryCatch(read_html(url), error = function(e) NULL)
  if (is.null(page)) stop("could not fetch ", url)

  for (tbl in html_elements(page, "table")) {
    trs <- html_elements(tbl, "tr")
    if (length(trs) < 6) next
    hdr <- str_squish(html_text2(html_elements(trs[[1]], "th,td")))
    i_player <- which(hdr == "Player")
    i_club   <- which(hdr == "Club")
    i_pos    <- which(hdr == "Pos.")
    if (!length(i_player) || !length(i_club) || !length(i_pos)) next
    if (any(grepl("call-up", hdr, ignore.case = TRUE))) next

    out <- map_dfr(trs[-1], function(row) {
      cells <- html_elements(row, "td,th")
      if (length(cells) < max(i_player, i_club, i_pos)) return(NULL)
      img <- html_elements(cells[[i_club]], "img")
      tibble(
        team_code    = team_code,
        position_raw = str_squish(html_text2(cells[[i_pos]])),
        player_name  = str_squish(html_text2(cells[[i_player]])),
        club         = str_squish(html_text2(cells[[i_club]])),
        flag_file    = if (length(img)) basename(html_attr(img, "src")[1]) else NA_character_
      )
    })
    if (nrow(out) >= 5) return(out)
  }
  stop("no squad table found on ", url)
}

# The club's country is only in the flag image next to the club name, so read it
# out of the flag filename: "40px-Flag_of_the_Netherlands.svg.png" -> Netherlands
country_from_flag <- function(f) {
  x <- str_remove(f, "^[0-9]+px-")
  x <- str_remove(x, "[.]svg.*$")
  x <- str_remove(x, "[.]png.*$")
  x <- str_remove(x, "^Flag_of_the_")
  x <- str_remove(x, "^Flag_of_")
  x <- str_remove(x, "_%28.*%29$")
  x <- str_replace_all(x, "%C3%A7", "ç")
  str_squish(str_replace_all(x, "_", " "))
}

squad <- map2_dfr(squad_pages$team_code, squad_pages$url, scrape_squad) %>%
  mutate(
    position = case_when(
      str_detect(position_raw, "GK") ~ "GK",
      str_detect(position_raw, "DF") ~ "DEF",
      str_detect(position_raw, "MF") ~ "MID",
      str_detect(position_raw, "FW") ~ "FWD",
      .default = "X"
    ),
    club = if_else(is.na(club) | club == "", "unknown", club),
    club_country = suppressWarnings(countrycode(
      country_from_flag(flag_file), "country.name", "iso3c",
      # The home nations and Kosovo have no ISO3 of their own in countrycode
      custom_match = c("England" = "GBR", "Scotland" = "GBR", "Wales" = "GBR",
                       "Northern Ireland" = "GBR", "Kosovo" = "XKX")
    )),
    # X marks a player whose club could not be established, not a missing value
    # to be quietly dropped. Episodes 3, 5 and 6 make a point of this.
    club_country = if_else(is.na(club_country), "X", club_country)
  ) %>%
  select(team_code, player_name, position, club, club_country) %>%
  arrange(team_code, position, player_name)

stopifnot(nrow(squad) > 80, n_distinct(squad$team_code) == 4)

write_csv(squad, file.path(data_dir, "blue_wave_squad.csv"), na = "NA")

# Excel version, one sheet per island, so episode 2 can show the sheet argument
write_xlsx(
  list(
    curacao = filter(squad, substr(team_code, 1, 3) == "CUW"),
    aruba   = filter(squad, substr(team_code, 1, 3) == "ARU")
  ),
  file.path(data_dir, "blue_wave_squad.xlsx")
)

# SPSS version, so learners can read a .sav with haven and see it works
write_sav(
  mutate(squad, across(where(is.character), ~ replace(.x, is.na(.x), ""))),
  file.path(data_dir, "blue_wave_squad.sav")
)

# ---- 2. Cross-country panel --------------------------------------------------
# FIFA world ranking points and positions against population and diaspora size.
# Published statistics; the file here is a tabulation, trimmed to what we teach.

panel <- read_csv(file.path(data_dir, "fifa_global_panel.csv"),
                  show_col_types = FALSE) %>%
  select(country, iso3, rank, points,
         population = population_latest,
         diaspora = diaspora_2024,
         diaspora_per_capita) %>%
  mutate(
    # The upstream panel spells the host island without its cedilla
    country = recode(country, "Curacao" = "Curaçao"),
    log_population = log(population),
    small_state    = population < 1e6
  ) %>%
  arrange(rank)

write_csv(panel, file.path(data_dir, "fifa_rankings.csv"), na = "NA")

# ---- 3. Diaspora over time ---------------------------------------------------
# Episode 5 needs a paired comparison: the same units measured twice. UN DESA
# migrant-stock totals by country of origin give us that. The source file mixes
# real countries with regional aggregates, so keep only rows that resolve.

diaspora <- read_csv(file.path(data_dir, "diaspora_global.csv"),
                     show_col_types = FALSE) %>%
  mutate(iso3 = suppressWarnings(
    countrycode(origin, "country.name", "iso3c"))) %>%
  filter(!is.na(iso3)) %>%
  select(country = origin, iso3,
         diaspora_1990, diaspora_2010, diaspora_2024) %>%
  mutate(
    country = recode(country, "Curacao" = "Curaçao"),
    growth_1990_2024 = diaspora_2024 / diaspora_1990
  ) %>%
  arrange(country)

write_csv(diaspora, file.path(data_dir, "diaspora_change.csv"), na = "NA")

# ---- 4. Report ---------------------------------------------------------------
cat("blue_wave_squad.csv :", nrow(squad), "players,", ncol(squad), "columns\n")
cat("fifa_rankings.csv   :", nrow(panel), "countries\n")
cat("diaspora_change.csv :", nrow(diaspora), "countries\n")
cat("Squad sizes:\n"); print(table(squad$team_code))
cat("Club countries:\n"); print(sort(table(squad$club_country), decreasing = TRUE))
