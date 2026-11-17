# Development Roadmap

The phases are sequential gates. Do not skip ahead because a later screen can be mocked.

## Phase 0 — Discovery and architecture
**Status:** Starter kit prepared; implementation discovery still required.

Deliver:
- verify Flutter, Dart, Android SDK, emulator/device, and Git;
- inspect workspace and confirm target SDK/minimum supported Android version;
- finalize folder structure and dependency versions;
- record integration constraints and any product decisions;
- create initial Flutter app in `apps/mobile`.

Exit gate:
- app scaffold builds and runs on Android;
- architecture and package choices documented;
- no provider integration assumptions are presented as facts.

## Phase 1 — App foundation
**Priority:** P0

Build:
- theme and design tokens;
- GoRouter shell with Home, Notes, Agent Suggest, Settings;
- persistent bottom navigation;
- swipeable Home workspace pager;
- local platform catalogue (YouTube, Facebook, Instagram, TikTok, X);
- persistent `lastSelectedPlatformId`;
- initial platform pages with honest "not connected / open official app / unsupported" states;
- local Notes CRUD and search;
- static Agent Suggest template catalogue;
- basic Settings, including theme mode;
- unit/widget tests.

Exit gate:
- all requirements in `docs/PRODUCT_REQUIREMENTS.md` for P0 pass;
- startup restores prior platform without incorrect initial-page flash;
- notes persist after force-close/relaunch;
- `dart format`, `flutter analyze`, and tests pass.

## Phase 2 — Workspace engine
**Priority:** P0/P1

Build:
- stable platform IDs and reorder-safe pager state;
- independent per-platform app-managed route and resume metadata;
- platform add/remove/reorder/enable settings;
- official-app launch abstraction and app-installed handling;
- safe URL/deep-link validation;
- per-platform state restoration tests.

Exit gate:
- reorder/disable operations cannot corrupt selection;
- app-owned state restores independently per platform;
- unsupported external state restoration is clearly disclosed.

## Phase 3 — Notes and knowledge library
**Priority:** P0/P1

Build:
- tags and collections;
- save link flow and share-intent intake only where implemented and tested;
- duplicate detection;
- export and delete controls;
- URL opening and failure states.

Exit gate:
- local library can be searched, edited, exported, and deleted;
- source attribution is retained;
- no unsupported content extraction is performed.

## Phase 4 — Agent Suggest
**Priority:** P1

Build:
- user-created agent templates;
- structured agent configuration (purpose, sources, topics, exclusions, schedule, output);
- backend contract and mockable execution boundary;
- real read-only discovery integration only after provider/source review;
- source attribution and uncertainty.

Exit gate:
- template and executable status are distinct;
- real runs are observable and cancellable;
- external side effects always require approval.

## Phase 5 — Settings and personalization
**Priority:** P1/P2

Build:
- per-profile preferences;
- platform ordering and enabled state;
- home defaults;
- appearance and accessibility settings;
- app-owned content preferences and user data controls.

Exit gate:
- settings persist and have clear precedence;
- user can reset and export where required;
- unsupported platform filtering is never represented as changing the provider's native app.

## Phase 6 — Backend foundation
**Priority:** P1

Build only after a concrete cloud feature needs it:
- FastAPI modular backend;
- Supabase Auth and Postgres;
- user data RLS;
- sync contracts and conflict strategy;
- provider token vault boundary;
- server-side AI orchestration;
- logs, rate limits, and request validation.

Exit gate:
- cross-user isolation tests pass;
- secrets stay server-side;
- cloud sync failure does not corrupt local data.

## Phase 7 — Platform integrations
**Priority:** P1/P2, one provider at a time

For each provider:
- research current official developer docs;
- verify product, scopes, account types, review, rate limits, price and terms;
- implement only approved capabilities;
- add app-launch/deep-link fallback;
- test signed-in, signed-out, denied, revoked, app-not-installed, and rate-limited paths;
- document what is and is not supported.

Do not build all platforms in parallel. Choose the integration with the clearest useful and permitted user journey.

## Phase 8 — QA, security and release
**Priority:** P0 for any public release

- device matrix;
- accessibility;
- performance and memory;
- migration and backup behavior;
- dependency and license review;
- privacy policy and data handling disclosures;
- Android signing and release pipeline;
- staged internal testing;
- crash reporting and rollback strategy.

## Change control

A phase is not complete because the screen renders. It must meet the exit gate, test requirements, and documentation requirements.
