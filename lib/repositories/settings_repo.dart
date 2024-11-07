import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/settings.dart';
import '../services/shared_preferences.dart';

part 'settings_repo.g.dart';

@riverpod
class SettingsRepo extends _$SettingsRepo {
  final String _themeModeKey = 'themeMode';

  @override
  Settings build() {
    final prefs = ref.read(sharedPrefsProvider);
    return Settings(
      themeMode: _parseThemeMode(prefs.getString(_themeModeKey)),
    );
  }

  ThemeMode _parseThemeMode(String? themeModeName) {
    return ThemeMode.values.firstWhere(
      (e) => e.name == themeModeName,
      orElse: () => ThemeMode.system,
    );
  }

  void updateThemeMode(ThemeMode themeMode) {
    state = Settings(themeMode: themeMode);
    ref.read(sharedPrefsProvider).setString(_themeModeKey, themeMode.name);
  }
}
