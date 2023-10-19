import 'package:flutter/material.dart';

enum UserThemeEnum {
  dark(ThemeMode.dark),
  light(ThemeMode.light);

  const UserThemeEnum(this.mode);
  final ThemeMode mode;
}
