---
name: workspace-state-restoration
description: Use when implementing the My Social Space Home pager, last-used platform selection, per-platform workspace memory, lifecycle handling, reordering, or process-restart restoration.
---
# Workspace State Restoration

## Core rule
Persist the last-selected platform by stable platform ID, never only by list index. Keep an independent workspace-state record per platform.

## Design checklist
1. Load preferences and enabled platform definitions before initializing the pager.
2. Resolve saved platform ID against the current enabled catalogue.
3. Choose a deterministic fallback if the saved ID is absent, disabled, or invalid.
4. Initialize the pager at the resolved page without a visible jump.
5. Keep selected ID and pager position synchronized for both swipe and programmatic selection.
6. Persist after the page transition settles, not on every drag update.
7. Keep state keyed by platform ID so reorder does not attach one platform's state to another.
8. Use stable widget keys and preserve local page state only where appropriate.
9. Save only app-owned routes, app-owned content references, or provider-authorized deep links.
10. Save playback position only when My Social Space controls playback in a supported player.

## Lifecycle and failure cases
Test fresh install, warm resume, process restart, platform reorder, selected platform disable/delete, empty platform list, corrupt preference, and database read/write failure.

## Never do
- Read another app's private saved state.
- Copy cookies or WebView storage from another app.
- Claim another app's native playback position can be restored.
- Assume a WebView's JavaScript runtime survives process death.

## Required output
State model, repository behavior, restoration algorithm, tests, and limitations.
