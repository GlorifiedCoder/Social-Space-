# My Social Space — ZCode Workspace Instructions

You are the engineering agent for this repository. Build a dependable product, not a throwaway demo.

## Product truth

My Social Space is an Android-first personal social-media workspace with four primary tabs: Home, Notes, Agent Suggest, and Settings.

The defining Home interaction is a horizontally swipeable sequence of platform workspaces. On launch, restore the last-used platform workspace. Keep independent, app-managed state for each platform. Do not implement Home as only a grid of social icons.

A workspace shell is not the same as embedding the original platform's native app. Clearly distinguish:
- app-owned workspace content and state;
- official external-app launching;
- supported deep links;
- approved platform API / SDK content;
- app-owned embedded playback, where permitted.

Never claim exact external app screen restoration, feed access, or playback position restoration unless an official and tested capability supports it.

## Required workflow

1. Inspect the current repository and Git status before edits.
2. Read relevant files in `docs/` and the current phase prompt.
3. State assumptions, implementation plan, affected files, and risks before substantial changes.
4. Implement only the requested phase or feature. Do not silently expand scope.
5. Prefer small, reversible changes.
6. Add tests for changed behavior.
7. Run `dart format`, `flutter analyze`, and relevant `flutter test` commands when Flutter code exists.
8. Report exact commands and results. Never claim a test passed if it was not executed.
9. Update `docs/ROADMAP.md`, `docs/DECISION_LOG.md`, and `CHANGELOG.md` when relevant.
10. Stop and report blockers instead of inventing platform capabilities or credentials.

## Stack and architecture

- Flutter + Dart; Android first.
- Riverpod for state management.
- GoRouter for top-level navigation.
- SQLite for durable local records; lightweight key-value preferences only for small settings.
- Feature-first modules with clear boundaries between presentation, application/state, domain, and data concerns where complexity justifies them.
- Keep platform integration behind a `PlatformAdapter` / capability abstraction.
- Backend is a later phase: FastAPI + Supabase. Do not introduce backend dependencies into Phase 1 without an explicit requirement.

Verify current stable package versions and compatibility at implementation time. Do not copy obsolete version numbers from examples.

## Product and UX rules

- Four fixed bottom destinations: Home, Notes, Agent Suggest, Settings.
- Home page swiping must be horizontal and must not conflict with vertical scrolling inside a platform workspace.
- Each platform has an independent workspace identity and app-managed last route / resume marker.
- Restore the last-used platform at startup without a visible jump or incorrect initial page.
- Platform order and enabled state must be user-configurable in a later phase.
- Use empty, loading, error, disconnected, and unsupported states deliberately.
- Avoid fake feeds, fake account connections, fake AI execution, and fake synchronization.
- Keep the visual system consistent, accessible, and responsive to Android screen sizes.
- Use clear labels and accessible semantics for icon-only controls.

## Integration and security rules

- Never request or store a social-platform password.
- Never extract, copy, or reuse another app's cookies or private session files.
- Never bypass OAuth restrictions, anti-bot controls, paywalls, DRM, rate limits, or platform terms.
- Use official OAuth flows, SDKs, APIs, deep links, and app-launch intents where permitted.
- Keep provider secrets on a backend; do not embed server API secrets in Flutter assets or source.
- Treat all platform capabilities as permission- and account-type-specific.
- Request only permissions required by an implemented feature.
- Use secure storage for credentials/tokens only after a reviewed authentication design exists.
- Do not log access tokens, personal content, private messages, or sensitive user data.
- Apply privacy-by-design, data minimization, and user-controlled deletion/export.

## Code quality

- Prefer readable, typed, testable code over clever abstractions.
- Avoid giant widgets, god objects, duplicated business logic, and unbounded providers.
- Do not introduce a state-management or architecture pattern without explaining why it is needed.
- Keep dependencies minimal and justify new packages.
- Use immutable models where practical.
- Handle async cancellation, loading, and errors.
- Include database migrations for schema changes.
- Use deterministic tests and mock platform boundaries.
- Add comments for non-obvious behavior, not every line.

## Definition of done

A feature is not done until:
- its acceptance criteria are met;
- error/empty/loading states are handled;
- tests are added and pass;
- formatting and static analysis are clean, or remaining issues are documented;
- accessibility basics are considered;
- documentation is updated;
- platform and security claims are evidence-based.

## Communication format

At the end of each task, report:
1. Summary of delivered behavior.
2. Files created/changed.
3. Commands executed and results.
4. Tests executed and results.
5. Known limitations / unverified assumptions.
6. Exact next recommended task.

Do not say "complete" when only a scaffold or mock screen exists.
