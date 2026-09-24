---
title: Setup
---

You need to install R and RStudio **before the first session on Wednesday 23 September**.
Both are free. Follow the instructions below for your operating system.

::::::::::::::::::::::::::::::::::::::: callout

### Using a work-issued laptop? Check with IT first

Many universities and employers lock their laptops so that users cannot install
software themselves. If your laptop was issued by an institution, check with
your IT department before following the steps below, otherwise the installer
will simply fail.

**University of Curacao laptops** require a ticket through the IT helpdesk.
When you submit the ticket, explicitly ask IT to install **both R and RStudio**.
Asking for only one of them is a common cause of a half-working setup that
wastes course time.

Give IT at least a week to process the request so your laptop is ready before
the first session. The course runs on **Wednesday 23 and Friday 25 September**,
so a ticket raised after 16 September is unlikely to be resolved in time.

:::::::::::::::::::::::::::::::::::::::::::::::::::

## If installation fails

We will not spend course time on installation troubleshooting, so please
arrive with everything working. Follow the instructions below and test your
setup by opening RStudio and typing `1 + 1` in the console. If it returns `2`,
you are ready.

If something fails, do not spend your evening fighting it. Reply to your
registration confirmation email with the error message and we will sort it
before the day.

## Software Setup

::::::::::::::::::::::::::::::::::::::: discussion

### Install R and RStudio

You need both R (the language) and RStudio (the interface). Think of R as the
engine and RStudio as the dashboard. You will work in RStudio, and it needs R
installed to run.

:::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::: spoiler

### Windows

1. Download R from [CRAN](https://cran.r-project.org/bin/windows/base/). Click
   "Download R for Windows", then "base", then the download link.
2. Run the installer with default settings.
3. Download RStudio from
   [Posit](https://posit.co/download/rstudio-desktop/) and click "Download
   RStudio Desktop".
4. Run the RStudio installer with default settings.
5. Open RStudio. If you see a console panel with the R version number, you are
   ready.

::::::::::::::::::::::::

:::::::::::::::: spoiler

### macOS

1. Download R from [CRAN](https://cran.r-project.org/bin/macosx/). Choose the
   `.pkg` file that matches your Mac (Apple Silicon or Intel).
2. Open the `.pkg` file and follow the installer.
3. Download RStudio from
   [Posit](https://posit.co/download/rstudio-desktop/).
4. Drag RStudio to your Applications folder.
5. Open RStudio. If you see a console panel with the R version number, you are
   ready.

::::::::::::::::::::::::

:::::::::::::::: spoiler

### Linux

1. Follow the instructions for your distribution at
   [CRAN](https://cran.r-project.org/bin/linux/).
2. Download RStudio from
   [Posit](https://posit.co/download/rstudio-desktop/). Choose the `.deb` or
   `.rpm` file for your distribution.
3. Install and open RStudio.

::::::::::::::::::::::::

## R Packages

During the course, we will install packages together. If you want to get ahead,
open RStudio and run this command in the console:

```r
install.packages(c("tidyverse", "haven", "readxl", "rmarkdown", "broom", "islandcodes"))
```

- **tidyverse** includes dplyr (data manipulation), ggplot2 (visualization),
  readr (reading data), and more
- **haven** reads SPSS `.sav` files directly into R
- **readxl** reads Excel workbooks, including individual sheets
- **rmarkdown** creates reproducible reports
- **broom** turns model output into a tidy table (Episode 5)
- **islandcodes** keeps the Dutch Caribbean islands separable in
  country-classification joins (Episode 7)

This matters most if you are on a managed or lab machine. Installing packages
mid-course is where locked-down laptops fail, and it fails quietly. Getting
these in beforehand removes the most common way a session goes wrong.

## Verify your setup

Open RStudio and paste this into the console:

```r
library(tidyverse)
ggplot(mpg, aes(x = displ, y = hwy)) + geom_point()
```

If a scatter plot appears in the Plots pane, everything is working. If you see
an error instead, reply to your registration email with the message.

## Download the workshop data

From Episode 2 onwards you will load the same small dataset in three different
formats: a CSV file, an Excel workbook with two sheets, and an SPSS `.sav` file.
Download **all three** now and keep them together.

- [blue_wave_squad.csv](https://github.com/University-of-Aruba/blue-wave-analytics/blob/main/episodes/data/blue_wave_squad.csv) plain-text version, one flat table of 94 rows
- [blue_wave_squad.xlsx](https://github.com/University-of-Aruba/blue-wave-analytics/raw/main/episodes/data/blue_wave_squad.xlsx) Excel version, two sheets: `curacao` and `aruba`
- [blue_wave_squad.sav](https://github.com/University-of-Aruba/blue-wave-analytics/raw/main/episodes/data/blue_wave_squad.sav) SPSS version, so you can see R open your existing files

Three more files are used later in the course. Grab them at the same time:

- [fifa_rankings.csv](https://github.com/University-of-Aruba/blue-wave-analytics/blob/main/episodes/data/fifa_rankings.csv) FIFA rank, population, and diaspora for 211 national associations
- [diaspora_change.csv](https://github.com/University-of-Aruba/blue-wave-analytics/blob/main/episodes/data/diaspora_change.csv) diaspora size in 1990, 2010, and 2024
- [blue_wave_squad_2026-09.csv](https://github.com/University-of-Aruba/blue-wave-analytics/blob/main/episodes/data/blue_wave_squad_2026-09.csv) the September 2026 call-up, for the second day

Open each link in your browser, then click the **Download raw file** button near
the top right of the preview and save the file. Do not open the CSV in Excel and
re-save. That can silently change the encoding, and it will mangle the c-cedilla
in Curacao in a way that causes a confusing error two episodes later.

Check the six files in your Downloads folder before you go further. They must
keep their own names and their own extensions, `.csv`, `.xlsx` and `.sav`. Some
browsers save every download from the same page under one name, or add `(1)` and
`(2)`, and a file saved as `blue_wave_squad(2).csv` will not be found by code
asking for `blue_wave_squad.csv`. Rename them now rather than in the room.

### Where to put the files

Create a folder for the workshop, for example `Documents/blue-wave/`, and inside
it create a subfolder called `data`. Drop all six files into `data`. Your
structure should look like this:

```
blue-wave/
└── data/
    ├── blue_wave_squad.csv
    ├── blue_wave_squad.xlsx
    ├── blue_wave_squad.sav
    ├── fifa_rankings.csv
    ├── diaspora_change.csv
    └── blue_wave_squad_2026-09.csv
```

Then tell R where that folder is. The reliable way is **Session > Set Working
Directory > Choose Directory**, and pick `blue-wave` itself, **not** the `data`
folder inside it. The lesson code says `read_csv("data/blue_wave_squad.csv")`,
so R has to be standing one level above `data` for that path to make sense. If
you point it at `data`, every path in the course is wrong by one folder.

Check it from the console before the course starts:

```r
getwd()             # should end in blue-wave
list.files("data")  # should list your six files
```

If `list.files("data")` prints `character(0)`, R is looking in the wrong place.

If none of this works on the day, nothing is lost. Every dataset can also be
read straight from the web, with no download and no working directory at all:

```r
library(tidyverse)
base <- "https://raw.githubusercontent.com/University-of-Aruba/blue-wave-analytics/main/episodes/data/"
squad <- read_csv(paste0(base, "blue_wave_squad.csv"))
nrow(squad)  # 94
```

## What the data is

The squad file lists the players in the squads of four Dutch Caribbean national
football teams: Curacao men and women, Aruba men and women. One row is one
player, with their position, their club, and the country that club plays in. 94
rows in total. The Curacao men in it are the squad that went to the World Cup.
The September file holds the call-up that came after, and on the second day you
will see what changes when you point the same analysis at it.

It is scraped from Wikipedia. Two players have no club listed at all, and the squads are only as current
as the volunteers who maintain those pages. Those gaps are part of what you will
learn to handle.
