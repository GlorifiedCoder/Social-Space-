---
name: flutter-ui-quality
description: Use when creating, refining, or reviewing My Social Space Flutter screens and interactions, especially the swipeable Home workspace, bottom navigation, Notes, Agent Suggest, and Settings.
---
# Flutter UI Quality

## Product UI direction
Premium, calm, minimal, clear, Android-friendly, responsive. Do not turn Home into an ordinary grid of social icons; its defining interaction is a horizontally swipeable platform workspace pager.

## Review
- Clear hierarchy and meaningful page title.
- Four primary destinations: Home, Notes, Agent Suggest, Settings.
- Selected bottom destination is obvious.
- Workspace page shows platform identity and true capability status.
- Horizontal swipe does not break vertical scrolling.
- Touch targets are comfortable.
- Icon-only actions have semantic labels/tooltips.
- Empty/loading/error/unsupported states are designed.
- Text scaling, contrast, and screen readers are considered.
- Dark/light/system themes are consistent.
- Motion is restrained and respects reduced motion where practical.

## Flutter implementation
Prefer PageView and nested scrollables with correct physics/gesture ownership. Avoid broad GestureDetectors that steal child gestures. Use stable keys and state boundaries. Do not use placeholder lorem ipsum or misleading live content. Use reusable components only where they reduce inconsistency, not to overabstract a single screen.

## Verification
Use widget tests for navigation and semantics. Run the app on an emulator/device when available. Report visual checks that were not performed.
