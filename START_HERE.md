# Start Here — Build My Social Space with ZCode

## What you are opening

This folder is the source-of-truth workspace for the My Social Space project. ZCode should read the root `AGENTS.md` at the start of every task. The `docs/` folder explains what to build and why. The `prompts/` folder contains focused phase prompts. The optional ZCode plugin adds reusable skills, commands, and subagents.

## Step 1 — Check your development environment

On Windows, open PowerShell in this folder and run:

```powershell
.\scripts\check_environment.ps1
```

You need:
- ZCode desktop app;
- Git;
- Flutter SDK on `PATH`;
- Android Studio or Android SDK command-line tools;
- an Android emulator or a physical Android device with USB debugging enabled.

Do not place API keys or passwords in this repository.

## Step 2 — Open this folder in ZCode

Open the entire `My_Social_Space_ZCode_Starter` directory as the workspace, not just the `docs` or `apps` subfolder.

ZCode reads `AGENTS.md` from the workspace root. Keep this file at the root.

## Step 3 — Install the optional ZCode plugin

The project works without the plugin because `AGENTS.md` and all prompts are in the workspace. The plugin adds reusable skills and commands.

1. Open `zcode-marketplace/INSTALL.md`.
2. In ZCode, open **Settings → Plugins**.
3. Choose **Create → Add marketplace**.
4. Select the local `zcode-marketplace` directory.
5. Install and enable **my-social-space-devkit**.
6. Open **Settings → Skills** and **Settings → Subagents** to confirm the components are present.
7. If a skill does not appear, refresh the skills list and check that it is enabled.

The bundled plugin contains Markdown instructions only. It does not install packages, run hooks, connect MCP servers, or access external services.

## Step 4 — Start the first ZCode task

Open `prompts/00_FIRST_TASK.md`, copy the entire prompt, and send it to ZCode Agent.

The first task must:
1. inspect the workspace and environment;
2. report the architecture and risks;
3. create the Flutter app under `apps/mobile`;
4. implement Phase 1 only;
5. run tests and static analysis;
6. update the project documentation and changelog.

Do not ask the agent to implement every future phase in one task.

## Step 5 — Build and run

After ZCode creates `apps/mobile/pubspec.yaml`, run:

```powershell
cd apps/mobile
flutter pub get
flutter doctor
flutter devices
flutter run
```

For an Android release build:

```powershell
flutter build apk --release
```

The output location will be reported by Flutter. Do not publish a build until the release checklist in `docs/RELEASE_CHECKLIST.md` is complete.

## Step 6 — Continue phase by phase

Use these prompts in order:

1. `prompts/01_PHASE_1_FOUNDATION.md`
2. `prompts/02_PHASE_2_WORKSPACE_ENGINE.md`
3. `prompts/03_PHASE_3_NOTES.md`
4. `prompts/04_PHASE_4_AGENT_SUGGEST.md`
5. `prompts/05_PHASE_5_SETTINGS_PERSONALIZATION.md`
6. `prompts/06_PHASE_6_BACKEND_FOUNDATION.md`
7. `prompts/07_PHASE_7_PLATFORM_INTEGRATIONS.md`
8. `prompts/08_PHASE_8_QA_AND_RELEASE.md`

Phase 1 is described in both the first-task prompt and Phase 1 prompt. Use the first-task prompt for initial onboarding; use the Phase 1 prompt if restarting or refining that implementation.

## ZCode usage tips

- Start complex work in Plan mode or ask for a plan before edits.
- Use `$skill-name` in chat when you want to invoke one of the bundled skills.
- Use `/start-phase 2` (or another phase number) after installing the plugin.
- Use `/review-changes` before accepting risky changes.
- Ask ZCode to show the files changed, commands run, test output, and unresolved issues.
- Keep one task focused on one deliverable or phase.
