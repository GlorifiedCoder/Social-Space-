---
name: test-and-release
description: Use when preparing a My Social Space phase for completion, running regression tests, reviewing a release candidate, or verifying Flutter build quality.
---
# Test and Release Gate

## Required checks
1. Review phase acceptance criteria and current Git diff.
2. Run `dart format .`.
3. Run `flutter analyze`.
4. Run `flutter test`.
5. Run relevant integration tests when available.
6. Build/run on Android if the environment supports it.
7. Inspect permissions, secrets, dependencies, logs, migrations, and user data handling.
8. Update roadmap, changelog, decision log, and release checklist as appropriate.

## Evidence
Record exact commands, exit codes, test counts, device/API level, and what was not tested. Never infer success from code inspection alone.

## Blocking conditions
Do not mark a phase complete if P0 acceptance criteria fail, static analysis has errors, tests fail, persisted data may be lost, or a provider capability is unverified.

## Final report
Delivered, changed files, checks executed/results, remaining failures, limitations, and the next phase.
