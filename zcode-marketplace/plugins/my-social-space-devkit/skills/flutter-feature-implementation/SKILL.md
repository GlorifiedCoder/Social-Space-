---
name: flutter-feature-implementation
description: Use when implementing or refactoring a Flutter/Dart feature in My Social Space. Enforces requirements-first planning, feature boundaries, accessible UI, focused dependencies, tests, and verification.
---
# Flutter Feature Implementation

## Before coding
1. Read the relevant product requirements, UX specification, architecture, and current roadmap phase.
2. Inspect existing code and Git diff. Never overwrite working code without understanding it.
3. Restate the acceptance criteria and identify the smallest coherent implementation.
4. Check existing dependencies and verify current package compatibility before adding anything.
5. List files expected to change and the tests required.

## Implementation
- Follow the existing feature-first structure and established conventions.
- Keep widgets focused; move domain/state/data work out of large UI widgets.
- Use Riverpod for state and repository/service boundaries.
- Use GoRouter for navigable routes.
- Represent loading, empty, error, unsupported, and success states explicitly.
- Make interactive controls accessible and testable.
- Prefer local-first behavior for workspace selection and Notes.
- Do not create fake provider data or fake AI execution.
- Add migrations for persisted schema changes.
- Avoid new packages unless they solve a real requirement.

## Verification
Run `dart format .`, `flutter analyze`, and relevant tests. Add unit/widget tests for each behavior. For visual changes, run the app when an emulator/device is available and state whether it was actually inspected.

## Report
Summarize behavior, files changed, dependencies, exact commands/results, test coverage, unverified assumptions, and next step.
