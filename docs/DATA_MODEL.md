# Data Model

## Principles

- Use stable UUIDs or deterministic internal IDs.
- Store timestamps in UTC; format for local display.
- Keep provider-specific data isolated.
- Store only what is needed for the feature and user consent.
- Use schema migrations from the first persisted release.
- Do not store platform passwords, cookies, or copied native-app session state.

## Local MVP entities

### `platform_definitions`

| Field | Type | Notes |
|---|---|---|
| id | TEXT PK | Stable key such as `youtube` |
| display_name | TEXT | User-visible name |
| icon_key | TEXT | Internal icon mapping |
| is_enabled | INTEGER | Boolean |
| sort_order | INTEGER | User-defined order |
| integration_status | TEXT | `not_configured`, `launch_only`, `connected`, `unsupported` |
| updated_at | TEXT | ISO-8601 UTC |

### `workspace_states`

| Field | Type | Notes |
|---|---|---|
| platform_id | TEXT PK/FK | One state record per platform |
| last_internal_route | TEXT nullable | App-owned route only |
| last_content_reference | TEXT nullable | Permitted reference/deep link |
| last_position_seconds | REAL nullable | Only app-owned supported playback |
| last_visited_at | TEXT nullable | ISO-8601 UTC |
| metadata_version | INTEGER | Migration/version control |

### `app_preferences`

A singleton settings record or key/value table:
- `last_selected_platform_id`
- `theme_mode`
- `default_home_behavior`
- `onboarding_completed`
- `updated_at`

For ordered platform IDs and complex preferences, use normalized rows or versioned JSON with validation; do not build fragile ad-hoc serialized objects.

### `notes`

| Field | Type | Notes |
|---|---|---|
| id | TEXT PK | UUID |
| title | TEXT | Required |
| body | TEXT | Plain text MVP |
| source_url | TEXT nullable | Validate scheme and host |
| source_platform_id | TEXT nullable | Reference to platform definition |
| collection_id | TEXT nullable | Optional collection |
| created_at | TEXT | UTC |
| updated_at | TEXT | UTC |

### `note_tags`

- `note_id`
- `tag`
- composite uniqueness on `(note_id, tag)`

### `note_collections`

- `id`
- `name`
- `created_at`
- `updated_at`

## Later cloud data (not Phase 1)

Potential user-scoped tables:
- `profiles`
- `social_accounts`
- `oauth_connections` (encrypted provider credentials only on server)
- `platform_capabilities`
- `saved_content`
- `agent_definitions`
- `agent_runs`
- `discovery_requests`
- `discovery_results`
- `content_preferences`
- `sync_jobs`

Each user-owned table must include a user identifier and strict row-level access policies. Provider tokens must not be readable by ordinary client queries.

## Migration strategy

- Create initial schema version `1`.
- Store the schema version using SQLite's supported migration mechanism.
- Every schema change must include an upgrade migration and tests from prior schema versions where feasible.
- Do not drop user data in migrations.
- Test fresh install and upgrade paths.
