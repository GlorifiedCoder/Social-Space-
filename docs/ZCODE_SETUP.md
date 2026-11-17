# ZCode Setup Reference

This workspace is structured around ZCode's documented project and plugin conventions.

## Project instructions

The root `AGENTS.md` contains stable project-wide rules. Open this repository root as the ZCode workspace so those instructions are available for project tasks.

Official documentation:
- ZCode Agent / project instructions: https://zcode.z.ai/en/docs/agents

## Skills

A ZCode skill is a directory containing `SKILL.md`, with YAML frontmatter including `name` and `description`. This kit includes six focused skills in the bundled plugin. ZCode can invoke them by `$skill-name` after the plugin is installed and enabled.

Official documentation:
- Skills: https://zcode.z.ai/en/docs/skill

## Local plugin marketplace

The `zcode-marketplace/` directory contains `marketplace.json` and a plugin under `plugins/my-social-space-devkit/`. The plugin bundles:
- six skills;
- four slash commands;
- four subagents.

Add the local marketplace directory through Settings → Plugins → Create → Add marketplace, then install and enable the plugin.

Official documentation:
- Plugins and local marketplace: https://zcode.z.ai/en/docs/plugin

## Important behavior

- `AGENTS.md` is loaded as workspace instructions; it is not the same thing as project memory.
- ZCode documents that it reads the current workspace `AGENTS.md`; do not rely on nested `AGENTS.md` files or imports.
- Skills need valid `name` and `description` frontmatter.
- After changing skills, refresh the Skills page.
- Enabling a plugin grants its components access to the Agent workflow. Review plugin content before enabling.
- This kit intentionally does not include hooks or MCP servers. The plugin is Markdown/JSON-only and does not execute custom scripts.

Documentation was checked on 17 November 2026. ZCode UI labels and supported formats may change; consult the official docs if the client differs.
