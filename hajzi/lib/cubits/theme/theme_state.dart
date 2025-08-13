// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';

abstract class ThemeState {
  final ThemeData themeData;
  const ThemeState(this.themeData);
}

class LightThemeState extends ThemeState {
  LightThemeState(ThemeData theme) : super(theme);
}

class DarkThemeState extends ThemeState {
  DarkThemeState(ThemeData theme) : super(theme);
}
