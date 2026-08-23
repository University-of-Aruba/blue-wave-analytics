---
title: Homework between Day 1 and Day 2
---

At the end of Day 1 you have the three skills that make up most day-to-day R
work: importing data, transforming it with `dplyr`, and visualising it with
`ggplot2`. The 48 hours between sessions is the most valuable part of the
course. Use it to translate those skills into something that matters in your
own work.

## The assignment

Pick a dataset you work with regularly. It can be an Excel export, a CSV, or
a `.sav` file you saved from SPSS. All three load into R with what we covered
today.

Write an R script that does the following:

1. **Imports** the data with the appropriate function (`read_csv()`,
   `readxl::read_excel()`, or `haven::read_sav()`).
2. **Transforms** it in at least one way. Filter to a subset of rows with
   `filter()`, create a new column with `mutate()`, or aggregate with
   `group_by()` and `summarise()`. Pick whichever is useful for your data.
3. **Produces a summary table** of something meaningful — counts by category,
   means by group, totals over time.
4. **Creates one chart** with `ggplot2` that shows something you would
   actually want to look at.

Save the script as a `.R` file inside your `blue-wave` project folder. Give
it a name that describes what it does, like `survey-responses-2026.R`.

Bring the script to Day 2. We will use the open-lab slot at the end of Day 2
to help you push your own projects further.

## Guidance

- **Thirty to sixty minutes is plenty.** This is practice, not a deliverable.
  Do not make it perfect. Do not pick a dataset that needs an hour of
  cleaning before you can use it.
- **Use what is in front of you.** Your Day 1 notes, the course website, the
  code we ran together — all of it is fair game. Look things up.
- **Googling is fine.** Asking R for help with `?function_name` is fine.
  Using Claude or ChatGPT for syntax hints is fine and encouraged. The rule
  is that you type the code yourself once it works, so your fingers remember
  it.
- **If something breaks, keep the error message.** Screenshot it or copy
  it into a comment at the top of your script. We will look at it together
  on Day 2.

## What counts as done

You opened a dataset you already use at work and wrote R code that produced
at least one thing you could show a colleague. Anything beyond that is bonus.

## Optional stretch

If you finish the four steps above and want more, try one of these:

- Write a second version of the summary table grouped by a different
  variable, and see how the picture changes.
- Rewrite your chart three different ways — change the `geom_*`, the colour
  mapping, or the facet structure — and decide which version communicates
  best.
- If your original dataset is in SPSS `.sav` format, export the same analysis
  to a CSV with `write_csv()` and re-import it. You have now made the move
  from closed to open data format.

Do **not** try to build an R Markdown report yet. R Markdown is the first
topic on Day 2, and it is much faster to learn after you have seen why it
matters than to piece together on your own from blog posts.
