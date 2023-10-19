import 'package:flutter/material.dart';

class AppTheme {
  final Color _color;

  AppTheme([Color? fromSeed]) : _color = fromSeed ?? Colors.deepPurple;

  ColorScheme get _colorScheme => ColorScheme.fromSeed(seedColor: _color);

  InputDecorationTheme get _inputTheme => InputDecorationTheme(
        hintStyle: TextStyle(color: _colorScheme.background.withOpacity(0.2)),
        // floatingLabelStyle: TextStyle(color: _colorScheme.primary),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.0,
            color: _colorScheme.outline.withOpacity(0.5),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2.0,
            color: _colorScheme.primary,
          ),
        ),
      );

  ThemeData get light => ThemeData.light(useMaterial3: true).copyWith(
        colorScheme: _colorScheme,
        inputDecorationTheme: _inputTheme,
      );

  ThemeData get dark => ThemeData.dark(useMaterial3: true).copyWith(
        colorScheme: _colorScheme,
        inputDecorationTheme: _inputTheme,
      );
}
