# Product Vision

## Working name

**My Social Space**

## Positioning

An AI-powered personal social-media workspace that helps users access their social platforms, continue from their own app-managed context, save valuable information, discover useful agents, and shape their digital experience.

## Core promise

**Your social media, your rules.**

## Problem

People move between multiple social platforms, repeatedly search for content they were viewing, lose useful links and ideas in the stream, and have limited control over the recommendation environments they use. Each platform is siloed, and content worth keeping is scattered.

## Product principles

1. **Continuity:** remember the user's last-used workspace and app-managed context.
2. **User control:** let people choose their platform order, profiles, appearance, and information preferences.
3. **Useful over addictive:** help users find, resume, save, and organize meaningful content; do not optimize for endless scrolling.
4. **Transparency:** explain what the app can access and what it cannot.
5. **Permission-respecting integration:** use official APIs, SDKs, deep links, and app launching where permitted.
6. **Local-first foundations:** core notes and workspace preferences should remain useful without an account or network.
7. **AI with user control:** AI suggestions must be explainable; actions with external consequences require user approval.

## Primary user journey

1. User opens My Social Space.
2. Home restores the last-used platform workspace page.
3. User swipes left/right to another connected or configured platform workspace.
4. User opens the platform using the supported official app, a supported deep link, or an approved in-app content experience.
5. User saves useful content to Notes.
6. User can explore Agent Suggest to discover an agent or describe a task.
7. User customizes preferences in Settings.

## Four primary tabs

### Home

A full-width, horizontally swipeable workspace pager. Every enabled platform gets one independent page. The selected page is restored at startup. Each page may contain app-owned content, a supported embedded player/reader, or a clear action to open the official platform app. The UI must never disguise an external app as an embedded native screen.

### Notes

A personal knowledge space for text notes and saved content references. Notes support title, body, source URL, platform/source label, tags, collection, created/updated timestamps, and search. Content transcripts or media downloads are not assumed; they require rights and platform permission.

### Agent Suggest

A discovery catalogue and task-intake interface. It can initially show curated example agent templates and a clear "coming soon / requires connection" state for capabilities not yet implemented. Future agents can search approved sources, summarize public content, and create personal digests. Do not simulate live execution.

### Settings

Platform ordering and enabled state; theme; default startup behavior; user-created profiles/modes; content preferences; notifications; privacy, storage, export, and deletion.

## MVP boundary

The initial release proves:
- four-tab app shell;
- swipeable platform workspace pager;
- last-used platform persistence across app restarts;
- independent local workspace metadata;
- local Notes CRUD and search;
- initial Agent Suggest catalogue (local static catalogue only, clearly labeled);
- Settings for appearance and platform visibility/order if time allows;
- automated tests.

The MVP does **not** promise:
- full native social app embedding;
- access to every platform's personal home feed;
- universal direct messages;
- reading private watch history from native apps;
- exact playback resumption for videos viewed outside this app;
- universal cross-platform posting;
- perfect AI content moderation.

## Success measures for the MVP

- A user can move between configured platform workspaces by swiping.
- Relaunching returns to the last-selected workspace reliably.
- Notes remain after force-close/relaunch.
- Navigation is predictable and accessible.
- No core flow depends on fabricated platform data.
- Known unsupported platform capabilities are visible to users and documented.
