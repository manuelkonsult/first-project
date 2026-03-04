# School Management App

A Flutter-based school management application starter focused on shared Dart code (`lib/` and `test/`) for:
- Desktop (Windows, macOS, Linux)
- Android
- iOS

> **Note:** This repository currently tracks only the shared app layer. Platform folders (`android/`, `ios/`, `linux/`, `macos/`, `windows/`) must be generated locally before running on those targets.

## Features
- Dashboard with key statistics
- Student management list
- Teacher management list
- Class management list
- Daily attendance overview

## Project structure
- `lib/main.dart` - app entry point and theme
- `lib/screens/home_shell.dart` - navigation and UI screens
- `lib/models/entities.dart` - domain models
- `lib/data/mock_school_repository.dart` - mock in-memory data source

## Run locally
1. Install Flutter SDK and verify using:
   ```bash
   flutter --version
   ```
2. Generate platform scaffolding in this project root (required once in a fresh checkout):
   ```bash
   flutter create --platforms=android,ios,linux,macos,windows .
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Run on a connected/supported device:
   ```bash
   flutter run
   ```

## Test
```bash
flutter test
```
