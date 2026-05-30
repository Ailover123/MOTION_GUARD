# MotionGuard

MotionGuard is a Flutter app for motion-aware theft and snatch detection.

The current codebase is a fresh Flutter foundation. The older Android/Kotlin
project at `D:\academic\MotionGuard` is treated as a behavioral reference only.

## Current Scope

- Flutter app shell with Riverpod and GoRouter.
- Initial sign-in, permission onboarding, and monitoring routes.
- Pure Dart detection domain models and risk scoring.
- Android platform channel names reserved for future Kotlin integration.

## Development

```powershell
flutter pub get
flutter test
```

Docs and agent handoff notes live under `docs/` and are intentionally ignored by
Git.
