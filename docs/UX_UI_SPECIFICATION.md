# UX / UI Specification

## Overall experience

Premium, calm, minimal, and practical. Avoid a dense dashboard. The user should feel they are switching between personal social workspaces, not managing a marketing analytics tool.

Use a consistent spacing, typography, color, and component system. Support system/light/dark themes. Prioritize legibility and comfortable touch targets.

## Main navigation

A persistent bottom navigation bar with exactly four primary items:
- Home
- Notes
- Agent Suggest
- Settings

Use both icon and label or another accessible arrangement that does not depend on icon recognition alone. Keep the active destination obvious.

## Home screen — key design

### Structure

- Top app bar: My Social Space wordmark/title, current platform identity, and optional workspace actions.
- Main body: horizontal `PageView`/pager containing one workspace page per enabled platform.
- Page content: varies by adapter capability:
  - **Official app launch:** platform identity, concise explanation, and Open Platform action.
  - **Supported in-app content:** only content allowed by the platform API/SDK or app-owned playback/reader.
  - **App-owned workspace:** user-owned saved/resume items and navigation state.
  - **Not connected/unsupported:** explicit status and setup/help action.
- Optional page indicator or compact platform selector that supplements, not replaces, swipe gestures.
- Bottom navigation remains visible.

### Swipe behavior

- Left/right swipe changes the platform workspace.
- Vertical scrolling remains inside the active platform page.
- Do not use a full-screen horizontal gesture detector that steals child gestures. Prefer Flutter's pager behavior and test nested scroll interactions.
- Programmatic page changes (e.g., tapping a platform chip) and swipes must update one shared selected-platform state.
- Persist selection after a settled page change, not on every drag frame.
- Restore the persisted initial index before rendering the pager to avoid a flash on the wrong page.
- When platforms are reordered/disabled, handle index changes safely and choose a deterministic fallback.

### Last-used behavior

- On launch, show the last-selected platform page.
- Also persist each platform's app-managed state independently (e.g., last internal route key, last selected content reference, app-owned playback position). Do not imply access to native app state.
- If a deep link is available, it may reopen a particular item; confirm provider support before relying on it.
- Provide a user-visible indication when an item can only be opened in the official app.

## Notes screen

Recommended layout:
- Header: Notes and a visible create action.
- Search field.
- Filter chips or tags when tags exist.
- Note cards with title, short preview, date, tags, and source label.
- Detail/editor screen with title, rich-enough plain text body, optional URL, tags, collection, and Save action.
- Delete requires confirmation or a brief undo affordance.
- Empty state explains what the user can save.

MVP editor can use plain text; do not add complex rich-text dependencies without need.

## Agent Suggest screen

Recommended layout:
- Header: Agent Suggest.
- Natural-language prompt field: "What do you want help finding or doing?"
- Curated agent template cards, for example:
  - Learning Scout — find beginner-friendly learning resources.
  - AI & Tech Briefing — summarize selected tech sources.
  - Good News Curator — collect positive stories from chosen sources.
  - Research Organizer — organize links and notes.
- Each card must state purpose, required sources/permissions, and whether it is a template, configured agent, or executable agent.
- Detail view: inputs, sources, frequency, output format, permissions, and approval controls.
- In Phase 1 these can be static templates; label them "Templates" or "Examples", not active AI agents.

## Settings screen

Organize settings into readable groups:
- Appearance: system/light/dark.
- Home workspace: restore last-used, platform ordering/visibility (later phase).
- Platform connections: status and connection actions (later phase).
- Profiles: Study, Work, News, Entertainment (later phase).
- Content preferences: topics, formats, exclusions (later phase; app-owned feeds only).
- Notifications (later phase).
- Privacy & data: export/delete/local storage explanation.
- About: version, licenses, privacy policy link when available.

## Motion

- Smooth but restrained page transition.
- Avoid excessive bounce or decorative motion.
- Respect reduced-motion accessibility settings where practical.
- Avoid animation that delays interaction.

## Design acceptance checklist

- [ ] Four bottom tabs are visible and understandable.
- [ ] Home clearly communicates the active social platform.
- [ ] Swipe left/right changes platform pages.
- [ ] Each platform page has a distinct state and status.
- [ ] Last-used platform is restored on restart.
- [ ] Vertical scrolling inside workspace pages works.
- [ ] Notes, Agent Suggest, and Settings do not look like placeholder debug screens.
- [ ] Text scaling and screen readers are considered.
