---
title: "Pre-course checklist"
course_dates: "Mon 15 and Wed 17 September 2026 (provisional)"
---

# Pre-course checklist

Things only the instructors can do. Work down the list; tick as you go. Items
marked **[Marjorie]** belong to the local coordinator, the rest to the lead
instructor.

## Still open from the build

These are decisions the course materials are waiting on. Close them first,
because several later items depend on the answers.

- [ ] **Confirm dates and teaching-day count.** The site currently says Monday 15
      and Wednesday 17 September with a gap day. If that changes, update
      `index.md`, `learners/setup.md`, and the `course_dates` line at the top of
      this file. **[Marjorie]**
- [ ] **Confirm the room** and whether the research lab is the fallback.
      **[Marjorie]**
- [ ] **Decide on the qualifying match table.** `episodes/data/curacao_qualifiers_TEMPLATE.csv`
      is empty on purpose, because the match-by-match record could not be
      verified when the course was built. Either fill it from a source you can
      name and save it as `curacao_qualifiers.csv`, or leave it and teach the
      qualifying run as narrative only, which is what the episodes currently
      assume. Do not teach from guessed scorelines. See
      `episodes/data/VERIFY-BEFORE-DELIVERY.md`.
- [ ] **Replace the two survey links.** The URLs in `episodes/07-next-steps.Rmd`
      are the April 2026 Aruba pilot forms. Either create Curacao cohort forms
      and swap them, or add a cohort question to the existing forms and accept
      mixed responses. Decide before promotion goes out.
- [ ] **Tell Esther the repository exists.** It sits in the University of Aruba
      org alongside `r-for-spss-users`, which is the right home for a DCDC
      training deliverable, and it appeared there without her being asked first.
      The Cornerstone Economics data that originally raised a conflict-of-interest
      question has been removed and replaced with a public Wikipedia-derived
      dataset, so the substantive issue is closed; `DATA-PROVENANCE.md` records
      what was removed and why. What remains is the courtesy. Do it before the
      course is promoted, not after somebody notices.

## Content verification

- [ ] **Build the whole site locally.** From the repository root, run
      `sandpaper::build_lesson()` and watch for errors. Every episode must knit
      cleanly before anything is pushed.
- [ ] **Regenerate the data.** Run `Rscript scripts/00_build_teaching_data.R`.
      It scrapes four Wikipedia squad pages, so it needs a network connection and
      it will produce different numbers whenever a squad has been re-called. The
      episode prose quotes specific figures (94 players, 26 in the Curaçao men's
      squad, 10 club countries, two players with no club), so **re-read Episodes
      1 to 6 against the new output** rather than assuming it still matches.
- [ ] **Knit the capstone.** Open `episodes/files/blue-wave-squad-report-template.Rmd`
      and knit it with `params$team` set to `CUW-M`. Then knit it again with
      `ARU-W`. Both must produce a complete report. This is the Episode 6 finish
      line and the Episode 1 tease, so it has to work on the day.
- [ ] **Verify both survey links** in an incognito window, so your own Google
      login does not mask a broken link. Confirm each form loads and accepts a
      test response.
- [ ] **Check the download links in Episode 2 and the setup page** resolve. They
      point at `University-of-Aruba/blue-wave-analytics`. If the repository is
      ever renamed or moved, `github.com` links redirect but
      **`raw.githubusercontent.com` links do not**, so the capstone
      `download.file()` block in Episode 6 needs a find-and-replace at that point.

## Delivery dry-run

- [ ] **Run the Episode 1 demo on the venue Wi-Fi.** Part A pulls from GitHub and
      will fail on a bad connection. Part B is local and must work regardless.
      If Part A fails, use `episodes/data/countries_backup.csv`.
- [ ] **Local fallback on the desktop.** Have the backup CSV and the full data
      folder on the laptop desktop, not only inside the repository.
- [ ] **USB stick with all five data files** plus the R and RStudio installers,
      for participants who cannot download in the room.
- [ ] **Read the opening aloud once.** Time the silences. Three seconds after the
      failure line feels much longer than you expect.
- [ ] **Practise the two-way table beat in Episode 2.** It is a deliberate
      cliffhanger. Do not explain it; wait for someone in the room to say it.

## Installation support

- [x] Registration confirmation sent automatically on submit, linking to the
      setup page (Apps Script trigger on the registration form, 10 Sep).
- [ ] Watch the reply inbox for install errors in the week before the course.
- [ ] IT asked whether lab machines can be pre-loaded with R and RStudio, with at
      least a week's notice. **[Marjorie]**

## Registration and promotion

- [ ] Registration link live, University of Curacao internal first, then
      external. **[Marjorie]**
- [ ] Flyer distribution list agreed: UoC internal, CBS Curacao, ministries,
      economists' association. **[Marjorie]**
- [ ] DCDC newsletter item queued through the MailerLite approval workflow.
- [ ] DCDC LinkedIn and Instagram posts scheduled.
- [ ] **Decide how hard to lead with "Blue Wave" in promotion.** The name is
      bound late on purpose. Read the national mood before committing.

## Physical prep

- [ ] Green and red sticky notes for every seat
- [ ] Printed attendance list
- [ ] Power strip and USB-C / USB-A loaners
- [ ] `instructors/faq-card.html` printed, A5, face down beside the laptop
- [ ] Printed copy of the capstone report to hold up during the opening

## During the course

- [ ] Opening: announce where the power outlets are, and that topping up happens
      during breaks rather than during live coding
- [ ] Day 1 close: hand out the homework brief and project the page
- [ ] Day 2 close: re-knit the capstone with a different `params$team` in front of
      the room, as the last thing they see

## After

- [ ] Mint the Curacao version DOI under concept DOI 10.5281/zenodo.20057762
- [ ] Update `profiles/learner-profiles.md` with what the room actually looked
      like, replacing the Aruba pilot assumptions
- [ ] Write up what broke, while it is fresh, for the next island
