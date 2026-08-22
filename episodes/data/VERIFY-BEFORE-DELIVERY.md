# Data verification status

Two classes of file sit in this folder. Know which is which before you teach.

## Verified, safe to teach

These come from the research data behind Cornerstone Economics working paper
WP-2026-01 and were checked against named sources during that work. The coding
decisions are written down in `curacao_squad_codebook.md`.

- `curacao_squad_raw.csv` — the four ABC island national squads, player level
- `blue_wave_squad.csv` — the taught version, notes column removed
- `blue_wave_squad.xlsx`, `blue_wave_squad.sav` — same data, other formats
- `fifa_global_panel.csv`, `fifa_rankings.csv` — FIFA rank, population, diaspora
- `diaspora_panel.csv` — diaspora ratios for the ABC islands
- `countries_backup.csv` — offline fallback for the episode 1 live pull

Regenerate the derived files with `Rscript scripts/00_build_teaching_data.R`.

## Not verified, do not teach from it yet

`curacao_qualifiers_TEMPLATE.csv` is a shape, not a dataset. It carries the
column names for the CONCACAF qualifying campaign and six empty rows, because
the match-by-match record was not available on disk when the course was built
and nobody should teach from scorelines that were guessed.

Someone has to fill it in from a source they can name: the CONCACAF match
centre, the FFK record, or `worldfootballR`. When it is filled and checked,
save it as `curacao_qualifiers.csv` and note the source and the date here.
Until then the qualifying run is the story the course tells out loud and the
squad data is what learners actually compute on, so nothing breaks if this
file stays empty.

**Owner:** Rendell de Kort, with Marjorie Alfonso.
**Status as of 22 August 2026:** empty, unassigned.
