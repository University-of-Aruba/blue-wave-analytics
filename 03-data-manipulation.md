---
title: "Data Manipulation"
teaching: 60
exercises: 30
---

:::::::::::::::::::::::::::::::::::::: questions

- How do I filter, sort, and recode data in R the way I do in SPSS?
- What is the tidyverse and why does it matter?
- How do I create new variables from existing ones?

::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: objectives

- Filter rows, select columns, and sort data using dplyr
- Create new variables and recode existing ones
- Chain operations together using the pipe operator
- Recognize the SPSS menu equivalent for each operation

::::::::::::::::::::::::::::::::::::::::::::::::

![You can't cook without ingredients. You can't wrangle without verbs.](fig/scene_3.jpg){alt="Cartoon of a researcher as a Caribbean chef with jars labeled filter(), select(), and mutate(), cooking a pot of tidy data"}

## The tidyverse approach

In SPSS you manipulate data through menus: **Data > Select Cases**, **Data >
Sort Cases**, **Transform > Compute Variable**, and so on. In R the `dplyr`
package gives you a set of **verbs**, functions with plain-English names that do
exactly what they say.

The `dplyr` package is part of the **tidyverse**, which you already loaded in
the previous episode. If you are starting a fresh R session, load it now:


``` r
library(tidyverse)
```

``` output
── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
✔ dplyr     1.2.1     ✔ readr     2.2.0
✔ forcats   1.0.1     ✔ stringr   1.6.0
✔ ggplot2   4.0.3     ✔ tibble    3.3.1
✔ lubridate 1.9.5     ✔ tidyr     1.3.2
✔ purrr     1.2.2     
── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
✖ dplyr::filter() masks stats::filter()
✖ dplyr::lag()    masks stats::lag()
ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors
```

``` r
# Also load our dataset
squad <- read_csv("data/blue_wave_squad.csv")
```

``` output
Rows: 103 Columns: 7
── Column specification ────────────────────────────────────────────────────────
Delimiter: ","
chr (7): team_code, player_name, position, club, club_country, league_tier, ...

ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
```

::::::::::::::::::::::::::::::::::::: callout

## What is a dependency?

A package in R is a bundle of code that someone else wrote so you do not have
to. `tidyverse`, for example, is a collection of packages that work together for
data manipulation and visualisation. When you use `library(tidyverse)`, R loads
those packages into your session so their functions become available.

A dependency is a package that another package needs in order to work.
`tidyverse` depends on `dplyr`, `ggplot2`, `readr`, and several others. When you
run `install.packages("tidyverse")`, R automatically installs everything it
depends on too. You do not have to manage the chain manually.

Two things this means in practice. First, the first time you install a package
it can take a minute or two because R is pulling down the dependency chain. That
is normal. Second, when you share your script with a colleague and they get an
error like `there is no package called 'dplyr'`, the fix is almost always
`install.packages("tidyverse")`, not `install.packages("dplyr")`, because the
dependency lives inside the larger package.

We come back to this in Episode 6, reproducible reporting, where recording which
packages your script needs is part of making sure it still runs six months from
now.

::::::::::::::::::::::::::::::::::::::::::::::::

Here is the key idea: every SPSS menu operation you use for data manipulation
has a dplyr verb equivalent.

| SPSS menu path | dplyr verb | What it does |
|---|---|---|
| Data > Select Cases | `filter()` | Keep rows that match a condition |
| *(selecting columns in Variable View)* | `select()` | Keep or drop columns |
| Transform > Compute Variable | `mutate()` | Create or modify a column |
| Transform > Recode into Different Variables | `case_when()` | Assign values based on conditions |
| Data > Sort Cases | `arrange()` | Sort rows |
| Data > Split File + Aggregate | `group_by()` + `summarise()` | Calculate summaries by group |

Let us work through each one.

## `filter()`, Select Cases

In SPSS you would go to **Data > Select Cases**, click "If condition is
satisfied", and type a condition. In R:


``` r
curacao_men <- filter(squad, team_code == "CUW-M")
curacao_men
```

``` output
# A tibble: 32 × 7
   team_code player_name      position club  club_country league_tier confidence
   <chr>     <chr>            <chr>    <chr> <chr>        <chr>       <chr>     
 1 CUW-M     ArJany Martha    DEF      unkn… X            X           L         
 2 CUW-M     Armando Obispo   DEF      PSV … NLD          1           H         
 3 CUW-M     Cuco Martina     DEF      unkn… X            X           L         
 4 CUW-M     Deveron Fonville DEF      NEC … NLD          1           H         
 5 CUW-M     Joshua Brenet    DEF      Kays… TUR          1           H         
 6 CUW-M     Juriën Gaari     DEF      Abha  SAU          1           H         
 7 CUW-M     Riechedly Bazoer DEF      Kony… TUR          1           H         
 8 CUW-M     Roshon van Eijma DEF      RKC … NLD          1           H         
 9 CUW-M     Sherel Floranus  DEF      PEC … NLD          1           H         
10 CUW-M     Shurandy Sambo   DEF      Spar… NLD          1           H         
# ℹ 22 more rows
```

Notice the **double equals sign** `==`. This is how R tests equality. A single
`=` is for assigning values to function arguments, like `digits = 1`. A double
`==` asks "is this equal to?".

You can combine conditions. Listing them separated by commas means "and":


``` r
# Curaçao men who play in the Netherlands
cuw_nld <- filter(squad, team_code == "CUW-M", club_country == "NLD")
cuw_nld
```

``` output
# A tibble: 11 × 7
   team_code player_name      position club  club_country league_tier confidence
   <chr>     <chr>            <chr>    <chr> <chr>        <chr>       <chr>     
 1 CUW-M     Armando Obispo   DEF      PSV … NLD          1           H         
 2 CUW-M     Deveron Fonville DEF      NEC … NLD          1           H         
 3 CUW-M     Roshon van Eijma DEF      RKC … NLD          1           H         
 4 CUW-M     Sherel Floranus  DEF      PEC … NLD          1           H         
 5 CUW-M     Shurandy Sambo   DEF      Spar… NLD          1           H         
 6 CUW-M     Trevor Doornbus… GK       VVV-… NLD          2           H         
 7 CUW-M     Tyrick Bodak     GK       Tels… NLD          2           H         
 8 CUW-M     Godfried Roemer… MID      RKC … NLD          1           H         
 9 CUW-M     Juninho Bacuna   MID      FC V… NLD          2           H         
10 CUW-M     Kevin Felida     MID      FC D… NLD          2           H         
11 CUW-M     Tyrese Noslin    MID      Tels… NLD          2           H         
```


``` r
# Every player in the dataset based on one of the two islands
home_based <- filter(squad, club_country %in% c("CUW", "ABW"))
home_based
```

``` output
# A tibble: 30 × 7
   team_code player_name      position club  club_country league_tier confidence
   <chr>     <chr>            <chr>    <chr> <chr>        <chr>       <chr>     
 1 ARU-M     Gladwin Curiel   DEF      Arub… ABW          L           H         
 2 ARU-M     Jeremy Trimon    DEF      Arub… ABW          L           H         
 3 ARU-M     Kymani Nedd      DEF      Arub… ABW          L           H         
 4 ARU-M     Nickenson Paul   DEF      Arub… ABW          L           H         
 5 ARU-M     Javier Jiménez   FWD      Arub… ABW          L           H         
 6 ARU-M     Jayden Kruydenh… FWD      Arub… ABW          L           H         
 7 ARU-M     Jahmani Eisden   GK       Arub… ABW          L           H         
 8 ARU-M     Josthan Maduro   GK       Arub… ABW          L           H         
 9 ARU-M     Dimaggio Senchi  MID      Arub… ABW          L           H         
10 ARU-M     Gianni Vandepit… MID      Arub… ABW          L           H         
# ℹ 20 more rows
```

That last result is worth a pause. Run it and look at which team codes appear.

::::::::::::::::::::::::::::::::::::: callout

## Common comparison operators

| Operator | Meaning | Example |
|---|---|---|
| `==` | equal to | `position == "GK"` |
| `!=` | not equal to | `club_country != "NLD"` |
| `>` | greater than | `year > 2020` |
| `<` | less than | `age < 21` |
| `>=` | greater than or equal to | `year >= 2021` |
| `<=` | less than or equal to | `rank <= 100` |
| `%in%` | matches one of several values | `position %in% c("DEF", "MID")` |
| `!` | not | `!is.na(club)` |

::::::::::::::::::::::::::::::::::::::::::::::::

## `select()`, keep or drop columns

Sometimes your dataset has more columns than you need. In SPSS you might delete
variables or simply ignore them. In R, `select()` lets you keep only the columns
you want:


``` r
slim <- select(squad, team_code, player_name, position, club_country)
head(slim)
```

``` output
# A tibble: 6 × 4
  team_code player_name       position club_country
  <chr>     <chr>             <chr>    <chr>       
1 ARU-M     Bradley Martis    DEF      NLD         
2 ARU-M     Darryl Bäly       DEF      NLD         
3 ARU-M     Diederick Luydens DEF      NLD         
4 ARU-M     Gladwin Curiel    DEF      ABW         
5 ARU-M     Jeremy Trimon     DEF      ABW         
6 ARU-M     Kymani Nedd       DEF      ABW         
```

You can also drop columns by putting a minus sign in front:


``` r
no_confidence <- select(squad, -confidence)
head(no_confidence)
```

``` output
# A tibble: 6 × 6
  team_code player_name       position club             club_country league_tier
  <chr>     <chr>             <chr>    <chr>            <chr>        <chr>      
1 ARU-M     Bradley Martis    DEF      IJsselmeervogels NLD          3          
2 ARU-M     Darryl Bäly       DEF      OFC Oostzaan     NLD          3          
3 ARU-M     Diederick Luydens DEF      Jong Sparta Rot… NLD          R          
4 ARU-M     Gladwin Curiel    DEF      Aruba (local cl… ABW          L          
5 ARU-M     Jeremy Trimon     DEF      Aruba (local cl… ABW          L          
6 ARU-M     Kymani Nedd       DEF      Aruba (local cl… ABW          L          
```

## `mutate()`, Compute Variable

In SPSS: **Transform > Compute Variable**. You would type a target variable
name, then an expression. In R, `mutate()` creates a new column, or modifies an
existing one.

Our dataset codes the team as a single string like `CUW-M`. That is compact for
storage and useless for analysis. Let us split it into the two things it
actually encodes:


``` r
squad <- mutate(squad,
  island = if_else(str_starts(team_code, "CUW"), "Curaçao", "Aruba"),
  gender = if_else(str_ends(team_code, "M"), "Men", "Women")
)
head(select(squad, team_code, island, gender, player_name))
```

``` output
# A tibble: 6 × 4
  team_code island gender player_name      
  <chr>     <chr>  <chr>  <chr>            
1 ARU-M     Aruba  Men    Bradley Martis   
2 ARU-M     Aruba  Men    Darryl Bäly      
3 ARU-M     Aruba  Men    Diederick Luydens
4 ARU-M     Aruba  Men    Gladwin Curiel   
5 ARU-M     Aruba  Men    Jeremy Trimon    
6 ARU-M     Aruba  Men    Kymani Nedd      
```

`if_else()` takes a condition, a value to use when it is true, and a value to
use when it is false. It is the R equivalent of an SPSS `IF` transformation.

You can create multiple columns at once, and a logical column is often the most
useful thing you can make:


``` r
squad <- mutate(squad,
  based_abroad = !(club_country %in% c("CUW", "ABW", "X")),
  club_known   = club != "unknown"
)
head(select(squad, player_name, club_country, based_abroad, club_known))
```

``` output
# A tibble: 6 × 4
  player_name       club_country based_abroad club_known
  <chr>             <chr>        <lgl>        <lgl>     
1 Bradley Martis    NLD          TRUE         TRUE      
2 Darryl Bäly       NLD          TRUE         TRUE      
3 Diederick Luydens NLD          TRUE         TRUE      
4 Gladwin Curiel    ABW          FALSE        TRUE      
5 Jeremy Trimon     ABW          FALSE        TRUE      
6 Kymani Nedd       ABW          FALSE        TRUE      
```

::::::::::::::::::::::::::::::::::::: callout

## Why a TRUE/FALSE column is worth making

R treats `TRUE` as 1 and `FALSE` as 0. That means the **mean of a logical column
is a proportion**. Once you have `based_abroad`, the share of a squad playing
abroad is one call to `mean()`. No recoding into dummy variables, no counting by
hand. This trick will save you more time than almost anything else in this
episode.

::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: callout

## The decision we just buried in one line

Look again at how `based_abroad` was defined. A player whose `club_country` is
`X`, meaning nobody could establish where they play, is being recorded as
`FALSE`, not abroad. Nine players in the Curaçao men's pool are in that
position. Every share we calculate from this column is therefore a little lower
than the truth, and nothing in the output says so.

That is not a bug in R. It is an analytical choice, made in passing, that a
reader of your results would never see. The alternative is to say so explicitly:


``` r
squad <- mutate(squad,
  abroad_strict = if_else(club_country == "X", NA, !(club_country %in% c("CUW", "ABW")))
)

# Now R refuses to give you an answer that hides the gap
mean(squad$abroad_strict)
```

``` output
[1] NA
```

``` r
# You have to ask for it deliberately, and say how many you dropped
mean(squad$abroad_strict, na.rm = TRUE)
```

``` output
[1] 0.6774194
```

``` r
sum(is.na(squad$abroad_strict))
```

``` output
[1] 10
```

`NA` is R's marker for "missing". Most calculations return `NA` if any input is
missing, which feels obstructive until you realise it is R declining to invent a
number on your behalf. `na.rm = TRUE` overrides it, and you should reach for it
consciously and report what it removed.

We use the simpler `based_abroad` for the rest of this episode because it keeps
the code readable. Now you know what it costs.

::::::::::::::::::::::::::::::::::::::::::::::::

## `case_when()`, Recode into Different Variables

In SPSS: **Transform > Recode into Different Variables**, where you map old
values to new values. In R you use `case_when()` inside `mutate()`.

The `league_tier` column holds seven different codes. For most questions that is
too fine-grained. Let us collapse it:


``` r
squad <- mutate(squad,
  tier_group = case_when(
    league_tier %in% c("1", "2") ~ "European professional",
    league_tier == "3"           ~ "European amateur or lower",
    league_tier %in% c("R", "Y") ~ "Reserve or youth",
    league_tier == "L"           ~ "Island league",
    .default                     = "Unknown"
  )
)

table(squad$tier_group)
```

``` output

European amateur or lower     European professional             Island league 
                       22                        34                        30 
         Reserve or youth                   Unknown 
                        7                        10 
```

The syntax is `condition ~ value_to_assign`. The `.default` line catches
everything that did not match a previous condition, like the Else box in SPSS
Recode.

::::::::::::::::::::::::::::::::::::: callout

## Order matters, and Unknown is a category

`case_when()` works top to bottom and stops at the first match. If you put a
broad condition first, the narrower ones below it never fire.

Notice also that we sent `X` to "Unknown" rather than quietly dropping those
players. Ten of the men's squad entries have an unknown tier. Deleting them
would make every percentage you report afterwards slightly wrong and completely
untraceable. Keeping the category visible means the reader can see the size of
the gap and judge for themselves. Do this in your own work.

::::::::::::::::::::::::::::::::::::::::::::::::

## `arrange()`, Sort Cases

In SPSS: **Data > Sort Cases**. In R:


``` r
# Sort alphabetically by club (ascending is the default)
head(arrange(squad, club))
```

``` output
# A tibble: 6 × 13
  team_code player_name     position club    club_country league_tier confidence
  <chr>     <chr>           <chr>    <chr>   <chr>        <chr>       <chr>     
1 ARU-W     Aisse Gumbs     MID      AA Gent BEL          1           H         
2 ARU-W     Vanessa Susanna FWD      ADO De… NLD          1           H         
3 CUW-M     Juriën Gaari    DEF      Abha    SAU          1           H         
4 CUW-W     Jeleaugh Rosa   X        Acharn… GRC          1           H         
5 ARU-M     Gladwin Curiel  DEF      Aruba … ABW          L           H         
6 ARU-M     Jeremy Trimon   DEF      Aruba … ABW          L           H         
# ℹ 6 more variables: island <chr>, gender <chr>, based_abroad <lgl>,
#   club_known <lgl>, abroad_strict <lgl>, tier_group <chr>
```


``` r
# Sort descending with desc()
head(arrange(squad, desc(player_name)))
```

``` output
# A tibble: 6 × 13
  team_code player_name     position club    club_country league_tier confidence
  <chr>     <chr>           <chr>    <chr>   <chr>        <chr>       <chr>     
1 ARU-W     Zyana Rogers    FWD      SV Bri… ABW          L           M         
2 ARU-M     Walter Bennett  MID      Aruba … ABW          L           H         
3 ARU-W     Vanessa Susanna FWD      ADO De… NLD          1           H         
4 CUW-M     Tyrique Mercera DEF      unknown X            X           L         
5 CUW-M     Tyrick Bodak    GK       Telstar NLD          2           H         
6 CUW-M     Tyrese Noslin   MID      Telstar NLD          2           H         
# ℹ 6 more variables: island <chr>, gender <chr>, based_abroad <lgl>,
#   club_known <lgl>, abroad_strict <lgl>, tier_group <chr>
```


``` r
# Sort by multiple columns: team first, then position
head(arrange(squad, team_code, position), n = 10)
```

``` output
# A tibble: 10 × 13
   team_code player_name      position club  club_country league_tier confidence
   <chr>     <chr>            <chr>    <chr> <chr>        <chr>       <chr>     
 1 ARU-M     Bradley Martis   DEF      IJss… NLD          3           H         
 2 ARU-M     Darryl Bäly      DEF      OFC … NLD          3           H         
 3 ARU-M     Diederick Luyde… DEF      Jong… NLD          R           H         
 4 ARU-M     Gladwin Curiel   DEF      Arub… ABW          L           H         
 5 ARU-M     Jeremy Trimon    DEF      Arub… ABW          L           H         
 6 ARU-M     Kymani Nedd      DEF      Arub… ABW          L           H         
 7 ARU-M     Nickenson Paul   DEF      Arub… ABW          L           H         
 8 ARU-M     Rainey Breinburg DEF      Feye… NLD          Y           H         
 9 ARU-M     Carlito Fermina  FWD      Koza… NLD          3           H         
10 ARU-M     Conner van Kils… FWD      TOP … NLD          2           H         
# ℹ 6 more variables: island <chr>, gender <chr>, based_abroad <lgl>,
#   club_known <lgl>, abroad_strict <lgl>, tier_group <chr>
```

## `group_by()` and `summarise()`, Split File and Aggregate

This is one of the most powerful combinations in dplyr, and it replaces two SPSS
operations at once:

- **Data > Split File**, which tells SPSS to run analyses separately for each
  group
- **Data > Aggregate**, which calculates summary statistics by group


``` r
# Share of each squad playing club football off-island
abroad_by_team <- squad |>
  group_by(team_code) |>
  summarise(
    players      = n(),
    share_abroad = mean(based_abroad)
  )
abroad_by_team
```

``` output
# A tibble: 4 × 3
  team_code players share_abroad
  <chr>       <int>        <dbl>
1 ARU-M          26        0.462
2 ARU-W          23        0.652
3 CUW-M          32        0.719
4 CUW-W          22        0.591
```

There is the answer to the question Episode 1 opened with, in five lines.

Wait, what is that `|>` symbol? That is the **pipe operator**, and it deserves
its own section.

## The pipe operator `|>`

The pipe `|>` is one of the most important ideas in modern R. Read it as **"and
then"**. It takes the result of the expression on the left and passes it as the
first argument to the function on the right.

Without the pipe you would write:


``` r
# Nested style (hard to read)
summarise(group_by(filter(squad, gender == "Men"), island), share = mean(based_abroad))
```

That is like reading a sentence from the inside out. With the pipe the same code
becomes:


``` r
squad |>
  filter(gender == "Men") |>
  group_by(island) |>
  summarise(share = mean(based_abroad))
```

``` output
# A tibble: 2 × 2
  island  share
  <chr>   <dbl>
1 Aruba   0.462
2 Curaçao 0.719
```

Read this as: "Take `squad`, **and then** keep the men's squads, **and then**
group by island, **and then** summarise the share based abroad."

The pipe makes your code read from top to bottom, like a recipe. Each line is
one step.

::::::::::::::::::::::::::::::::::::: callout

## `|>` vs `%>%`

You may see `%>%` in older R code and tutorials. This is the original pipe
operator from the `magrittr` package. The native pipe `|>` was added to base R
in version 4.1 in 2021 and works without loading any packages. They behave
almost identically. We use `|>` in this course because it requires no extra
dependencies.

::::::::::::::::::::::::::::::::::::::::::::::::

### Building up a pipeline step by step

A good workflow is to build your pipeline one step at a time, checking the
result after each line. Let us work through an example.


``` r
# Step 1: Start with the data
squad |>
  filter(island == "Curaçao")
```

``` output
# A tibble: 54 × 13
   team_code player_name      position club  club_country league_tier confidence
   <chr>     <chr>            <chr>    <chr> <chr>        <chr>       <chr>     
 1 CUW-M     ArJany Martha    DEF      unkn… X            X           L         
 2 CUW-M     Armando Obispo   DEF      PSV … NLD          1           H         
 3 CUW-M     Cuco Martina     DEF      unkn… X            X           L         
 4 CUW-M     Deveron Fonville DEF      NEC … NLD          1           H         
 5 CUW-M     Joshua Brenet    DEF      Kays… TUR          1           H         
 6 CUW-M     Juriën Gaari     DEF      Abha  SAU          1           H         
 7 CUW-M     Riechedly Bazoer DEF      Kony… TUR          1           H         
 8 CUW-M     Roshon van Eijma DEF      RKC … NLD          1           H         
 9 CUW-M     Sherel Floranus  DEF      PEC … NLD          1           H         
10 CUW-M     Shurandy Sambo   DEF      Spar… NLD          1           H         
# ℹ 44 more rows
# ℹ 6 more variables: island <chr>, gender <chr>, based_abroad <lgl>,
#   club_known <lgl>, abroad_strict <lgl>, tier_group <chr>
```


``` r
# Step 2: Add a column selection
squad |>
  filter(island == "Curaçao") |>
  select(gender, player_name, position, club, tier_group)
```

``` output
# A tibble: 54 × 5
   gender player_name      position club             tier_group           
   <chr>  <chr>            <chr>    <chr>            <chr>                
 1 Men    ArJany Martha    DEF      unknown          Unknown              
 2 Men    Armando Obispo   DEF      PSV Eindhoven    European professional
 3 Men    Cuco Martina     DEF      unknown          Unknown              
 4 Men    Deveron Fonville DEF      NEC Nijmegen     European professional
 5 Men    Joshua Brenet    DEF      Kayserispor      European professional
 6 Men    Juriën Gaari     DEF      Abha             European professional
 7 Men    Riechedly Bazoer DEF      Konyaspor        European professional
 8 Men    Roshon van Eijma DEF      RKC Waalwijk     European professional
 9 Men    Sherel Floranus  DEF      PEC Zwolle       European professional
10 Men    Shurandy Sambo   DEF      Sparta Rotterdam European professional
# ℹ 44 more rows
```


``` r
# Step 3: Group and summarise
squad |>
  filter(island == "Curaçao") |>
  count(gender, tier_group) |>
  arrange(gender, desc(n))
```

``` output
# A tibble: 5 × 3
  gender tier_group                    n
  <chr>  <chr>                     <int>
1 Men    European professional        23
2 Men    Unknown                       9
3 Women  European amateur or lower     9
4 Women  Island league                 9
5 Women  European professional         4
```

This pipeline reads: "Take the squad data, keep the Curaçao players, count how
many fall in each combination of gender and tier group, then sort."

`count()` is a shortcut for `group_by()` followed by `summarise(n = n())`. You
will reach for it constantly.

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: instructor

## Teaching tips

- Write the pipe `|>` on the whiteboard and say "and then" out loud every time
  you use it. This mental model sticks.
- Build pipelines live, one step at a time. Run after each added line so
  participants can see how the output changes.
- The most common beginner mistake is putting `|>` at the start of a line
  instead of at the end of the previous line. Emphasise that the pipe goes at
  the **end** of the line, so R knows the expression continues.
- Compare nested function calls to piped code side by side. The readability
  advantage sells itself.
- The `mean()` of a logical is the single highest-leverage idea in this episode.
  SPSS users are trained to build dummy variables by hand. Show them the
  shortcut, then show them the SPSS way they would otherwise have used, and let
  the contrast do the work.
- The `filter(club_country %in% c("CUW", "ABW"))` result usually produces an
  audible reaction in a Curaçao room. Let it. Then say "we are not explaining
  that today, we are learning how to ask it."
- If someone asks why 22 players have position `X` and 10 have tier `X`, the
  honest answer is that the underlying sources are federation Facebook posts and
  Wikipedia squad tables, and the compiler recorded uncertainty rather than
  guessing. Point them to the codebook in the data folder. This is a good moment
  for a word about documenting your own uncertainty.

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: challenge

## Challenge 1: Where does the Curaçao men's squad play?

Using the `squad` dataset and the pipe operator, write a pipeline that:

1. Filters to the Curaçao men's squad
2. Counts players by `club_country`
3. Sorts from most to fewest

Save the result to an object called `cuw_countries` and print it. How many of
them play their club football on Curaçao?

:::::::::::::::::::::::: solution

## Solution


``` r
cuw_countries <- squad |>
  filter(team_code == "CUW-M") |>
  count(club_country, sort = TRUE)

cuw_countries
```

``` output
# A tibble: 10 × 2
   club_country     n
   <chr>        <int>
 1 NLD             11
 2 X                9
 3 TUR              3
 4 GBR              2
 5 USA              2
 6 CHE              1
 7 DEU              1
 8 GRC              1
 9 MYS              1
10 SAU              1
```

None. Not one player in the Curaçao men's pool plays club football on the
island. The Netherlands dominates, with a scatter of other European and North
American leagues, and a block of unknowns coded `X`.

:::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: challenge

## Challenge 2: The four-squad comparison

Write a pipeline that, for each of the four squads, reports the number of
players and the share based abroad, sorted from the highest share to the lowest.

Present the share as a rounded percentage rather than a decimal.

:::::::::::::::::::::::: solution

## Solution


``` r
squad |>
  group_by(island, gender) |>
  summarise(
    players   = n(),
    pct_abroad = round(100 * mean(based_abroad)),
    .groups = "drop"
  ) |>
  arrange(desc(pct_abroad))
```

``` output
# A tibble: 4 × 4
  island  gender players pct_abroad
  <chr>   <chr>    <int>      <dbl>
1 Curaçao Men         32         72
2 Aruba   Women       23         65
3 Curaçao Women       22         59
4 Aruba   Men         26         46
```

The ordering is the finding. The two islands are 80 kilometres apart with
comparable populations, and their squads are built in almost opposite ways. Note
also the gap between the men's and women's squads within each island, which is a
second story sitting inside the same table.

:::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: challenge

## Challenge 3: Composition by position

Using the `tier_group` column we created with `case_when()`, write a pipeline
that shows, for the Curaçao men's squad only, how many players fall in each
combination of `position` and `tier_group`. Sort by position and then by count
descending.

Hint: you will need to group by two columns, and `count()` accepts more than one.

:::::::::::::::::::::::: solution

## Solution


``` r
squad |>
  filter(team_code == "CUW-M") |>
  count(position, tier_group) |>
  arrange(position, desc(n))
```

``` output
# A tibble: 7 × 3
  position tier_group                n
  <chr>    <chr>                 <int>
1 DEF      European professional     8
2 DEF      Unknown                   3
3 FWD      European professional     4
4 FWD      Unknown                   2
5 GK       European professional     3
6 MID      European professional     8
7 MID      Unknown                   4
```

If you used `group_by()` and `summarise()` instead, add `.groups = "drop"`:


``` r
squad |>
  filter(team_code == "CUW-M") |>
  group_by(position, tier_group) |>
  summarise(n = n(), .groups = "drop") |>
  arrange(position, desc(n))
```

``` output
# A tibble: 7 × 3
  position tier_group                n
  <chr>    <chr>                 <int>
1 DEF      European professional     8
2 DEF      Unknown                   3
3 FWD      European professional     4
4 FWD      Unknown                   2
5 GK       European professional     3
6 MID      European professional     8
7 MID      Unknown                   4
```

The `.groups = "drop"` argument tells `summarise()` to remove the grouping after
calculation. Without it the result stays grouped, which causes surprising
behaviour in later steps.

:::::::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::

## Summary

You now know the core dplyr verbs and can map each one to its SPSS equivalent:

| You used to... | Now you write... |
|---|---|
| Data > Select Cases | `filter()` |
| Select columns in Variable View | `select()` |
| Transform > Compute Variable | `mutate()` |
| Transform > Recode | `mutate()` + `case_when()` |
| Data > Sort Cases | `arrange()` |
| Data > Split File + Aggregate | `group_by()` + `summarise()` |

And you connect them all with `|>`, "and then", to build readable, reproducible
data pipelines.

::::::::::::::::::::::::::::::::::::: keypoints

- dplyr verbs (`filter`, `select`, `mutate`, `arrange`, `summarise`) replace SPSS menu operations
- The pipe operator `|>` chains operations together, making code readable
- `group_by()` combined with `summarise()` replaces SPSS Split File + Aggregate
- The mean of a TRUE/FALSE column is a proportion, which saves you building dummy variables
- Keep an explicit Unknown category rather than dropping incomplete rows

::::::::::::::::::::::::::::::::::::::::::::::::
