# Phase 7 — Platform Integrations (One Provider at a Time)

## Goal
Implement one valuable, approved platform capability at a time.

## Mandatory preflight research
For the chosen provider, verify current official documentation for:
- API product and endpoint;
- account eligibility/type;
- review/approval;
- OAuth flow and redirect;
- scopes and data limitations;
- rate limits and pricing;
- content/branding rules;
- terms, privacy and retention requirements.

Record evidence and decisions in `docs/PLATFORM_CAPABILITIES.md` and a new ADR before coding.

## Implementation rules
- Use an official SDK/API or verified deep link.
- Support external official-app launching as fallback where appropriate.
- No private feed scraping or reverse-engineered endpoints.
- No copied cookies/session files.
- No universal getFeed/getMessages/getWatchHistory assumption.
- Distinguish app-owned playback from playback in external apps.
- For playback inside our app, record progress only when permitted and technically controlled.

## Test matrix
- app installed / not installed;
- signed in / signed out;
- permission granted / denied;
- token expired / revoked;
- account unsupported;
- rate-limited / network unavailable;
- malformed link;
- provider API unavailable.

## Acceptance
Complete the provider-specific capability matrix and tests. Do not begin the next provider until the first integration's limitations and error handling are documented.
