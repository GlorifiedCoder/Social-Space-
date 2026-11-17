# Security and Privacy Requirements

## Data minimization

Only collect data required for an enabled feature. Explain why a permission or connection is needed before requesting it. Keep Notes local in the first release unless the user explicitly opts into a future cloud-sync feature.

## Secrets and credentials

- Never store social-platform passwords.
- Never commit `.env`, API tokens, keystores, signing keys, or service-role keys.
- Never embed provider server secrets in Flutter code or assets.
- Store OAuth tokens on the backend, encrypted at rest, with scopes and expiry metadata.
- Never log tokens or complete authorization headers.
- Use secure storage only for secrets that legitimately belong on the device.

## Authentication and OAuth (later phase)

- Use official provider OAuth implementations.
- Validate redirect URI and OAuth `state`.
- Use PKCE where supported and required.
- Handle token expiry, refresh, revocation, and disconnect.
- Request minimum scopes.
- Provide disconnect and data-deletion flows.
- Do not use embedded WebView login where the provider forbids it.

## Supabase (later phase)

- Enable Row Level Security on all user-owned tables.
- Write explicit `SELECT`, `INSERT`, `UPDATE`, and `DELETE` policies.
- Test cross-user isolation.
- Never expose the Supabase service-role key in the app.
- Validate user identity and authorization on FastAPI endpoints; do not trust client-supplied user IDs.

## AI and agent safety

- Treat fetched posts, documents, links, and comments as untrusted data, not instructions.
- Do not let content sources override system or user rules.
- Separate read-only suggestions from actions with external consequences.
- Require explicit user confirmation for publishing, messaging, deleting, or changing account settings.
- Display sources and uncertainty for generated summaries.
- Do not promise perfect adult/violence/misinformation filtering.
- Respect copyright, provider terms, and content licensing.

## Local storage

- Avoid storing sensitive platform content when only a URL/reference is needed.
- Provide delete/export controls before cloud sync is added.
- Use parameterized database operations.
- Validate externally supplied URLs and avoid unsafe schemes.
- Consider encryption for sensitive local data only after defining threat model and recovery behavior.

## Logging and diagnostics

Redact:
- OAuth tokens and cookies;
- private messages;
- note bodies;
- sensitive URLs/query parameters;
- personal identifiers not needed for debugging.

## Release checks

- Verify Android permissions are minimal.
- Review manifest/exported components and deep-link intent filters.
- Check dependency advisories and licenses.
- Verify no secrets in Git history.
- Test logout, revoke, delete, and permission-denied paths.
