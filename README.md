# amber-trade-spread-gate

`amber-trade-spread-gate` is a Zig project in trading systems. Its focus is to design a Zig verification harness for spread systems, covering resource planning, capacity fixtures, and failure-oriented tests.

## Project Rationale

The project exists to keep a narrow engineering decision visible and testable. For this repo, that decision is how spread pressure and portfolio drift should influence a review result.

## Amber Trade Spread Gate Review Notes

The first comparison I would make is `spread pressure` against `fill risk` because it shows where the rule is most opinionated.

## Feature Set

- `fixtures/domain_review.csv` adds cases for spread pressure and fill risk.
- `metadata/domain-review.json` records the same cases in structured form.
- `config/review-profile.json` captures the read order and the two review questions.
- `examples/amber-trade-spread-walkthrough.md` walks through the case spread.
- The Zig code includes a review path for `spread pressure` and `fill risk`.
- `docs/field-notes.md` explains the strongest and weakest cases.

## Architecture

The repository has two validation layers: the original compact policy fixture and the domain review fixture. They are separate so one can change without hiding failures in the other.

The Zig code keeps the review rule close to the tests.

## Usage

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/verify.ps1
```

## Test Command

The verifier is intentionally local. It should fail if the fixture score math, lane assignment, or language-specific test drifts.

## Next Improvements

The repository is intentionally scoped to local checks. I would expand it by adding adversarial fixtures before adding features.
