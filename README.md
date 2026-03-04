# School Management App

A Flutter-based school management application that runs from one codebase on:
- Desktop (Windows, macOS, Linux)
- Android
- iOS

> **Important:** This repository currently tracks shared Dart source (`lib/`, `test/`) and configuration files.
> Before running the app for a target platform in a fresh checkout, generate Flutter platform scaffolding.

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
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Generate platform folders (one-time per checkout):
   ```bash
   flutter create --platforms=android,ios,linux,macos,windows .
   ```
4. Run on any connected/generated platform:
   ```bash
   flutter run
   ```

## Test
```bash
flutter test
```
