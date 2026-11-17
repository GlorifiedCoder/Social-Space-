---
description: Verify a roadmap phase against its exit criteria and update project progress records.
argument-hint: "<phase-number>"
skills: test-and-release
---
Evaluate whether Phase $ARGUMENTS is actually complete.

Read its prompt and roadmap exit gate. Inspect the implementation and tests. Run formatter, analyzer, tests, and device/build checks where possible. Check docs and security/platform claims. Do not make code changes merely to make the status look complete.

If all required criteria pass, update the phase status and changelog. If not, leave it incomplete and provide a precise gap list with recommended fixes. Report evidence and exact commands/results.
