# Architecture Decision Log

Record material architecture/product decisions here. Do not silently reverse an existing decision.

## ADR-0001 — Android-first Flutter client

**Status:** Accepted for initial development  
**Decision:** Build the first client in Flutter + Dart, targeting Android first.  
**Context:** The product requires a polished cross-platform UI architecture, but early validation should focus on Android device behavior and the user's current build environment.  
**Consequences:** Keep platform-specific integration behind adapters. Do not claim iOS parity until separately tested.

## ADR-0002 — Four-tab primary navigation

**Status:** Accepted  
**Decision:** Home, Notes, Agent Suggest, Settings are the four persistent primary destinations.  
**Context:** The user explicitly wants these sections as the main app structure.  
**Consequences:** Keep the main navigation stable. Add secondary destinations as nested routes, not extra bottom tabs without a product decision.

## ADR-0003 — Home is a swipeable platform workspace pager

**Status:** Accepted  
**Decision:** Home contains horizontally swipeable platform-specific workspaces and restores the last-used platform by stable platform ID.  
**Context:** The central product interaction is quick movement between social platforms without returning to a launcher grid.  
**Consequences:** The pager must handle reordering, platform enable/disable, app lifecycle, and local state restoration.

## ADR-0004 — No universal social-app embedding promise

**Status:** Accepted  
**Decision:** Platform access is capability-based: official app launching, approved links, official APIs/SDKs, or app-owned content experiences.  
**Context:** Third-party platforms control their authentication and content APIs. A generic Flutter wrapper cannot guarantee full native app embedding or exact session restoration.  
**Consequences:** Build capability checks and honest fallback states. Verify each integration against current official documentation.

## ADR-0005 — Local-first MVP

**Status:** Accepted  
**Decision:** Store workspace selection and Notes locally before adding user accounts or cloud sync.  
**Context:** Core experience should work without backend setup.  
**Consequences:** Design schema migrations and repositories so later sync can be introduced without replacing feature logic.
