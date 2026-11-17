# Release Checklist

Do not publish to external users until all applicable items are checked.

## Product
- [ ] MVP scope and limitations are visible and accurate.
- [ ] No fake social connections or fake AI runs.
- [ ] Unsupported providers have a clear fallback.
- [ ] Platform feature claims have official-source evidence.

## Quality
- [ ] `dart format .` completed.
- [ ] `flutter analyze` has no unresolved errors.
- [ ] `flutter test` passes.
- [ ] Critical flows tested on a real Android device.
- [ ] Startup and process-restart restoration verified.
- [ ] Screen reader and large text checked.
- [ ] Crash and error paths reviewed.

## Security and privacy
- [ ] No secrets or signing keys in repository.
- [ ] Android manifest permissions minimized.
- [ ] Tokens and personal content are not logged.
- [ ] Data storage and deletion behavior documented.
- [ ] Privacy policy is available and matches actual behavior.
- [ ] Third-party SDKs and permissions reviewed.
- [ ] Provider terms and branding requirements checked.

## Android release
- [ ] App ID / applicationId confirmed.
- [ ] Version number and build number updated.
- [ ] Release signing configured outside source control.
- [ ] Release APK/AAB built and smoke-tested.
- [ ] Store listing, screenshots, age rating, and data safety declarations reviewed.
- [ ] Staged testing and rollback plan prepared.
