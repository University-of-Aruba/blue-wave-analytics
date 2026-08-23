---
title: 'SPSS to R Reference Card'
---

## Data Import and Export

| What you do in SPSS | SPSS Menu Path | R Code |
|---|---|---|
| Open SPSS file | File > Open > Data | `haven::read_sav("file.sav")` |
| Open CSV file | File > Open > Data (CSV) | `readr::read_csv("file.csv")` |
| Open Excel file | — | `readxl::read_excel("file.xlsx")` |
| Save as CSV | File > Save As > CSV | `readr::write_csv(df, "file.csv")` |

## Inspecting Data

| What you do in SPSS | SPSS Menu Path | R Code |
|---|---|---|
| View data | Data View tab | `View(df)` |
| Variable info | Variable View tab | `str(df)` or `dplyr::glimpse(df)` |
| First rows | — | `head(df)` |
| Dimensions | — | `nrow(df)` / `ncol(df)` / `dim(df)` |

## Descriptive Statistics

| What you do in SPSS | SPSS Menu Path | R Code |
|---|---|---|
| Descriptives | Analyze > Descriptive Statistics > Descriptives | `summary(df$var)` |
| Frequencies | Analyze > Descriptive Statistics > Frequencies | `table(df$var)` |
| Crosstabs | Analyze > Descriptive Statistics > Crosstabs | `table(df$var1, df$var2)` |
| Mean by group | Analyze > Compare Means > Means | `df |> group_by(group) |> summarise(mean(var))` |

## Data Manipulation

| What you do in SPSS | SPSS Menu Path | R Code |
|---|---|---|
| Filter cases | Data > Select Cases | `dplyr::filter(df, condition)` |
| Sort | Data > Sort Cases | `dplyr::arrange(df, var)` |
| New variable | Transform > Compute Variable | `dplyr::mutate(df, new = ...)` |
| Recode | Transform > Recode | `dplyr::case_when()` |
| Select columns | — | `dplyr::select(df, var1, var2)` |
| Split file | Data > Split File | `dplyr::group_by(df, var)` |
| Aggregate | Data > Aggregate | `df |> group_by(var) |> summarise(...)` |
| Merge (add cases) | Data > Merge Files > Add Cases | `dplyr::bind_rows(df1, df2)` |
| Merge (add variables) | Data > Merge Files > Add Variables | `dplyr::left_join(df1, df2, by = "id")` |

## Statistical Tests

| What you do in SPSS | SPSS Menu Path | R Code |
|---|---|---|
| Independent t-test | Analyze > Compare Means > Independent-Samples T Test | `t.test(y ~ group, data = df)` |
| Paired t-test | Analyze > Compare Means > Paired-Samples T Test | `t.test(x, y, paired = TRUE)` |
| One-way ANOVA | Analyze > Compare Means > One-Way ANOVA | `aov(y ~ group, data = df) |> summary()` |
| Post-hoc tests | (within ANOVA dialog) | `TukeyHSD(aov_result)` |
| Correlation | Analyze > Correlate > Bivariate | `cor.test(df$x, df$y)` |
| Linear regression | Analyze > Regression > Linear | `lm(y ~ x1 + x2, data = df) |> summary()` |
| Chi-square | Analyze > Descriptive Statistics > Crosstabs (Statistics) | `chisq.test(table(df$var1, df$var2))` |
| Reliability | Analyze > Scale > Reliability Analysis | `psych::alpha(df[, items])` |

## Visualization

| What you do in SPSS | SPSS Chart Builder | R Code (ggplot2) |
|---|---|---|
| Bar chart | Bar element | `ggplot(df, aes(x)) + geom_bar()` |
| Histogram | Histogram element | `ggplot(df, aes(x)) + geom_histogram()` |
| Scatterplot | Scatter/Dot element | `ggplot(df, aes(x, y)) + geom_point()` |
| Line chart | Line element | `ggplot(df, aes(x, y)) + geom_line()` |
| Boxplot | Boxplot element | `ggplot(df, aes(x, y)) + geom_boxplot()` |
| Add labels | — | `+ labs(title = "...", x = "...", y = "...")` |
| Change theme | — | `+ theme_minimal()` |

## Useful Packages

| Package | Purpose |
|---|---|
| `tidyverse` | Collection: dplyr, ggplot2, readr, tidyr, and more |
| `haven` | Read/write SPSS, Stata, and SAS files |
| `readxl` | Read Excel files |
| `rmarkdown` | Reproducible reports |
| `broom` | Tidy statistical output into data frames |
| `psych` | Descriptive stats, reliability analysis, factor analysis |
| `WDI` | World Bank data directly in R |
| `cbsodataR` | CBS Netherlands StatLine data (including BES islands) |
