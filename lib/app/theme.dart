import 'package:flutter/material.dart';

ThemeData buildMotionGuardTheme() {
  const seed = Color(0xFF0B6E69);

  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: seed,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: const Color(0xFFF7F9F8),
    appBarTheme: const AppBarTheme(
      centerTitle: false,
      elevation: 0,
      backgroundColor: Colors.transparent,
      foregroundColor: Color(0xFF10201F),
    ),
    // CardTheme removed to satisfy newer Flutter SDK type expectations.
    // Keep default card styling for now.
  );
}
