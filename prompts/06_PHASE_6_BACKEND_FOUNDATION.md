# Phase 6 — Backend Foundation

## Goal
Add a backend only for validated requirements such as cloud sync, identity, or real agent execution.

## Proposed stack
- FastAPI modular monolith;
- Supabase Auth;
- Supabase Postgres with RLS;
- server-side provider credentials;
- background task mechanism only when needed.

## Deliverables
- architecture and threat model;
- API contracts;
- local/cloud sync conflict strategy;
- authenticated endpoints;
- user-scoped database schema and RLS policies;
- request validation, rate limiting, logs with redaction;
- tests for cross-user isolation;
- environment variable examples without secrets.

## Security constraints
- Never expose Supabase service-role key to Flutter.
- Never trust client-supplied user ID as authorization.
- Provider OAuth tokens remain server-side, encrypted, scoped, and revocable.
- Do not log tokens or private content.
- Local-first functionality must handle offline and sync failure safely.

## Acceptance
Document deployed services and environment setup. Demonstrate RLS isolation tests. Do not claim production readiness without security review.
