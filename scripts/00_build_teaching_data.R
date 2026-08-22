# Blue Wave Analytics - build the teaching datasets
# Iteration: 1
#
# Purpose: turn the verified research data behind CE working paper WP-2026-01
# into the small, clean files the course reads in the room. Nothing is scraped
# live during teaching; everything the learners touch is produced here.
#
# Sources (all already verified, see episodes/data/curacao_squad_codebook.md):
#   curacao_squad_raw.csv  <- wp-2026-01-worldcup/data/abc_squads_iter1.csv
#   fifa_global_panel.csv  <- wp-2026-01-worldcup/data/global_panel.csv
#   diaspora_panel.csv     <- wp-2026-01-worldcup/data/diaspora_panel.csv
#
# Writes into episodes/data/:
#   blue_wave_squad.csv    primary teaching dataset (episodes 2-4)
#   blue_wave_squad.xlsx   same data, two sheets, for the readxl section
#   blue_wave_squad.sav    same data as SPSS, for the haven round-trip demo
#   fifa_rankings.csv      cross-country panel (episode 5 regression)
#   diaspora_change.csv    diaspora stock 1990/2010/2024 (episode 5 paired test)
#
# Run from the repository root:  Rscript scripts/00_build_teaching_data.R

suppressPackageStartupMessages({
  library(dplyr)
  library(readr)
  library(writexl)
  library(haven)
})

data_dir <- file.path("episodes", "data")

# ---- 1. Squad dataset -------------------------------------------------------
# The notes column is provenance for the research, not analysis material, and
# its free text makes the file awkward to teach with. Drop it here; the
# codebook stays in the repository so the coding decisions remain inspectable.

squad_raw <- read_csv(file.path(data_dir, "curacao_squad_raw.csv"),
                      show_col_types = FALSE)

stopifnot(nrow(squad_raw) == 103, ncol(squad_raw) == 8)

squad <- squad_raw %>%
  select(-notes) %>%
  arrange(team_code, position, player_name)

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
squad_sav <- squad %>%
  mutate(across(where(is.character), ~ replace(.x, is.na(.x), "")))
write_sav(squad_sav, file.path(data_dir, "blue_wave_squad.sav"))

# ---- 2. Cross-country panel -------------------------------------------------
# Used in episode 5. FIFA rank against population and diaspora size is the
# actual regression from the working paper, trimmed to the columns we teach.

panel <- read_csv(file.path(data_dir, "fifa_global_panel.csv"),
                  show_col_types = FALSE) %>%
  select(country, iso3, rank, points,
         population = population_latest,
         diaspora = diaspora_2024,
         diaspora_per_capita) %>%
  mutate(
    # The upstream panel spells the host island without its cedilla. Fix it
    # here rather than in the room; learners should not have to type around it.
    country = recode(country, "Curacao" = "Curaçao"),
    log_population = log(population),
    small_state    = population < 1e6
  ) %>%
  arrange(rank)

write_csv(panel, file.path(data_dir, "fifa_rankings.csv"), na = "NA")

# ---- 3. Diaspora over time --------------------------------------------------
# Episode 5 needs a paired comparison: the same units measured twice. UN DESA
# migrant-stock totals by country of origin give us that. The source file mixes
# real countries with regional aggregates (World, Sub-Saharan Africa), so keep
# only rows whose name resolves to a country code.

diaspora <- read_csv(file.path(data_dir, "diaspora_global.csv"),
                     show_col_types = FALSE) %>%
  mutate(iso3 = suppressWarnings(
    countrycode::countrycode(origin, "country.name", "iso3c"))) %>%
  filter(!is.na(iso3)) %>%
  select(country = origin, iso3,
         diaspora_1990, diaspora_2010, diaspora_2024) %>%
  mutate(
    country = recode(country, "Curacao" = "Curaçao"),
    growth_1990_2024 = diaspora_2024 / diaspora_1990
  ) %>%
  arrange(country)

write_csv(diaspora, file.path(data_dir, "diaspora_change.csv"), na = "NA")

# ---- 4. Report --------------------------------------------------------------
cat("blue_wave_squad.csv :", nrow(squad), "players,", ncol(squad), "columns\n")
cat("fifa_rankings.csv   :", nrow(panel), "countries,", ncol(panel), "columns\n")
cat("diaspora_change.csv :", nrow(diaspora), "countries,", ncol(diaspora), "columns\n")
cat("Squad sizes:\n"); print(table(squad$team_code))
