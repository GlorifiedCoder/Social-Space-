# My Social Space — ZCode Starter Workspace

A product and engineering starter kit for building **My Social Space**, an Android-first, Flutter-based personal social-media workspace.

> **This archive is a development kit, not a finished Android application.** It contains the product definition, architecture, phased build instructions, ZCode project rules, skills, commands, and review agents. The first ZCode task will create the Flutter application scaffold and implement Phase 1.

## Product in one sentence

My Social Space gives a user one personal place to move between their social platforms, continue from their last app-managed workspace, save useful information, discover AI agents, and customize their experience.

## The four main app tabs

1. **Home** — a horizontally swipeable set of social-platform workspaces. Opening the app returns to the last-used platform workspace. Each platform has its own app-managed navigation and resume state where supported.
2. **Notes** — save, organize, search, edit, and revisit useful notes and content links.
3. **Agent Suggest** — discover useful AI agents, create personal agents, and describe tasks in natural language.
4. **Settings** — customize platform order, home behavior, appearance, profiles, privacy, and notifications.

## Important product boundary

A Flutter app cannot freely place another company's native app screen inside its own interface, read another app's private navigation history, or restore its exact video playback position without a supported integration. Build the workspace engine around capabilities that each platform actually permits. Use official app launching, verified deep links, approved APIs/SDKs, and app-owned playback/content experiences. Never scrape private feeds, steal cookies, collect platform passwords, or bypass OAuth restrictions.

The first implementation phase must deliver a polished, working workspace shell with local persistence. Do not fake real social platform integrations.

## Quick start

1. Extract this folder.
2. Open the extracted `My_Social_Space_ZCode_Starter` folder as a **ZCode workspace**.
3. Read `START_HERE.md`.
4. Ensure Flutter and Android tooling are installed. See `docs/BUILD_GUIDE.md`.
5. Optional: install the bundled ZCode development plugin. Follow `zcode-marketplace/INSTALL.md`.
6. Start a new ZCode task and paste the prompt in `prompts/00_FIRST_TASK.md`.
7. Ask ZCode to plan and implement **Phase 1 only**.

## Recommended stack

| Area | Initial choice |
|---|---|
| Mobile | Flutter + Dart |
| First target | Android |
| State management | Riverpod |
| Navigation | GoRouter |
| Local persistence | SQLite (via a maintained Flutter package) + lightweight preferences |
| External app/deep links | Android intents / supported deep links through maintained Flutter packages |
| Backend later | FastAPI |
| Cloud auth/database later | Supabase |
| AI services later | Server-side provider abstraction; never ship secret API keys in the app |

The agent must verify current package versions and compatibility before adding dependencies. Avoid pinning stale versions from this document.

## Repository map

```text
My_Social_Space_ZCode_Starter/
├── AGENTS.md
├── START_HERE.md
├── README.md
├── CHANGELOG.md
├── .gitignore
├── .env.example
├── apps/mobile/                  # Flutter app will be created here
├── docs/                         # Product, architecture, UX, security, QA, roadmap
├── prompts/                      # One focused ZCode prompt per phase
├── scripts/                      # Windows setup/check helpers
└── zcode-marketplace/
    ├── marketplace.json
    └── plugins/my-social-space-devkit/
        ├── .zcode-plugin/plugin.json
        ├── skills/
        ├── commands/
        └── agents/
```

## Development discipline

- Architecture and acceptance criteria before code.
- Implement one phase at a time.
- Keep the `ROADMAP` status current.
- Add or update tests with every behavior change.
- Run formatting, static analysis, and tests before marking a phase complete.
- Keep platform limitations and integration evidence documented.
- Never claim a capability works until verified on a real device or a suitable test environment.

## First build target

Phase 1 is complete only when:
- the four bottom tabs work;
- Home contains horizontally swipeable platform workspaces;
- startup restores the last-selected platform page;
- switching platforms persists the selection;
- Notes can create, edit, view, search, and delete local notes;
- Agent Suggest and Settings have useful, navigable initial screens;
- data survives app restarts;
- automated tests cover navigation and persisted workspace selection;
- `flutter analyze` and `flutter test` pass.

See [START_HERE.md](START_HERE.md) and [docs/ROADMAP.md](docs/ROADMAP.md).
