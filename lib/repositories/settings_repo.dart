import 'package:flutter/material.dart';
import 'package:quickshop/models/settings.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_repo.g.dart';

@riverpod
class SettingsRepo extends _$SettingsRepo {
  @override
  Settings build() {
    return const Settings(
      themeMode: ThemeMode.system,
    );
  }

  void updateThemeMode(ThemeMode themeMode) {
    state = Settings(themeMode: themeMode);
  }
}
