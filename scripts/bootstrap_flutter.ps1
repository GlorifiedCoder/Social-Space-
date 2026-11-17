$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot
$appPath = Join-Path $root "apps\mobile"
$pubspec = Join-Path $appPath "pubspec.yaml"

if (-not (Get-Command flutter -ErrorAction SilentlyContinue)) {
    throw "Flutter was not found on PATH. Install Flutter and restart PowerShell/ZCode."
}

if (Test-Path $pubspec) {
    throw "An existing Flutter app was found at apps/mobile. This script will not overwrite it."
}

if (-not (Test-Path $appPath)) {
    New-Item -ItemType Directory -Path $appPath -Force | Out-Null
}

Write-Host "Creating Flutter Android application under apps/mobile..."
flutter create --platforms=android --org com.mysocialspace --project-name my_social_space $appPath

if (-not (Test-Path $pubspec)) {
    throw "Flutter create completed without creating pubspec.yaml. Inspect the Flutter output."
}

Write-Host "Flutter scaffold created."
Write-Host "Next:"
Write-Host "  cd apps/mobile"
Write-Host "  flutter pub get"
Write-Host "  flutter run"
