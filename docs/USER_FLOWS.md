# Primary User Flows

## Flow A — First launch

1. App opens.
2. Load local preferences and platform catalogue.
3. If no last-used platform exists, choose the documented default (YouTube) or first enabled platform.
4. Render Home pager at the resolved stable platform ID.
5. Show each platform's actual local integration status.
6. User swipes to another workspace.

## Flow B — Return to last-used workspace

1. User opens Home and selects a different platform by swipe or selector.
2. Once page transition settles, persist that platform's stable ID.
3. User closes or Android terminates the process.
4. On next launch, load preferences before initializing the pager.
5. Resolve the saved ID against enabled platforms.
6. Render that workspace without briefly showing a different page.
7. If unavailable, use a deterministic fallback and update stored selection.

## Flow C — Platform page action

1. User opens a platform workspace.
2. Page displays current capability state.
3. If official app launch is supported, user taps Open Platform.
4. App attempts to open a verified app URI or URL.
5. Handle missing app, unsupported link, and failure without claiming success.
6. If no in-app feed API exists, show the launch-only experience rather than a fake feed.

## Flow D — Save a note

1. User opens Notes.
2. Taps New Note.
3. Enters title and body; optionally adds a source URL and platform.
4. Saves.
5. Repository persists locally.
6. Notes list updates and search can find it.

## Flow E — Agent template discovery

1. User opens Agent Suggest.
2. Browses a template card.
3. Opens detail.
4. Sees purpose, required sources, permissions, expected output, and execution status.
5. User can save/configure a template.
6. Until a real agent backend exists, the app does not show a fake run as completed.

## Flow F — Change appearance

1. User opens Settings.
2. Chooses System, Light, or Dark.
3. Preference is persisted.
4. App theme updates consistently across all tabs.
