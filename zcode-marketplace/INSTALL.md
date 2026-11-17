# Install the My Social Space ZCode Developer Kit

This folder is a local ZCode plugin marketplace. It provides reusable skills, slash commands, and subagents for this repository.

## Install

1. Open the extracted project folder as a ZCode workspace.
2. In ZCode, open **Settings → Plugins**.
3. Click **Create → Add marketplace**.
4. Choose the local directory `zcode-marketplace` (the directory containing `marketplace.json`).
5. Find **my-social-space-devkit** in the Personal marketplace section.
6. Inspect the plugin contents, then click Install and enable it.
7. Open **Settings → Skills** and refresh if needed.
8. Open **Settings → Subagents** to confirm agents appear.

## Use the commands

- `/start-phase 1` — inspect current state and begin a requested phase.
- `/implement-feature <feature>` — plan and implement a focused feature.
- `/review-changes` — review the current diff for regressions and risks.
- `/close-phase <phase>` — verify acceptance criteria and update progress docs.

## Invoke skills

Type `$` in the ZCode chat input and select:
- `flutter-feature-implementation`
- `workspace-state-restoration`
- `platform-integration-safety`
- `flutter-ui-quality`
- `privacy-security-review`
- `test-and-release`

## Security

This plugin intentionally contains no hooks, MCP servers, executable scripts, or external network integrations. It consists of instruction Markdown and JSON manifests. Still review any plugin before enabling it, and do not install plugins from sources you do not trust.
