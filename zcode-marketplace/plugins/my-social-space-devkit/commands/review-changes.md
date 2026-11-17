---
description: Review the current diff for correctness, regressions, UX, architecture, privacy, and missing tests.
skills: flutter-ui-quality, privacy-security-review, test-and-release
---
Review the current Git diff and relevant surrounding code for My Social Space.

Do not modify files unless asked. Look for:
- correctness and state-restoration defects;
- pager gesture and navigation regressions;
- data loss or unsafe migrations;
- fake/unverified platform capabilities;
- secrets, permissions, logging, and privacy defects;
- accessibility problems;
- missing tests and error states;
- unnecessary dependencies and architecture overreach.

Classify findings Blocker / High / Medium / Low. Include exact file/line references where possible, why each issue matters, and a specific fix. Summarize what you reviewed and what you did not verify.
