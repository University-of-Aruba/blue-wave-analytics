# Blue Wave squad dataset — codebook

**Iteration:** 2
**Compiled:** 23 August 2026
**Built by:** `scripts/00_build_teaching_data.R`
**Licence:** CC-BY-SA 4.0, inherited from Wikipedia

## What this is

Player-level squad lists for the four Dutch Caribbean national football teams
that have current squads on Wikipedia: Curaçao men and women, Aruba men and
women. One row is one player. 94 rows.

It exists to teach R, not to support research. It is a snapshot of four squad
tables on one day, and it should not be cited as a measure of anything.

## Where it comes from

Scraped from the "Current squad" table of four English Wikipedia articles:

- `Curaçao national football team`
- `Curaçao women's national football team`
- `Aruba national football team`
- `Aruba women's national football team`

Wikipedia squad tables carry the club's country only as a flag image beside the
club name, so `club_country` is read out of the flag filename and mapped to an
ISO3 code with `countrycode`. England, Scotland, Wales, and Northern Ireland are
mapped to `GBR`; Kosovo to `XKX`.

The pages are edited continuously and squads change with every international
window. Re-running the build script will produce different numbers, and the
episode prose quotes specific figures, so re-read the episodes after you re-run
it.

## Variables

| Variable | Values | Notes |
|----------|--------|-------|
| `team_code` | `CUW-M`, `CUW-W`, `ARU-M`, `ARU-W` | Island and squad |
| `player_name` | Text | As printed on Wikipedia |
| `position` | `GK`, `DEF`, `MID`, `FWD` | From the `Pos.` column |
| `club` | Club name, or `unknown` | As printed |
| `club_country` | ISO3 code, or `X` | `X` means the club could not be established |

Everything else the episodes use is derived in the episodes themselves, on
purpose, because deriving it is the lesson: `island` and `gender` from
`team_code`, `based_abroad` from `club_country`, and `region` from a
`case_when()` over `club_country`.

## What the data looks like as of 23 August 2026

94 players across four squads: Curaçao men 26, Curaçao women 22, Aruba men 23,
Aruba women 23.

Fourteen club countries are represented. The Netherlands accounts for 54 of the
94 players. Aruba-based clubs account for 9, Curaçao-based clubs for 7.

Two players, both in the Aruba women's squad, have no club listed and carry
`club_country == "X"`. They are kept rather than dropped, and Episodes 3, 5, and
6 each stop to say what excluding them would cost.

The teaching contrast is dispersion rather than a simple home-versus-abroad
split. Every one of the 26 players in the Curaçao men's squad plays club
football off the island, spread across 10 countries, with only 38 percent of
them in the Netherlands. The Aruba men's squad is also mostly abroad, 20 of 23,
but concentrated: 4 countries, and 78 percent of them in the Netherlands.

## Known limitations

Wikipedia squad tables are maintained by volunteers and lag real call-ups. A
"current squad" may be several months old, and the four pages are not
necessarily current as of the same date. Clubs are sometimes out of date after a
transfer window. None of this matters for teaching R and all of it would matter
for research.

## What this replaced

Iteration 1 used a hand-coded research dataset compiled for Cornerstone
Economics working paper WP-2026-01, which carried league tier and per-row
source-confidence codes. It was removed on 23 August 2026 because CE research
data does not belong in a DCDC training repository in the University of Aruba
organisation. See `DATA-PROVENANCE.md` in the repository root.

The two datasets do not agree, and the disagreement is instructive. The CE file
recorded 14 of 26 Aruba men in the domestic Aruban league; the Wikipedia current
squad has 3 of 23. They are different squad snapshots drawn from different
sources, and the island contrast that looked strong in one is much weaker in the
other. Anyone tempted to read a finding out of either should start there.
