# Product Requirements Document

## Scope and priorities

Priority levels:
- **P0:** required for the first usable release.
- **P1:** important follow-up.
- **P2:** later expansion.

## Global navigation

| ID | Requirement | Priority | Acceptance |
|---|---|---:|---|
| NAV-01 | Provide Home, Notes, Agent Suggest, Settings bottom destinations | P0 | Each destination opens and preserves expected state |
| NAV-02 | Show a clear selected-tab state | P0 | Selected tab is visually and semantically exposed |
| NAV-03 | Preserve tab navigation state where appropriate | P1 | Returning to a tab does not unexpectedly reset its local state |
| NAV-04 | Support Android back behavior | P0 | Back navigation is predictable and does not exit unexpectedly |

## Home / Workspace

| ID | Requirement | Priority | Acceptance |
|---|---|---:|---|
| HOME-01 | Show a horizontally swipeable page for each enabled platform | P0 | Swiping left/right changes the active workspace |
| HOME-02 | Restore last-used platform on app launch | P0 | Relaunch starts on the previously selected page |
| HOME-03 | Persist selected platform after page changes | P0 | Selection survives process restart |
| HOME-04 | Keep platform workspace identities independent | P0 | A page's local state does not overwrite another page's state |
| HOME-05 | Show platform name/identity and integration status | P0 | User can distinguish connected, launch-only, unsupported, and not-configured states |
| HOME-06 | Allow an official-app open action when an app/deep link is supported | P1 | Launch result and failure are handled accurately |
| HOME-07 | Allow platform order and enabled state to be customized | P1 | Changes persist and reorder the pager |
| HOME-08 | Restore app-managed route/scroll/resume metadata where implemented | P1 | Restoration is scoped to app-owned content only |
| HOME-09 | Provide a sensible empty state when no platforms are configured | P0 | User can add/configure a platform |
| HOME-10 | Avoid conflict between horizontal pager swipe and vertical page scrolling | P0 | Gesture tests and manual checks pass |

### Initial platform catalogue

Seed the workspace catalogue with:
- YouTube
- Facebook
- Instagram
- TikTok
- X

The catalogue entries in Phase 1 are local workspace definitions only. They are not live connections and must be labeled accordingly.

## Notes

| ID | Requirement | Priority | Acceptance |
|---|---|---:|---|
| NOTE-01 | Create a note with title and body | P0 | Note is persisted |
| NOTE-02 | Edit a note | P0 | Updated data and timestamp persist |
| NOTE-03 | Delete a note with confirmation/undo | P0 | Note is removed safely |
| NOTE-04 | Search notes | P0 | Search finds title/body matches |
| NOTE-05 | Add optional tags and category/collection | P1 | Metadata is editable and searchable |
| NOTE-06 | Save a content URL with source platform and title | P1 | Link reference persists and can be reopened |
| NOTE-07 | Show empty/loading/error states | P0 | States are not blank or misleading |

## Agent Suggest

| ID | Requirement | Priority | Acceptance |
|---|---|---:|---|
| AGENT-01 | Show a catalogue of suggested agent templates | P0 | Templates are clearly distinguished from running agents |
| AGENT-02 | Show agent detail, purpose, inputs, and expected output | P0 | User can understand capability before creating |
| AGENT-03 | Allow user to draft an agent request | P1 | Draft persists locally or is clearly session-only |
| AGENT-04 | Show execution state only when a real backend exists | P0 | No fake "working/completed" status |
| AGENT-05 | Require confirmation before external side effects | P0 | Publish/send/delete actions need user approval |

## Settings

| ID | Requirement | Priority | Acceptance |
|---|---|---:|---|
| SET-01 | Theme: system/light/dark | P0 | Selection persists |
| SET-02 | Platform enable/order settings | P1 | Settings affect Home pager and persist |
| SET-03 | Default start behavior | P1 | Last-used is default; user may choose another supported option |
| SET-04 | Privacy and local data controls | P1 | Explain stored data and provide clear actions |
| SET-05 | Profile/mode configuration | P2 | Each profile can have separate preferences |
| SET-06 | Notification preferences | P2 | Do not request notification permission before feature needs it |

## Non-functional requirements

- Android-first; target current supported Flutter stable channel and document minimum Android SDK chosen by the project.
- Responsive to common Android phone sizes.
- Accessible labels, touch targets, contrast, and text scaling.
- Local persistence must be migration-ready.
- No secrets committed to Git or bundled in client source.
- No high-risk permissions requested without a concrete feature.
- Test critical state restoration and data persistence.
