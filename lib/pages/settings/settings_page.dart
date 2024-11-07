import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../src/settings/settings_controller.dart';

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingsController is updated and
/// Widgets that listen to the SettingsController are rebuilt.
class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key, required this.controller});

  final SettingsController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            // Glue the SettingsController to the theme selection DropdownButton.
            //
            // When a user selects a theme from the dropdown list, the
            // SettingsController is updated, which rebuilds the MaterialApp.
            child: DropdownButton<ThemeMode>(
              // Read the selected themeMode from the controller
              value: controller.themeMode,
              // Call the updateThemeMode method any time the user selects a theme.
              onChanged: controller.updateThemeMode,
              items: const [
                DropdownMenuItem(
                  value: ThemeMode.system,
                  child: Text('System Theme'),
                ),
                DropdownMenuItem(
                  value: ThemeMode.light,
                  child: Text('Light Theme'),
                ),
                DropdownMenuItem(
                  value: ThemeMode.dark,
                  child: Text('Dark Theme'),
                )
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              throw Exception('This is test exception');
            },
            child: const Text('Verify Sentry Setup'),
          ),
        ],
      ),
    );
  }
}
