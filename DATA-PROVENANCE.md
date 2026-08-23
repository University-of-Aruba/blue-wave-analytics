# Data provenance and licensing

The lesson and the data in this repository have different owners. This file says
which is which, because a single repository licence would blur them.

## The lesson

The seven episodes, the instructor and learner pages, the build scripts, and the
site are training material of the **Dutch Caribbean Digital Competence Network
(DCDC)**, authored by Rendell de Kort. They are released under **CC-BY 4.0** for
the instructional text and **MIT** for the code, as recorded in `LICENSE.md`.

This edition sits under the concept DOI
[10.5281/zenodo.20057762](https://doi.org/10.5281/zenodo.20057762), which covers
*Introduction to R for SPSS Users* and each island edition beneath it.

## The squad dataset

`curacao_squad_raw.csv`, `curacao_squad_codebook.md`, and everything derived from
them (`blue_wave_squad.csv`, `.xlsx`, `.sav`) are **not DCDC or University of
Aruba data**.

They were compiled by **Cornerstone Economics** as the research dataset behind
working paper WP-2026-01 on diaspora football economies in the ABC islands.
Cornerstone Economics holds them. They appear here because the author of the
lesson is also the author of the working paper and has licensed them for
teaching use; they are not a network output and should not be cited as one.

Cite the data as:

> de Kort, R. (2026). *ABC islands diaspora squad dataset* (iteration 1).
> Cornerstone Economics. Compiled for working paper WP-2026-01.

Cite the lesson separately, using `CITATION.cff`.

### What the dataset is, and what it is not

One row is one player called up to one of four 2026 national squads: Curaçao men
and women, Aruba men and women. Sources are federation announcements, Wikipedia
squad tables, and commercial football databases, and every row carries a
confidence code recording how well it is sourced. Ten players could not be placed
at a club at all. The coding decisions are written down in
`episodes/data/curacao_squad_codebook.md`.

It is a snapshot of squad composition at one moment. It is not a measure of a
football system, and it says nothing about youth development, coaching, or the
domestic game.

## Third-party data

- `fifa_global_panel.csv`, `fifa_rankings.csv` — FIFA world ranking points and
  positions, joined to UN DESA population estimates. Assembled for WP-2026-01
  from public sources.
- `diaspora_global.csv`, `diaspora_change.csv` — UN DESA international migrant
  stock by country of origin, 1990, 2010, and 2024.
- `countries_backup.csv` — offline copy of the University of Aruba
  `island-research-reference-data` country reference list, which is UA data and
  carries its own licence in its own repository.

## If you are reusing this lesson

Take the episodes and the structure freely under CC-BY. If you are adapting the
course for another island, the intended move is to **replace the dataset with a
locally relevant one** rather than reuse this one, which is the rule the
three-island rollout was built on. If you do want to reuse the squad data itself,
contact Cornerstone Economics.
