# Flutter application workspace

The Flutter application will be generated here during Phase 1.

From the repository root, run:

```powershell
.\scripts\bootstrap_flutter.ps1
```

Or create it manually:

```powershell
flutter create --platforms=android --org com.mysocialspace --project-name my_social_space apps/mobile
```

Then:

```powershell
cd apps/mobile
flutter pub get
flutter run
```

Do not place application source in the repository root. Keep the Flutter project inside `apps/mobile`.
