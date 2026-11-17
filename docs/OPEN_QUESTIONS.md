# Open Product and Engineering Questions

Resolve these deliberately during the relevant phase; do not block the first local MVP on all of them.

1. What is the minimum Android version for the first release?
2. Is Home's initial workspace catalogue always the five seed platforms or user-selectable during onboarding?
3. Should opening an official app happen in the same task or via explicit confirmation?
4. Which single platform capability provides the highest user value and has a viable official API path?
5. Should local Notes be encrypted at rest, and what is the recovery/export behavior?
6. When cloud sync is introduced, what conflict resolution should apply to edited Notes?
7. Should Agent Suggest start as curated templates only or include a real public-source search integration?
8. What data retention and analytics opt-in policy will the app use?
9. What is the intended branding, app icon, typography, and design token palette?
10. Which devices and screen sizes are the first QA targets?

Default decisions for Phase 1:
- Android first.
- Five local platform workspace definitions.
- Last-used platform restored by default.
- Notes local-first.
- Agent Suggest is a template catalogue, not an executing agent.
- No social OAuth or remote backend.
