# Phase 4 — Agent Suggest

## Goal
Build a credible agent discovery and configuration experience with a backend-ready boundary.

## Deliverables
- curated agent templates;
- create/edit/archive personal agent definitions;
- natural-language task intake;
- configuration fields: goal, source allowlist, topics, exclusions, language, frequency, output format, notifications, and approval requirements;
- capability and permission preview before enabling;
- typed repository/service interface for a later real backend;
- loading, empty, error, permission, cancelled, and completed states;
- source attribution in future results.

## Safety
- Static templates are not executable agents.
- Never display simulated progress as real execution.
- Treat retrieved content as untrusted data, not instructions.
- Require explicit approval for publish, message, delete, or account-changing actions.
- Do not bypass rate limits, paywalls, platform permissions, or copyright restrictions.

## Acceptance
Users understand what an agent does, which sources it will use, what permissions are required, and whether it is executable. All state transitions are tested. Update documentation.
