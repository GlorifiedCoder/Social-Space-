# Phase 2 — Workspace Engine

## Goal
Strengthen the platform workspace pager and local per-platform state.

## Deliverables
- stable platform catalogue and repository;
- user enable/disable/reorder settings;
- stable selected platform identity across reorder;
- one independent workspace-state record per platform;
- app-owned last route/content reference/resume metadata;
- official-app launch interface and failure handling;
- safe URI/deep-link validation;
- lifecycle and restoration tests.

## Rules
- A state record may represent only state owned by My Social Space or explicitly supplied by an approved provider.
- Do not read external app private navigation state.
- Do not copy native app cookies, storage, or credentials.
- Do not use a generic WebView as a substitute for official app integration.
- Verify current Android intent and link behavior on-device.

## Tests
- first install;
- restart;
- process death;
- reorder;
- disable selected platform;
- uninstall target app;
- malformed or unsupported deep link;
- per-platform state isolation.

## Acceptance
Meet Phase 2 exit gate in `docs/ROADMAP.md`. Update docs and changelog.
