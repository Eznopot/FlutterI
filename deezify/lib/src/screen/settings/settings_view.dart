import 'package:deezify/src/config/colors.dart';
import 'package:flutter/material.dart';

import 'settings_controller.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key, required this.controller}) : super(key: key);

  final SettingsController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: DeezifyColors.appBarBackgound,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: DropdownButton<ThemeMode>(
          value: controller.themeMode,
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
    );
  }
}
