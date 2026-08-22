---
title: "Opening sequence template"
duration: "7 to 8 minutes of personal narrative, then into the page"
fits_within: "Episode 01 — The case for switching"
delivery: "Live and voice-driven. The Episode 1 page already shows one atmospheric scene image at the top and contains the live SIDS reference-list demo as an embedded instructor block. The opening is a wrapper around that page, not a parallel performance."
version: 6
---

# Opening sequence template

This file is a structural template, not a script. The opening of this workshop works best when the instructor brings a personal narrative arc that lands a single thesis line. That line then becomes the spine the rest of the two days hangs from. This template describes the *shape* of the opening; the words are yours.

## Why a personal opening at all

Carpentries pedagogy values getting hands on the keyboard fast. A long opening burns that budget. The case for spending seven minutes on narrative anyway is that it gives the workshop a why. SPSS users about to be asked to learn an unfamiliar tool need a reason that goes beyond "it is free and open source." A brief, well-paced personal arc that names a moment of analytical failure and the move that resolved it earns the room's attention before any code appears.

If you do not have a comparable personal arc, you can still teach this course well. Open with the page's introduction, deliver the cost-argument table and the R-vs-SPSS section straight, hand into the SIDS demo. You will lose some of the attention premium but none of the content. Do not invent a story you have not lived.

## The arc

Cold open. Origin. Critical-failure moment. Thesis line. The turn. Three ground rules. Handoff into the Episode 1 page. The page leads from there.

## Cold open (~45 seconds)

You are at the front. The Episode 1 page is on the screen with the scene image visible. Wait for quiet. **Do not introduce yourself first.** A question or an image lands harder when it precedes the introduction.

The cold open is a one-paragraph setup of a moment when analysis failed you. Not a complaint. A specific scene: where you were, what was being asked, the answer you did not have. Keep it under a minute.

After the cold open, give your name, role, and one sentence of credibility. Thirty seconds total.

## Origin (~2 to 3 minutes)

Rewind to the start of the story. Establish who you were before the failure, and how you got into the situation that led to it. The point is not autobiography; it is to make the listener believe the failure was earned through real work, not naivety.

Two to three minutes. Resist the urge to add detail.

## Critical-failure moment (~90 seconds)

Return to the moment from the cold open and walk through it slowly. Let yourself be in the room again. Re-ask the question that exposed the failure. Pause before delivering the answer ("I had no idea," or your equivalent).

**Hold the silence after the failure for three full seconds.** Do not rescue yourself. The silence is the work.

## The thesis (~30 seconds)

One sentence. Spoken with silence on both sides. This is the line the rest of the workshop is built on. The line should generalize from your story into a principle that applies to anyone executing analysis without understanding it. Aim for a sentence the listener can repeat after one hearing.

If you cannot articulate a thesis line in one sentence, you have not finished writing your opening yet. Keep iterating until you can.

## The turn (~90 seconds)

Describe what changed. The shift from the failure mode (executing rituals) to the new mode (understanding what the code does). Slowly, badly, over time, at a cost. Frame the cost as what the room is about to pay over the next two days.

## Three ground rules (~30 seconds)

End the personal arc with three workshop rules. The exact wording is yours; the principles are:

1. **Beginner mindset.** Everyone is a beginner today, including those who are not. Treating the material as new produces faster learning.
2. **Sticky notes.** Green on the laptop means following. Red means stuck. No raised hands. Notes communicate without anyone needing to speak.
3. **Type, do not paste.** The instructor types live; participants type along on their own machines. Copy-paste does not produce retention.

## Handoff into the Episode 1 page

> Let's get started. Episode 1 is on the screen. The big questions for the next forty-five minutes are right there at the top: why switch, what does R give you that SPSS does not, and what does the cost actually look like. We will work through those together.

Scroll first to **What you will be able to produce**. This is the Wednesday-afternoon payoff: the squad report that Episode 6 ends on. Hold up the finished report, printed or on a second screen, for five seconds. Do not open it, do not explain it. Name it: "By Wednesday afternoon you will produce something like this from one R Markdown file and one click." Move on. The rendered version is at `episodes/files/blue-wave-squad-report.html` and the source at `episodes/files/blue-wave-squad-report-template.Rmd`.

Then scroll to the cost-argument table. Walk through it briefly. Then through "What R gives you that SPSS does not." Brief is fine. Their eyes are on the page; you are providing colour, not narration.

When you reach the **Live demonstration** heading, switch to RStudio and follow the embedded instructor block on the page (`:::: instructor` ... `::::`). It contains the full script: a `read_csv()` pull of the UA island-research SIDS reference list straight from GitHub, a filter-count-ggplot pipeline charting SIDS by World Bank region, and the SPSS contrast walkthrough. **Do not improvise a different demo here.** The page is the script.

After the demo, deliver the page's summary in your own words and break for fifteen.

From here, you are in Carpentries live-coding mode for the rest of the day. They type, you type, sticky notes guide the pace.

## Day 1 and Day 2 closes

Day 1 close: re-ask the question from your cold open, this time to the room. Different weight after a day of code. A few people will offer different answers. Both kinds of answers are wins. No visual aid needed; the question lands harder unaccompanied.

Day 2 close: return to your thesis line. Pose it back to them as something they can now respond to with their own scripts. Close on the silence.

## Why the demo is the SIDS pull, not WDI

Earlier versions of the Episode 1 demo used `WDI::WDI()` to pull tourism arrivals for Aruba, Curacao, and Sint Maarten. That series is missing 2019 through 2023 on the World Bank side, which quietly undercuts the "fresh data" argument the demo is supposed to make. The current demo is a three-line `read_csv()` from the UA-maintained `island-research-reference-data` GitHub repo, charted by World Bank region. The wow is less "look what R can pull from an API" and more "look what R can pull straight from the data layer the network maintains." Name that in your own words during the walkthrough.

The CAS_election_data repo at github.com/University-of-Aruba/ is still Episode 7 material. Resist the urge to preview it here.

## Part B of the demo is not optional

This edition's Episode 1 instructor block has a second half: loading the squad data and counting where the Curacao men's squad plays. It needs no network, it lands harder in this room than the SIDS chart does, and it is the dataset the next three episodes run on. If you are short on time, cut Part A and keep Part B, not the other way round.

Do not resolve the question the chart raises. The room will start arguing about why the two islands differ. That argument is the motivation for the rest of the course, and answering it yourself spends it.

## On the scene images

Each episode's lesson page already opens with one atmospheric scene image (`fig/scene_1.jpg` through `scene_7.jpg`) and a short quip caption. They are decoration that sets tone for the page. They are not characters or a recurring narrative across the workshop. Do not point at them, do not flip back to them, do not use them as story beats. They do their work passively. Optional one-line transition acknowledgments for each scene image are in `instructor-notes.md` under "Per-episode scene transitions."

## What to have ready before you walk in

The Episode 1 page open in the browser, scrolled to the top.

RStudio already open with `tidyverse` installed and loaded, a blank script visible. The package list is in the page's instructor block; install before the workshop, do not improvise on the day.

The backup CSV is committed to the repo at `episodes/data/countries_backup.csv`. If Wi-Fi drops during the demo, swap the `read_csv()` URL for the local path as shown in the page's instructor block.

The FAQ card printed and placed next to your laptop, face down.

Green and red sticky notes at every seat. A printed attendance list. Chargers and extension cords (outlet shortage is common). A spare extension cord if you have it.

Baseline survey link verified and tested. DCDC onboarding survey link verified and tested. Feedback survey link verified and tested.

## What not to do

Do not open with a joke. Self-deprecation belongs inside the story, not on top of it.

Do not skip the silence after the failure-moment punchline, and do not skip the silence on either side of the thesis line. The silences are not dead air. They are the work.

Do not flip between slides during the opening. The Episode 1 page sets the visual frame. Beyond that, you are the medium.

Do not improvise a second demo on top of the page's SIDS demo. One wow per moment. The page's demo is the wow.

Do not perform someone else's personal narrative. If you are adapting this course and the previous instructor's opening is on file, use it as a structural reference, not a script. Bring your own.
