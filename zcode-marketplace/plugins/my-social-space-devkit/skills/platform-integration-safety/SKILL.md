---
name: platform-integration-safety
description: Use before designing or implementing any third-party social platform connection, OAuth, feed, search, content playback, posting, messaging, deep link, or account integration.
---
# Platform Integration Safety

## Mandatory research before coding
For the exact provider and requested feature, verify current official developer documentation. Record API product, account eligibility, scopes, approvals, rate limits/pricing, OAuth constraints, content rules, branding rules, and data retention obligations.

## Capability-first design
Do not assume every provider supports a universal feed, messaging, publishing, profile, notifications, or watch-history API. Model capabilities explicitly and per account type/scope.

## Authentication
Use official OAuth/SDK flows. Validate redirect and state; use PKCE where supported/required. Do not embed login in a WebView if the provider forbids it. Never collect passwords or copy cookies from the provider's native app.

## Content
Do not scrape private feeds, reverse-engineer private endpoints, bypass bot detection, paywalls, DRM, or rate limits, or rehost copyrighted media without permission. Prefer official app launch, approved deep links, APIs, SDKs, and app-owned playback where permitted.

## Honest UX
Distinguish connected, launch-only, unsupported, permission-denied, expired, and unavailable. Never label a static page as a live connection. Never promise exact native app state or playback restoration without evidence.

## Security
Keep server secrets and provider refresh tokens server-side, encrypted, least-privileged, revocable, and out of logs. Apply user-scoped authorization and deletion.

## Required output
Cite official sources in project documentation, record an ADR, show the capability matrix, explain fallback behavior, and add tests for denied/revoked/not-installed/rate-limited states.
