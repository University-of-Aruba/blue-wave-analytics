# Data provenance and licensing

Everything in this repository is either the lesson itself or public data. There
is no Cornerstone Economics research data here. This file records what came from
where, and what was deliberately removed.

## The lesson

The seven episodes, the instructor and learner pages, the build scripts, and the
site are training material of the **Dutch Caribbean Digital Competence Network
(DCDC)**, authored by Rendell de Kort. Instructional text is **CC-BY 4.0** and
code is **MIT**, as recorded in `LICENSE.md`.

This edition sits under the concept DOI
[10.5281/zenodo.20057762](https://doi.org/10.5281/zenodo.20057762), which covers
*Introduction to R for SPSS Users* and each island edition beneath it.

## The squad dataset

`blue_wave_squad.csv` and the `.xlsx` and `.sav` versions of it are built by
`scripts/00_build_teaching_data.R` from the "Current squad" tables of four
English Wikipedia articles, covering the Curaçao and Aruba men's and women's
national teams. Wikipedia text is **CC-BY-SA 4.0** and the derived dataset
inherits that licence.

Coding decisions, variable definitions, and known limitations are in
`episodes/data/blue_wave_squad_codebook.md`.

## Third-party data

- `fifa_global_panel.csv` and `fifa_rankings.csv` carry FIFA world ranking points
  and positions joined to UN DESA population estimates. Published statistics,
  tabulated into a CSV.
- `diaspora_global.csv` and `diaspora_change.csv` carry UN DESA international
  migrant stock by country of origin for 1990, 2010 and 2024. Published statistics.
- `countries_backup.csv` is an offline copy of the University of Aruba
  `island-research-reference-data` country reference list, which is UA data and
  carries its own licence in its own repository.

## What was removed, and why

Until 23 August 2026 the teaching dataset was `curacao_squad_raw.csv`, a
hand-coded research file compiled for **Cornerstone Economics** working paper
WP-2026-01 on diaspora football economies. It was richer than what replaced it:
it carried league tier and a per-row source-confidence code.

It was removed because it did not belong here. Cornerstone Economics is a
commercial consultancy; this is a DCDC training repository in the University of
Aruba organisation. Publishing CE research data under the university's name
blurs who owns it and mixes a commercial portfolio into network-funded work,
which is a conflict of interest whatever the intent. The fact that the author of
the working paper and the author of the lesson are the same person makes the
mixing easier to do and no more appropriate.

The replacement is public, reproducible from a committed script, and licensed
for reuse. Anyone adapting this course for another island should replace the
dataset again rather than reuse this one, which is the rule the three-island
rollout was built on.

## If you want the research data

The WP-2026-01 squad dataset is Cornerstone Economics'. Contact them.
