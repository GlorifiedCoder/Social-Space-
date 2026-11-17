# Test Strategy

## Test pyramid

1. **Unit tests:** models, repositories, workspace selection rules, validators, use cases.
2. **Widget tests:** four-tab navigation, pager, note forms, empty states, accessibility semantics.
3. **Integration tests:** app startup, persisted platform selection, Notes CRUD through restart, official app launch behavior where testable.
4. **Manual device checks:** gestures, screen sizes, app lifecycle, Android back behavior, real external app/deep link behavior.

## Phase 1 critical tests

### Workspace state
- Fresh install selects documented default platform.
- Existing saved platform is restored on restart.
- A platform page change persists only after page settlement.
- Unknown saved platform ID falls back safely.
- Disabled/missing saved platform selects deterministic fallback.
- Reordering does not change the selected platform identity.
- Each platform state remains isolated.

### Navigation
- Each bottom tab opens the correct screen.
- Re-selecting current tab behaves consistently.
- Android back does not produce a navigation loop.
- Horizontal pager and vertical child scroll do not fight each other.

### Notes
- Create note.
- Edit note.
- Delete note.
- Search title and body.
- Empty search and no-results states.
- Persistence after repository reload / app restart.
- Invalid URL is rejected or safely normalized.

### Agent Suggest
- Template catalogue renders.
- Template details show required sources/permissions.
- Static template is not labeled as an executed agent.
- External side-effect actions are not exposed without an approval flow.

### Settings
- Theme setting persists.
- Reset behavior is predictable.
- Accessibility labels exist for icon-only controls.

## Required commands

Before phase completion:
```powershell
dart format .
flutter analyze
flutter test
```

Record exact output and any skipped tests. Do not report "all tests pass" if the test command was not run.
