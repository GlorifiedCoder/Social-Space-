# Technical Architecture

## Architecture strategy

Start with a **modular Flutter application**, not microservices. Keep feature boundaries clear and isolate external platform behavior behind adapters. Add backend services only when a real requirement needs them.

## Technology choices

| Concern | Proposed technology | Notes |
|---|---|---|
| App | Flutter / Dart | Android first |
| State | Riverpod | Use providers for feature state and dependency injection |
| Navigation | GoRouter | Four primary routes plus nested detail routes |
| Durable local data | SQLite | Notes, platform configs, workspace state |
| Small preferences | Shared preferences or equivalent | Theme and tiny scalar settings only |
| Links / app launch | Maintained Flutter packages + Android platform APIs | Verify plugin health and platform behavior |
| Backend | FastAPI | Later; API gateway and AI orchestration |
| Cloud identity/data | Supabase Auth + Postgres | Later; row-level security |
| Background tasks | Add only when sync/agent use case requires it | Avoid early complexity |

The agent must verify current stable package versions and Android compatibility at the time of implementation.

## Proposed Flutter directory structure

```text
apps/mobile/
├── android/
├── lib/
│   ├── main.dart
│   ├── app/
│   │   ├── app.dart
│   │   ├── router.dart
│   │   └── theme/
│   ├── core/
│   │   ├── database/
│   │   ├── errors/
│   │   ├── logging/
│   │   ├── persistence/
│   │   ├── platform/
│   │   └── widgets/
│   ├── features/
│   │   ├── home/
│   │   │   ├── data/
│   │   │   ├── domain/
│   │   │   ├── application/
│   │   │   └── presentation/
│   │   ├── notes/
│   │   ├── agent_suggest/
│   │   └── settings/
│   └── shared/
├── test/
├── integration_test/
├── pubspec.yaml
└── analysis_options.yaml
```

Keep this pragmatic. Do not create empty layers or abstractions with no current use.

## Core domain concepts

### PlatformDefinition

A catalogue definition:
- `id` (stable internal id, e.g. `youtube`)
- `displayName`
- `iconAsset` or icon key
- `brandColor` (optional; not a source of truth)
- `isEnabled`
- `sortOrder`
- `integrationStatus`

### PlatformConnection

A connection instance for a user/account:
- `id`
- `platformId`
- `accountLabel` (safe display label only)
- `status`
- `grantedScopes` (only actual provider-granted scopes)
- `connectedAt`
- `lastValidatedAt`

Phase 1 has no real connected accounts; use local platform definitions and `notConfigured` or `launchOnly` states.

### WorkspaceState

Persist one record per platform workspace:
- `platformId`
- `lastInternalRoute` (only app-owned route key)
- `lastContentReference` (only a permitted app-owned or deep-link reference)
- `lastPositionSeconds` (only for media played in app-owned supported player)
- `lastVisitedAt`
- `metadataVersion`

### AppPreferences

- `lastSelectedPlatformId`
- `themeMode`
- `platformOrder`
- `enabledPlatformIds`
- `defaultHomeBehavior`

### Note

- `id`
- `title`
- `body`
- `sourceUrl` (nullable)
- `sourcePlatformId` (nullable)
- `tags`
- `collectionId` (nullable)
- `createdAt`
- `updatedAt`

## Platform adapter boundary

Define an interface based on truthful capabilities, not a fantasy universal API. Methods should be capability-specific and optional/unsupported when unavailable. Example responsibilities:
- report capabilities for this platform/account/build;
- open official app or verified deep link;
- begin approved OAuth through an external user-agent or provider-supported SDK;
- request only permitted public/user-authorized data;
- render approved content through the app-owned player/reader;
- map provider errors into safe user-facing results.

Do not require every adapter to implement a universal `getFeed`, `getMessages`, `publish`, or `getWatchHistory` method. Prefer capabilities such as `canLaunchOfficialApp`, `canOpenDeepLink`, `canSearchPublicContent`, `canReadAuthorizedProfile`, `canPublishForAccountType`, and `canPlayInApp`.

## State restoration design

- Load persisted preferences and platform catalogue before creating the Home pager's initial page.
- Store `lastSelectedPlatformId` rather than relying only on an integer index. An index becomes invalid after reorder/disable.
- Resolve the ID to the current enabled list when building the pager.
- Persist selection after page settlement.
- Persist workspace state keyed by `platformId`; do not share a single mutable route state across pages.
- For process death, restore only serialized app-owned state. Never assume the operating system will preserve an embedded WebView JavaScript runtime.
- Add tests for no saved selection, valid saved selection, deleted/disabled saved platform, reorder, and corrupt/stale persistence.

## Suggested database tables (local MVP)

- `platform_definitions`
- `workspace_states`
- `app_preferences`
- `notes`
- `note_tags` or normalized tags if required
- `note_collections`

Start with a small SQLite schema and migrations. Do not over-normalize before search and editing needs are clear.

## Later backend boundary

When cloud sync or real agent execution is justified:
- Flutter → FastAPI API.
- FastAPI → Supabase Auth verification, Postgres, provider integrations, AI services.
- Provider OAuth tokens are stored server-side, encrypted, scoped, revocable, and never returned to the client.
- Use Supabase Row Level Security for user-owned records.
- Use background workers for longer tasks rather than holding mobile HTTP requests open.

## Error handling

Use typed application errors or feature result types:
- unsupported capability;
- app not installed;
- connection missing/revoked;
- permission denied;
- network unavailable;
- provider rate-limited;
- invalid/dead deep link;
- local persistence failure.

User-facing copy must distinguish "not supported" from "temporarily unavailable".

## Observability

- Use structured logs with redaction.
- Do not log access tokens, private messages, full note bodies, sensitive URLs, or personal content by default.
- Add analytics only with clear disclosure and user controls.
