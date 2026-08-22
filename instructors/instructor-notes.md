---
title: 'Instructor Notes'
---

## General Teaching Approach

This course follows the Carpentries live-coding pedagogy: the instructor types
code live while participants follow along. Avoid slides for code — always
demonstrate in RStudio.

Key principles:
- **Start from what they know**: Every R operation is introduced alongside its
  SPSS equivalent. Use SPSS terminology first, then introduce the R term.
- **Wow first, skills second**: Episode 1 is pure motivation. Show impressive
  things before asking anyone to type.
- **Sticky notes**: Use colored sticky notes (or digital equivalents) for
  real-time feedback. Green = I'm following. Red = I need help.
- **Helpers**: Aim for 1 helper per 5-8 participants to assist with individual
  issues without stopping the class.

## Session Structure

### Session 1 (5-6 hours with breaks)

| Episode | Time | Notes |
|---|---|---|
| 01 - The Case for Switching | 45 min | Instructor demo only, no participant coding. Demo is the UA SIDS reference-list pull from `island-research-reference-data` (see Episode 1 instructor block). Second half of the demo loads the squad data and counts where the Curacao men's squad plays; that half needs no network and is the one to protect. Also shows the squad-report capstone HTML as the Wednesday-afternoon target, rendered at `episodes/files/blue-wave-squad-report.html` and sourced at `episodes/files/blue-wave-squad-report-template.Rmd`. |
| Break | 15 min | |
| 02 - Your First R Session | 90 min | First hands-on. Go slow. Many will struggle with typos. The "Before you import" subsection is a deliberate whole-room synchronized moment: project the download links on the screen, wait for green stickies in the Files pane before typing `read_csv()`. |
| Break | 15 min | |
| 03 - Data Manipulation | 90 min | The pipe operator is the key "aha" moment |
| Break | 15 min | |
| 04 - Visualization | 60 min | End on a high — everyone leaves with a beautiful chart. Two datasets in this episode: squad data for the categorical charts, FIFA rankings for the continuous ones. Do not suppress the missing-data warning on the first scatterplot; it is taught. |
| Wrap-up + homework brief | 15 min | Project the [homework page](../learners/homework.md) on the screen. Walk through the four-step assignment out loud. Tell participants the page URL is bookmarked under "For Learners → Homework brief" on the course site so they can open it on any device overnight. Emphasise: 30–60 minutes is enough, do not attempt R Markdown yet (that is Day 2). Bring the script to Day 2 open lab. |

### Session 2 (5-6 hours with breaks)

| Episode | Time | Notes |
|---|---|---|
| Review and troubleshooting | 30 min | Address questions from between-session practice |
| 05 - Statistical Analysis | 120 min | Core for survey researchers. The normality-testing section (histogram, Q-Q plot, Shapiro-Wilk, robustness note) maps directly onto the SPSS Explore output most participants will recognise. Take your time. |
| Break | 15 min | |
| 06 - Reproducible Reporting | 60 min | R Markdown is often the biggest "wow" for SPSS users. Ends with the squad-report capstone that Episode 1's opening teased. Participants pull `blue-wave-squad-report-template.Rmd` and `blue-wave-report.css` from the GitHub raw URL via the `download.file()` block in the episode; walk through the template's structure live once both files are in their working directory. Finish by changing `params$team` from `CUW-M` to `ARU-W` and re-knitting, so they see one file produce a different report. |
| Break | 15 min | |
| 07 - Where to Go from Here | 55 min | End with practical next steps. The new UA datasets subsection (CAS_election_data and island-research-reference-data) is a chance to live-demo `read.csv()` straight from a raw GitHub URL — most SPSS users have never seen data load over HTTPS without a manual download. |

## Per-episode scene transitions

Each episode opens with one atmospheric scene image at the top of the page (`fig/scene_1.jpg` through `scene_7.jpg`) and a one-line quip caption. The captions do most of the work; instructors who prefer to start straight from the first heading should feel free to. For instructors who want a single-beat acknowledgment when arriving at each new episode, the lines below match the captions in tone and feed naturally into the episode's opening content. They are optional.

| Ep | Caption on page | Optional transition line |
|---|---|---|
| 1 | One road costs you a license fee. The other one costs you a learning curve. | (Episode 1 opens with the workshop's full opening sequence; no separate transition needed.) |
| 2 | The iguana is optional. The coconut water is not. | "We're at the bar, R is open, the iguana is doing iguana things. Time to type something." |
| 3 | You can't cook without ingredients. You can't wrangle without verbs. | "Three jars on the counter today: filter, select, mutate. Everything else in dplyr is a variation on those three." |
| 4 | SPSS gives you a chart. ggplot2 gives you a language. | "ggplot is grammar, not buttons. By the end of this episode you'll be writing sentences." |
| 5 | Same tests, fewer menus, more crabs. | "The tests you know from SPSS — t-test, ANOVA, chi-square, regression — are all here. The crabs are the new part. Trust the crabs." |
| 6 | Your supervisor changed the sample. Again. Good thing you only need one button. | "This is the moment R Markdown earns the price of admission. One button, new data in, finished document out." |
| 7 | You learned the basics. The map has a lot more islands. | "The basics are behind you. The next forty-five minutes are about where to go from here, with islands marked for you to chart." |

Pick one beat, deliver it, move into the page's first heading. Do not stack a second sentence on top.

## Common Issues

- **Installation problems**: The pre-course installation clinic should catch
  most of these. Have a USB drive with R and RStudio installers as backup.
- **Typos**: SPSS users are not used to typing commands. Expect many syntax
  errors. Normalize this — "error messages are how R talks to you."
- **Parentheses and quotes**: The most common beginner errors. Show how RStudio
  auto-completes these.
- **Loading packages**: Participants will forget `library()`. Remind them at
  the start of each episode.

## Local Data Notes

The course uses Dutch Caribbean datasets to keep examples relevant. Everything
learners compute on is generated by `scripts/00_build_teaching_data.R` from
verified sources and committed to `episodes/data/`. Nothing is scraped live in
the room.

- **blue_wave_squad.csv** — player-level squad lists for the four ABC island
  national teams, 2026. Primary teaching dataset, Episodes 2 to 4 and 6. Also
  shipped as `.xlsx` (two sheets) and `.sav` for the import demonstrations.
  Compiled for Cornerstone Economics working paper WP-2026-01; coding decisions
  are documented in `episodes/data/curacao_squad_codebook.md`.
- **fifa_rankings.csv** — FIFA rank and points against population and diaspora
  for 211 national associations. Continuous variables for Episodes 4 and 5.
- **diaspora_change.csv** — diaspora stock in 1990, 2010, and 2024. Supplies the
  paired t-test in Episode 5.
- **island-research-reference-data** — country reference list with SIDS, SNIJ,
  and World Bank classifications, pulled live from GitHub in Episode 1 and
  Episode 7. Offline fallback committed at `episodes/data/countries_backup.csv`.
- **CAS_election_data** — Aruba, Curacao, Sint Maarten election results
  1985-2025. Used in Episode 7.
- World Bank indicators via `WDI` (Episode 7) and CBS Netherlands via
  `cbsodataR` (Episode 7).

Regenerate the derived files with `Rscript scripts/00_build_teaching_data.R` from
the repository root. Test all live downloads before the course; URLs and APIs
change.

### The squad data is unusually honest, and that is the point

Ten of 103 players cannot be placed at a club, 22 have an unknown position, and
every row carries a confidence code. Episodes 3, 5, and 6 each stop to name what
is being excluded and what it costs. Do not tidy this away or apologise for it.
Most participants have never been shown what to do with a gap other than delete
it, and this is the most transferable thing in the two days.

### Note on the elections example

The Episode 7 election-data example summarises fragmentation across all parties
in each Curacao election rather than singling out any one party. In a room that
may contain civil servants and ministry staff, filtering on a single party name
reads as partisan even when it is not meant to. If extending the example live,
default to all-parties views. If a participant asks why, this is a small
editorial choice that protects the course and the network's neutrality, and it
is worth naming briefly.

### Note on the Papiamentu example

The Episode 7 text-analysis sample is written in Curacao orthography, not the
Aruban etymological standard used in the master course. The accompanying callout
uses the difference to make a point about stopword lists being analytical
choices. If someone in the room raises the orthography question, that is a good
outcome, not a derailment.

## Train-the-Trainer

This course is designed for replication. If you are adapting it for another
island or institution:
1. Replace datasets with locally relevant equivalents
2. Adjust the SPSS operations covered based on your pre-course survey results
3. Keep the "wow first, skills second" structure
4. All materials are CC-BY 4.0 — please attribute the DCDC Network
