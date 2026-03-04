# School Management App

A Flutter-based school management application that runs from one codebase on:
- Desktop (Windows, macOS, Linux)
- Android
- iOS

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
3. Run on any connected platform:
   ```bash
   flutter run
   ```

## Test
```bash
flutter test
```
