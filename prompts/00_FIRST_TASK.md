# ZCode First Task — Inspect, Plan, Bootstrap and Implement Phase 1

You are working in the My Social Space repository. Read `AGENTS.md`, `docs/PRODUCT_VISION.md`, `docs/PRODUCT_REQUIREMENTS.md`, `docs/UX_UI_SPECIFICATION.md`, `docs/TECHNICAL_ARCHITECTURE.md`, `docs/PLATFORM_CAPABILITIES.md`, and `docs/ROADMAP.md` before editing.

## Goal

Create the Android-first Flutter application under `apps/mobile` and implement Phase 1 only.

## Step A — Inspect before changing

1. Inspect the entire workspace and Git status.
2. Check `flutter --version`, `dart --version`, `flutter doctor -v`, and available Android devices.
3. Identify whether an app already exists under `apps/mobile`; never overwrite existing work.
4. Report toolchain blockers and proposed Flutter/Dart/package versions.
5. Propose the exact folder structure and dependency list.

If Flutter is unavailable, do not invent a successful build. You may still prepare architecture documents and clearly report the blocker.

## Step B — Plan

Create an implementation plan with:
- features and acceptance criteria;
- files to create/change;
- dependencies and reasons;
- state/persistence design;
- tests;
- known limitations.

Do not begin implementation until the plan is coherent.

## Step C — Implement Phase 1

Build:
1. Flutter app shell and theme system.
2. Four persistent bottom tabs: Home, Notes, Agent Suggest, Settings.
3. Home horizontal pager containing YouTube, Facebook, Instagram, TikTok, X workspace pages.
4. Last-selected platform persistence using stable IDs, not raw page index.
5. Independent workspace state records or repository boundary.
6. Initial platform capability/status UI; make clear there is no live connection yet.
7. Notes local create/read/update/delete/search.
8. Agent Suggest static template catalogue with honest template labels.
9. Settings theme mode (system/light/dark).
10. Unit and widget tests for critical acceptance criteria.

Use Riverpod and GoRouter. Use SQLite for notes/workspace data and a small preferences store only for appropriate scalar settings. Check current packages before adding them.

## UX direction

Home is NOT a plain icon grid. It is a swipeable workspace pager:
- the last-used platform page is visible when the app opens;
- users swipe horizontally between platform pages;
- every page is independent;
- each page clearly explains whether it is launch-only, app-owned, connected, or unsupported;
- no fake social feed or fake login.

Keep the four bottom tabs visible. Use polished, restrained, premium Android UI, good spacing, clear type hierarchy, accessible labels, useful empty/error/loading states, and dark/light themes.

## Hard constraints

- Do not attempt to embed every native social app.
- Do not scrape private feeds or use cookies from other apps.
- Do not add OAuth, Supabase, FastAPI, AI provider, WebView, or platform-specific SDK integrations in this phase.
- Do not put secrets in code.
- Do not create a fake connected status or fake agent execution.
- Do not implement later phases under the label "Phase 1".

## Verification

Run:
- `dart format .`
- `flutter analyze`
- `flutter test`

Add tests for:
- first-launch default platform;
- restoration of last-used platform;
- unknown saved platform fallback;
- changing page updates persisted platform identity;
- tab navigation;
- Notes CRUD and search;
- theme preference persistence.

If an Android emulator/device is available, run the app and verify the four tabs and workspace swipe manually. Report whether device verification was actually performed.

## Documentation updates

Update:
- `docs/ROADMAP.md` with actual status;
- `docs/DECISION_LOG.md` for any new material decisions;
- `CHANGELOG.md`;
- `apps/mobile/README.md` with exact run commands.

## Final report

Provide:
1. What works.
2. Files created/changed.
3. Dependencies added and justification.
4. Commands run and their actual results.
5. Tests run and results.
6. Device/emulator verification status.
7. Known limitations.
8. The single most useful next task.

Do not mark Phase 1 complete if any P0 acceptance criterion is unverified or failing.
