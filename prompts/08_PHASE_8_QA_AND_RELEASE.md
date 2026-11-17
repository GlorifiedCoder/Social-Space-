# Phase 8 — QA, Security Hardening and Release

## Goal
Prepare a tested Android release candidate.

## Work
- full regression suite;
- integration tests on physical devices;
- startup and process-death behavior;
- accessibility and text scaling;
- performance, memory, battery and network checks;
- dependency/license/security review;
- Android manifest and permission review;
- deep-link verification;
- privacy policy and data disclosures;
- signing configuration outside source control;
- release APK/AAB smoke tests;
- internal testing and rollback plan.

## Required commands
- `dart format .`
- `flutter analyze`
- `flutter test`
- relevant integration tests
- `flutter build apk --release` or `flutter build appbundle --release`

## Acceptance
Complete `docs/RELEASE_CHECKLIST.md`. Report exact device/OS versions, commands, results, and remaining risks. Do not describe an untested build as release-ready.
