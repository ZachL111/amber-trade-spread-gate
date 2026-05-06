# Amber Trade Spread Gate Walkthrough

The fixture is intentionally compact, so the review starts with the cases that pull farthest apart.

| Case | Focus | Score | Lane |
| --- | --- | ---: | --- |
| baseline | spread pressure | 226 | ship |
| stress | fill risk | 150 | ship |
| edge | portfolio drift | 160 | ship |
| recovery | quote width | 189 | ship |
| stale | spread pressure | 181 | ship |

Start with `baseline` and `stress`. They create the widest contrast in this repository's fixture set, which makes them better review anchors than the middle cases.

`baseline` is the optimistic case; use it to make sure the scoring path still rewards strong signal.
