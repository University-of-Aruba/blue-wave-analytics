---
title: 'Instructor Notes'
---

## General Teaching Approach

This course follows the Carpentries live-coding pedagogy: the instructor types
code live while participants follow along. Avoid slides for code; always
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
| 01 - The Case for Switching | 35 min | Instructor demo only, no participant coding. Demo is the UA SIDS reference-list pull from `island-research-reference-data` (see Episode 1 instructor block). Second half of the demo loads the squad data and counts where the Curacao men's squad plays; that half needs no network and is the one to protect. Also shows the squad-report capstone HTML as the Friday target, rendered at `episodes/files/blue-wave-squad-report.html` and sourced at `episodes/files/blue-wave-squad-report-template.Rmd`. |
| Break | 15 min | |
| 02 - Your First R Session | 65 min | First hands-on. Go slow. Many will struggle with typos. The "Before you import" subsection is a deliberate whole-room synchronized moment: project the download links on the screen, wait for green stickies in the Files pane before typing `read_csv()`. |
| Break | 15 min | |
| 03 - Data Manipulation | 60 min | The pipe operator is the key "aha" moment |
| Break | 15 min | |
| 04 - Visualization | 35 min | End on a high, everyone leaves with a beautiful chart. Two datasets in this episode: squad data for the categorical charts, FIFA rankings for the continuous ones. Do not suppress the missing-data warning on the first scatterplot; it is taught. |
| Wrap-up + homework brief | 10 min | Project the [homework page](../learners/homework.md) on the screen. Walk through the four-step assignment out loud. Tell participants the page URL is bookmarked under "For Learners → Homework brief" on the course site so they can open it on any device overnight. Emphasise: 30–60 minutes is enough, do not attempt R Markdown yet (that is Day 2). Bring the script to the Day 2 recap; there is no open lab in the four-hour format. |

### Session 2 (5-6 hours with breaks)

| Episode | Time | Notes |
|---|---|---|
| Review, homework and troubleshooting | 20 min | Address questions from between-session practice |
| 05 - Statistical Analysis | 95 min, split either side of the coffee break | Core for survey researchers. The normality-testing section (histogram, Q-Q plot, Shapiro-Wilk, robustness note) maps directly onto the SPSS Explore output most participants will recognise. Take your time. |
| Break | 15 min | |
| 06 - Reproducible Reporting | 50 min | R Markdown is often the biggest "wow" for SPSS users. Ends with the squad-report capstone that Episode 1's opening teased. Participants pull `blue-wave-squad-report-template.Rmd` and `blue-wave-report.css` from the GitHub raw URL via the `download.file()` block in the episode; walk through the template's structure live once both files are in their working directory. Finish by changing `params$team` from `CUW-M` to `ARU-W` and re-knitting, so they see one file produce a different report. |
| Break | 15 min | |
| 07 - Where to Go from Here | 40 min | End with practical next steps. The new UA datasets subsection (CAS_election_data and island-research-reference-data) is a chance to live-demo `read.csv()` straight from a raw GitHub URL, and most SPSS users have never seen data load over HTTPS without a manual download. |

## Per-episode scene transitions

The course carries a **series** of cartoons, not eight unrelated images. One
Curacaoan analyst runs through all of them, starting as a fan with a wall map on
the index page and finishing at the tiller of a boat heading out of the harbour.
The renders and full scene briefs are in `scene-briefs.md`.

This is a deliberate change from the Aruba course, where the images were
decoration and instructors were told to ignore them. Here you may point at them.
Use the callback in Episode 6 and again in Episode 7, where the payoff sits.

Each episode opens with its scene image and a one-line quip caption. The
captions carry most of it. The transition lines below are optional single beats
for instructors who want one on arriving at a new episode.

| Ep | Caption on page | Optional transition line |
|---|---|---|
| Index | Twenty-six players. Ten countries. One spreadsheet. | (Shown on the landing page and on the opening slide. No spoken line; let people read it while the room settles.) |
| 1 | One gate charges you every season. The other one only asks you to learn the way in. | (Episode 1 opens with the workshop's full opening sequence; no separate transition needed.) |
| 2 | The dominoes can wait. The console is blinking. | "Laptop open, console blinking, iguana unimpressed. Time to type something." |
| 3 | Nobody makes stoba without cleaning the karko first. | "Three jars on the counter today: filter, select, mutate. Everything else in dplyr is a variation on those three." |
| 4 | SPSS hands you a chart. ggplot2 hands you a grammar. | "Those are the Handelskade houses and they are also a bar chart. By the end of this episode you will be writing the sentence that draws them." |
| 5 | Sometimes the review says nothing happened. You report that too. | "The tests you know from SPSS are all here. What is new is that one of today's two comes back null, and we are going to report it anyway." |
| 6 | The squad changed overnight. Again. Good thing the report rebuilds itself. | "This is where R Markdown earns the price of admission. New squad in, finished document out, one button." |
| 7 | You have the basics. The map runs well past the harbour mouth. | "She started this course pinning photos to a wall map. She is leaving the harbour with a chart. That is roughly where you are too." |

Pick one beat, deliver it, move into the page's first heading. Do not stack a
second sentence on top.

## What the four-hour format costs

The course runs 09:00 to 13:00, which is 480 minutes of room time for 380
minutes of episodes. The overhead is welcome, recap, two breaks a day and the
two wrap-ups. Three things were cut to make it fit, and instructors should know
which:

The **open lab** on Day 2 is gone. Homework review moved into the 20-minute Day
2 recap, so protect that slot; it is now the only place a stuck participant gets
unstuck.

**Exercise time in Episodes 2, 3 and 4** took most of the reduction, roughly 25
minutes each. Episode 5 was left slightly long on purpose because it is the
hardest and it carries the null result.

The **Day 1 questions-and-consolidation block** is gone. Fold consolidation into
the end of each episode rather than saving it up.

## Common Issues

- **Installation problems**: The registration email asks participants to reply
  with any install error before the day, so most should arrive fixed. Have a USB
  drive with R and RStudio installers as backup.
- **Typos**: SPSS users are not used to typing commands. Expect many syntax
  errors. Normalize this: "error messages are how R talks to you."
- **Parentheses and quotes**: The most common beginner errors. Show how RStudio
  auto-completes these.
- **Loading packages**: Participants will forget `library()`. Remind them at
  the start of each episode.

## Local Data Notes

The course uses Dutch Caribbean datasets to keep examples relevant. Everything
learners compute on is generated by `scripts/00_build_teaching_data.R` from
verified sources and committed to `episodes/data/`. Nothing is scraped live in
the room.

- **blue_wave_squad.csv**, player-level squad lists for the four ABC island
  national teams, 94 players. Primary teaching dataset, Episodes 2 to 4 and 6.
  Also shipped as `.xlsx` (two sheets) and `.sav` for the import demonstrations.
  Scraped from Wikipedia current-squad tables by `scripts/00_build_teaching_data.R`;
  variable definitions and limitations are in
  `episodes/data/blue_wave_squad_codebook.md`.
- **fifa_rankings.csv**, FIFA rank and points against population and diaspora
  for 211 national associations. Continuous variables for Episodes 4 and 5.
- **diaspora_change.csv**, diaspora stock in 1990, 2010, and 2024. Supplies the
  paired t-test in Episode 5.
- **island-research-reference-data**, a country reference list with SIDS, SNIJ,
  and World Bank classifications, pulled live from GitHub in Episode 1 and
  Episode 7. Offline fallback committed at `episodes/data/countries_backup.csv`.
- **CAS_election_data**, Aruba, Curacao, Sint Maarten election results
  1985-2025. Used in Episode 7.
- World Bank indicators via `WDI` (Episode 7) and CBS Netherlands via
  `cbsodataR` (Episode 7).

Regenerate the derived files with `Rscript scripts/00_build_teaching_data.R` from
the repository root. Test all live downloads before the course; URLs and APIs
change.

### The gaps in the squad data are the point

Two of 94 players cannot be placed at a club, and the squads are only as current
as Wikipedia. Episodes 3, 5, and 6 each stop to name what is being excluded and
what it costs. Do not tidy this away or apologise for it. Most participants have
never been shown what to do with a gap other than delete it, and this is the most
transferable thing in the two days.

Two is a small number, and that is deliberate rather than unfortunate. The habit
of reporting exclusions is easiest to build when the exclusion changes nothing.

### The island comparison does not work, and Episode 5 uses that

Testing whether Curaçao and Aruba differ on players-based-abroad returns a
p-value around 0.64. Testing men against women returns 0.006. Episode 5 runs both
in that order on purpose: the first thing you try fails, the second works, and
the write-up has to admit both. Do not skip to the one that works.

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
4. All materials are CC-BY 4.0, so please attribute the DCDC Network
