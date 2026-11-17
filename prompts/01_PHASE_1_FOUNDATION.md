# Phase 1 — App Foundation

Read `AGENTS.md` and the product, UX, architecture, and test documents.

## Goal
Build a usable local-first application shell with four tabs and the defining swipeable Home workspace.

## Deliverables
- Flutter app under `apps/mobile`.
- Riverpod + GoRouter integration.
- System/light/dark theme.
- Persistent bottom navigation: Home, Notes, Agent Suggest, Settings.
- Horizontally swipeable platform workspace pager.
- Seed catalogue: YouTube, Facebook, Instagram, TikTok, X.
- Stable-ID restoration of last-selected platform.
- Local Notes CRUD/search.
- Static Agent Suggest templates.
- Basic Settings.
- Unit/widget tests.

## Critical implementation detail
Persist `lastSelectedPlatformId`, not just an integer index. Load it before initializing the pager. Persist only after a page transition settles. A deleted/disabled platform must fall back safely.

## Do not build
- live OAuth;
- platform feed scraping;
- cross-platform messages;
- publishing;
- AI execution;
- cloud sync;
- universal WebView wrapper.

## Acceptance
Use the Phase 1 exit gate in `docs/ROADMAP.md` and all P0 criteria in `docs/PRODUCT_REQUIREMENTS.md`.

## Finish
Run formatter, analyzer, and tests. Update roadmap, decision log, changelog, and app README. Report anything not verified.
