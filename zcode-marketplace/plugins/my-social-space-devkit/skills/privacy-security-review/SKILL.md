---
name: privacy-security-review
description: Use when changing local persistence, authentication, OAuth, Supabase, FastAPI, API keys, content storage, permissions, analytics, logging, privacy, or data deletion in My Social Space.
---
# Privacy and Security Review

Review the change against least privilege and data minimization.

## Check
- Are new permissions genuinely necessary?
- Are secrets or provider tokens exposed in client code, assets, logs, or Git?
- Are social passwords or copied app cookies being collected? This is prohibited.
- Are URLs validated and unsafe schemes rejected?
- Are database queries parameterized?
- Are migrations safe and tested?
- Are user-owned cloud records protected by RLS and server-side authorization?
- Are OAuth state, redirect, PKCE, expiry, refresh, revocation, and disconnect handled?
- Is personal content logged unnecessarily?
- Can users delete/export their data?
- Are AI inputs treated as untrusted content rather than instructions?
- Are external side effects gated by explicit confirmation?

## Output
Classify findings as Blocker / High / Medium / Low. Give file references and concrete fixes. Do not claim security is complete without tests and a defined threat model.
