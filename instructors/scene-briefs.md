# Scene briefs for the Blue Wave cartoons

**Iteration:** 1
**Status:** drafted 9 September 2026, none rendered yet.

The seven images currently in `episodes/fig/` are the Aruba course's cartoons,
byte for byte, captions included. They are inherited placeholders, set on the
wrong island. This file replaces them.

Workflow is the one used for the Aruba set: the brief below goes to Gemini, the
render comes back, it is saved as `episodes/fig/scene_N.jpg`, and the caption
line is pasted into the episode. Keep renders under about 200KB.

## Before rendering anything

**Check the cultural references with Marjorie Alfonso first.** "Blue Wave" is
the national team's own nickname and the campaign has its own anthem, and that
ground is hers, not Rendell's. Anything in these briefs touching bars, food,
music or neighbourhood detail is a proposal for her to correct.

**Any visible text must be in Curacao Papiamentu orthography**, not Aruban
etymological spelling. This lesson departs from the usual house rule on purpose
because it is delivered in Willemstad. Image generators also mangle lettering,
so check every rendered word before saving, and prefer scenes where the text is
one or two short labels.

## Style block, paste into every prompt verbatim

> Warm, loose-lined editorial cartoon. Flat colour with visible ink outlines,
> the look of a good newspaper op-ed illustration rather than a corporate
> vector. Bright Caribbean palette anchored on the Curacao flag: deep sea blue,
> a strong yellow, white, with coral and turquoise accents. Sunlight, hard
> shadows. Gentle humour, never mocking, nobody is the butt of the joke. No
> photorealism, no 3D render, no watermark, no signature. Landscape, roughly
> 3:2.

## Recurring character, if the series has one

> A Curacaoan woman in her early thirties, natural hair tied back, football
> shirt in national blue worn over everyday clothes, reading glasses pushed up
> on her head, always with a battered laptop covered in stickers.

She is a fan who becomes an analyst over the two days. Whether to use her at all
is the open decision below.

## Scene 0, the index hero

**Where it goes:** top of `index.md`, currently commented out.

**Caption:** Twenty-six players. Ten countries. One spreadsheet.

**Alt:** Cartoon of a Curacao football fan at a beach bar tracking her squad
across a wall map strung with pins and yarn to ten different countries

**Brief:** A small neighbourhood bar in Willemstad, late afternoon. On the back
wall, a large world map with twenty-six small photo pins on it and taut yarn
running from a single dot in the southern Caribbean out to ten separate
countries, the thickest bundle going to the Netherlands. Our analyst stands in
front of it with a laptop balanced on one forearm, adding one more pin. On the
counter behind her, a domino set mid-game that nobody is playing any more
because everyone is looking at the map. Warm low sun through the doorway.

## Scene 1, Episode 1, the case for switching

**Caption:** One gate charges you every season. The other one only asks you to
learn the way in.

**Alt:** Cartoon of a researcher choosing between a coin-operated turnstile and
an open stadium gate

**Brief:** The approach to a football stadium under a blue sky. Two entrances
side by side. On the left, a heavy chrome turnstile with a coin slot and a
running meter showing a licence fee climbing, a queue of tired people feeding it
money. On the right, a wide open gate with a small hand-painted sign reading
`install.packages()`, no queue, a short flight of steps that goes up rather
steeply. Our analyst is at the foot of the steps, sleeves rolled, looking up at
the climb with the expression of someone deciding it is worth it.

## Scene 2, Episode 2, your first R session

**Caption:** The dominoes can wait. The console is blinking.

**Alt:** Cartoon of a researcher opening the R console on a laptop at a
neighbourhood bar while an iguana watches from the next stool

**Brief:** Inside a small local bar with louvred windows and a ceiling fan. Our
analyst has claimed one end of the counter and opened her laptop, screen showing
a clean console with a single blinking prompt. Beside her a large green iguana
sits up on the next barstool watching the screen with total seriousness. Behind
them, an unfinished domino game and two regulars who have turned to look. A
bottle of cold water and a plate of pastechi at her elbow.

## Scene 3, Episode 3, data manipulation

**Caption:** Nobody makes stoba without cleaning the karko first.

**Alt:** Cartoon of a researcher cooking in a Caribbean kitchen with three
labelled jars for the dplyr verbs

**Brief:** A bright island kitchen, open shutters, sea light. Our analyst in an
apron over her football shirt, working at a big pot of stew. Three glass jars on
the counter, clearly labelled `filter()`, `select()` and `mutate()`, each with a
wooden spoon in it. On the chopping board, a messy pile of raw ingredients on
one side and neat sorted rows on the other, so the direction of travel is
obvious. A cat asleep under the counter, uninterested.

## Scene 4, Episode 4, your first visualization

**Caption:** SPSS hands you a chart. ggplot2 hands you a grammar.

**Alt:** Cartoon of the coloured waterfront houses of Willemstad drawn as the
bars of a bar chart, with a researcher painting them into order

**Brief:** The Handelskade waterfront in Willemstad, the famous row of narrow
coloured merchant houses along the water. Draw them so the houses are
unmistakably also the bars of a bar chart: flat tops at different heights, a
ruled baseline along the quay, faint gridlines behind them, a y-axis running up
the left edge of the frame. Our analyst stands on a small boat in the harbour
with a long paintbrush, adding the last house and nudging it to the right
height. The pontoon bridge sits in the background. This is the strongest image
in the set; give it the most care.

## Scene 5, Episode 5, statistical analysis

**Caption:** Sometimes the review says nothing happened. You report that too.

**Alt:** Cartoon of a researcher at a pitchside video review monitor showing a
flat regression line and a null result

**Brief:** Pitchside at a football ground, a video review monitor on a stand.
Our analyst is bent over it in the referee's posture, one hand to an earpiece.
The screen shows not a foul but a scatter plot with a completely flat fitted
line through it, and a small box reading `p = 0.64`. Behind her a packed stand
of supporters leaning forward, waiting for a verdict that is going to be
undramatic. Her face is calm, not apologetic. The joke is the anticlimax, and
she is fine with it.

## Scene 6, Episode 6, reproducible reporting

**Caption:** The squad changed overnight. Again. Good thing the report rebuilds
itself.

**Alt:** Cartoon of a researcher pressing one button on a machine that turns a
changed squad list into a finished report

**Brief:** A workshop under a corrugated roof. A cheerful contraption of pipes,
funnels and belts. Into the hopper at one end tumbles a jumble of squad photos
and transfer paperwork, several visibly crossed out and replaced. Out the far
end slides a crisp bound report, still warm. Our analyst has one finger on a
single oversized button and is drinking coffee with her other hand. A wall
calendar behind her shows the international window circled in red. On the floor,
a discarded pile of the same report done by hand.

## Scene 7, Episode 7, where to go from here

**Caption:** You have the basics. The map runs well past the harbour mouth.

**Alt:** Cartoon of a researcher on a small boat leaving Willemstad harbour with
a chart of R learning destinations

**Brief:** A small open boat heading out through Sint Annabaai toward open
water, the pontoon bridge swung aside behind it and the coloured waterfront
receding. Our analyst sits at the tiller with a nautical chart across her knees.
The chart is drawn as a sea of islands with hand-lettered names such as
`Shiny Cay`, `Tidyverse Reef`, `Quarto Point` and `Package Bank`, with a dotted
course pencilled between them. Open horizon ahead, plenty of sky.

## The one open decision

The Aruba set is explicitly decorative. `opening-script.md` line 95 tells
instructors the images "are not characters or a recurring narrative across the
workshop. Do not point at them, do not flip back to them, do not use them as
story beats."

These briefs quietly break that, because the same analyst appears in all eight
and visibly changes from fan to practitioner. Football gives this course a spine
the Aruba course did not have, and a through-line is worth something on a
two-day workshop where people flag on the second afternoon.

Pick one, because it changes both the renders and the delivery notes:

**Keep them decorative.** Drop the recurring character block, render eight
unrelated scenes, leave `opening-script.md` alone. Safest, and it matches the
sister course.

**Let it be a series.** Keep the character, and rewrite `opening-script.md` line
95 plus the transitions table in `instructor-notes.md` so instructors are told to
use the callbacks instead of ignoring them. More work, and it needs consistent
renders, which is the part image generators are worst at. The character block
above exists to fight that; paste it verbatim every time and expect to reroll.
