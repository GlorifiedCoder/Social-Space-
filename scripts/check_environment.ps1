$ErrorActionPreference = "Continue"

Write-Host "=== My Social Space environment check ===" -ForegroundColor Cyan

$commands = @("git", "flutter", "dart", "java", "adb")

foreach ($name in $commands) {
    $cmd = Get-Command $name -ErrorAction SilentlyContinue
    if ($null -eq $cmd) {
        Write-Host ("MISSING: {0} is not available on PATH." -f $name) -ForegroundColor Yellow
    } else {
        Write-Host ("FOUND: {0} -> {1}" -f $name, $cmd.Source) -ForegroundColor Green
    }
}

Write-Host "`n=== Git ==="
if (Get-Command git -ErrorAction SilentlyContinue) {
    git --version
}

Write-Host "`n=== Flutter ==="
if (Get-Command flutter -ErrorAction SilentlyContinue) {
    flutter --version
    flutter doctor -v
}

Write-Host "`n=== Dart ==="
if (Get-Command dart -ErrorAction SilentlyContinue) {
    dart --version
}

Write-Host "`n=== Java ==="
if (Get-Command java -ErrorAction SilentlyContinue) {
    java -version
}

Write-Host "`n=== Android devices ==="
if (Get-Command adb -ErrorAction SilentlyContinue) {
    adb version
    adb devices
}

Write-Host "`nEnvironment check finished. This script diagnoses tools; it does not install or modify them."
