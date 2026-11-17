# Build Guide — Windows / Android

## 1. Install and verify tools

Install:
- ZCode desktop app;
- Git for Windows;
- Flutter SDK (stable channel);
- Android Studio, Android SDK, platform tools, and emulator;
- a supported JDK (normally supplied/configured through Android Studio for Flutter Android builds).

Use official installation instructions for current versions. Package/tool versions change; do not rely on screenshots or old version pins.

## 2. PowerShell environment check

From the repository root:

```powershell
.\scripts\check_environment.ps1
```

The script checks command availability and prints diagnostic versions. It does not install software.

## 3. Generate the Flutter project

Run:

```powershell
.\scripts\bootstrap_flutter.ps1
```

The script creates the Flutter application under `apps/mobile` only if there is no existing `pubspec.yaml` there. It does not overwrite an existing app.

Manual equivalent:

```powershell
flutter create --platforms=android --org com.mysocialspace --project-name my_social_space apps/mobile
```

## 4. Fetch packages and run

```powershell
cd apps/mobile
flutter pub get
flutter doctor -v
flutter devices
flutter run
```

If a device is not shown:
- start an Android emulator in Android Studio; or
- connect a real phone with Developer Options and USB debugging enabled;
- accept the RSA authorization prompt on the phone;
- run `flutter devices` again.

## 5. Add packages carefully

For Phase 1, likely categories:
- Riverpod state management;
- GoRouter navigation;
- SQLite plugin;
- simple preferences package;
- URL launcher only when official-launch behavior is implemented.

Ask ZCode to:
1. check latest stable package versions;
2. confirm Dart/Flutter/Android compatibility;
3. explain why each package is needed;
4. add only dependencies used in the phase;
5. commit `pubspec.lock` for the application.

Do not add WebView, authentication, Supabase, FastAPI client, AI SDK, or platform-specific packages merely because they may be useful later.

## 6. Quality commands

Run from `apps/mobile`:

```powershell
dart format .
flutter analyze
flutter test
```

Run integration tests only after the relevant test target and device/emulator are configured:

```powershell
flutter test integration_test
```

## 7. Android build

Debug build and install:

```powershell
flutter run
```

Release APK:

```powershell
flutter build apk --release
```

App bundle for Play Store testing/release:

```powershell
flutter build appbundle --release
```

Signing setup is intentionally not included in this starter kit. Keep signing secrets outside the repository and follow the current Android/Google Play release requirements.

## 8. Common build failures

- **Flutter not found:** add Flutter `bin` to PATH and restart terminal/ZCode.
- **Android licenses missing:** run `flutter doctor --android-licenses`.
- **No devices:** start emulator or enable USB debugging.
- **Gradle/JDK mismatch:** use the JDK recommended by the installed Flutter/Android Gradle Plugin versions; do not randomly upgrade Gradle files.
- **Package conflict:** inspect dependency constraints and Flutter/Dart versions before forcing overrides.
- **Emulator networking:** Android emulator's host machine is usually reachable at `10.0.2.2`; this is not the correct address for a physical phone.
