# Blue Wave squad dataset: codebook

**Iteration:** 3
**Compiled:** 23 August 2026 (World Cup snapshot), 12 September 2026 (September call-up)
**Built by:** `scripts/00_build_teaching_data.R`
**Licence:** CC-BY-SA 4.0, inherited from Wikipedia

## What this is

Player-level squad lists for the four Dutch Caribbean national football teams
that have squads on Wikipedia: Curaçao men and women, Aruba men and women. One
row is one player. Two files, same five columns:

- `blue_wave_squad.csv`, 94 rows. The **World Cup snapshot**: Curaçao's men are
  the 26 who went to the 2026 World Cup. The episodes are written against this
  file and quote its figures. The `.xlsx` and `.sav` versions carry the same rows.
- `blue_wave_squad_2026-09.csv`, 91 rows. The **September call-up** for the
  Nations League window, named on 11 September 2026. Episode 6 points the
  capstone report at it to show a report rewriting itself on new data.

They exist to teach R, not to support research. Each is a snapshot of four squad
tables at one moment, and neither should be cited as a measure of anything.

## Where it comes from

Scraped from the squad table of four English Wikipedia articles:

- `Curaçao national football team`
- `Curaçao women's national football team`
- `Aruba national football team`
- `Aruba women's national football team`

Each snapshot is **pinned to a page revision ID**, listed in the `snapshots`
table in the build script, so re-running the script rebuilds the same file
rather than whatever the pages say that day. The World Cup revisions reproduce
the original 23 August build exactly.

Wikipedia squad tables carry the club's country only as a flag image beside the
club name, so `club_country` is read out of the flag filename and mapped to an
ISO3 code with `countrycode`. England, Scotland, Wales, and Northern Ireland are
mapped to `GBR`; Kosovo to `XKX`. Captaincy marks that some pages print inside
the name cell are stripped, since a role is not part of a name and one page
dropped the mark between revisions.

Where a pinned revision lagged a documented move, the build script applies a
correction in code and records its source in the `corrections` table. The
September file carries three: Kiyani Zeggen's first name (the page had
"Tiyani"), Ar'jany Martha at Telstar on loan (the page still had Rotherham
United), and Jürgen Locadia at Tampa Bay Rowdies (the page still had Miami FC).
Positions are left as Wikipedia gives them, even where the federation's list
differs.

## Variables

| Variable | Values | Notes |
|----------|--------|-------|
| `team_code` | `CUW-M`, `CUW-W`, `ARU-M`, `ARU-W` | Island and squad |
| `player_name` | Text | As printed on Wikipedia, captaincy marks removed |
| `position` | `GK`, `DEF`, `MID`, `FWD` | From the `Pos.` column |
| `club` | Club name, or `unknown` | As printed |
| `club_country` | ISO3 code, or `X` | `X` means the club could not be established |

Everything else the episodes use is derived in the episodes themselves, on
purpose, because deriving it is the lesson: `island` and `gender` from
`team_code`, `based_abroad` from `club_country`, and `region` from a
`case_when()` over `club_country`.

## The World Cup snapshot

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

## The September call-up

Only the Curaçao men's squad changed in substance. Eight of the World Cup 26 are
out and five players are in, so the squad is 23. Two players who stayed have
moved clubs since the World Cup file was taken, and one Aruba man, Gladwin
Curiel, is now listed at a club in Gibraltar rather than Kosovo.

Still none of the 23 plays club football on Curaçao. They are spread across 11
countries, and 7 of them, 30 percent, are in the Netherlands. The island
chi-square stays null (p = 0.74) and the gender chi-square stays significant
(p = 0.008), on 89 placeable players.

Two of the new club countries, Bosnia and Herzegovina (`BIH`) and Gibraltar
(`GIB`), are not in the European list of the `case_when()` in Episodes 1, 3 and
4, so that code files both under "Rest of world" without complaint. That is left
in place on purpose; Episode 6 uses it. The capstone template carries both codes
and prints whatever falls through to "Rest of world".

## Known limitations

Wikipedia squad tables are maintained by volunteers and lag real call-ups and
transfers. A page's squad may be several months old, and the four pages are not
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
