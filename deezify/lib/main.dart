import 'package:deezify/src/page/settings/settings_controller.dart';
import 'package:deezify/src/page/settings/settings_service.dart';
import 'package:flutter/material.dart';

import 'src/app.dart';

void main() async {
  final settingsController = SettingsController(SettingsService());

  await settingsController.loadSettings();

  runApp(MyApp(settingsController: settingsController));
}
