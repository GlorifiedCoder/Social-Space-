# Platform Capabilities and Integration Boundaries

## The most important distinction

There are three different experiences:
1. **Open the official app** — gives the user the platform's real native experience, but My Social Space usually cannot inspect or restore its internal screen state.
2. **Open a supported link or approved content experience** — a deep link, public page, official SDK/player, or supported API may allow a limited experience.
3. **My Social Space-owned workspace/content** — the app fully controls the UI and can save/restore its own routes, selections, and playback position.

Never describe these as interchangeable.

## Capability matrix — planning baseline

This matrix is a conservative planning guide, not a live guarantee. Validate current provider documentation, account type, scopes, region, app review, and terms before building each integration.

| Platform | Official app launch / links | API access planning | General personal feed access | Own-player resume |
|---|---|---|---|---|
| YouTube | Usually possible with app links or web URLs | Official Data API and IFrame Player API; scopes and features differ | Do not assume personalized native Home feed or watch history is available | Possible for playback controlled by our supported embedded player |
| Facebook | App links / browser links vary | Meta APIs are permission- and product-specific | Do not assume unrestricted personal News Feed access | Only for content played in a supported app-owned experience |
| Instagram | App links / browser links vary | API use is scoped; professional-account capabilities differ from personal-account experience | Do not assume personal feed or broad private content access | Only where an approved playback/content experience exists |
| TikTok | App links / web links | APIs and scopes are product-specific | Do not assume general personalized feed access | Only within a supported app-owned experience |
| X | App/web links | API availability, pricing, and scopes may change | Do not assume unrestricted timeline or message access | Only for supported content rendered by our own player |

## Integration policy

Before implementing a provider:
1. Locate current official developer documentation.
2. Record required API product, permission scopes, account type, app review, pricing/rate limits, and relevant terms.
3. Verify the exact user journey on a real Android device.
4. Decide between official app launch, deep link, API-derived content, or app-owned player.
5. Write an architecture decision record before introducing provider-specific code.
6. Add tests for installed/not-installed, signed-out, revoked, denied, and unsupported states.

## OAuth and embedded browsers

- Use each provider's currently approved OAuth method.
- Do not use an embedded WebView as a universal login shortcut.
- Some identity providers and platform login products restrict embedded user-agents; use external browser/custom tabs or official SDKs as required.
- Validate `state`, PKCE where supported, redirect URI, and token lifecycle.
- Never capture a user's platform password.

## YouTube-specific caution

Do not claim that YouTube's API exposes the native YouTube app's private watch history or exact playback position to this application. For videos played in an app-owned supported player, record playback progress from that player and resume within that same supported experience. Confirm current API and branding/player requirements before implementation.

## Prohibited approaches

- Scraping authenticated personal feeds from web pages.
- Copying cookies or session databases from another app.
- Reverse engineering private endpoints.
- Automating login or evading bot detection.
- Bypassing paywalls, DRM, rate limits, or age controls.
- Rehosting/redistributing media without rights.
- Claiming the user is connected when only a static UI exists.

## Product fallback behavior

When a platform does not allow in-app feed access:
- show the platform's workspace page;
- state "Open in [Platform]" clearly;
- optionally show user-saved links and app-owned notes associated with that platform;
- show a supported connection/discovery option only when it truly exists;
- preserve My Social Space's own last-used platform selection.
