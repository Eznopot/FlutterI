import 'package:flutter/material.dart';
import 'package:my_cache_manager/my_cache_manager.dart';

class SettingsService {
  Future<ThemeMode> themeMode() async {
    if (await MyCacheManager.readInt("theme") == 0) {
       return (ThemeMode.light);
    } else if (await MyCacheManager.readInt("theme") == 1) {
      return (ThemeMode.dark);
    } else if (await MyCacheManager.readInt("theme") == 2) {
      return (ThemeMode.system);
    }
    return (ThemeMode.light);
  }

  Future<void> updateThemeMode(ThemeMode theme) async {
    if (theme == ThemeMode.light) {
      await MyCacheManager.writeInt("theme", 0);
    } else if (theme == ThemeMode.dark) {
      await MyCacheManager.writeInt("theme", 1);
    } else if (theme == ThemeMode.system) {
      await MyCacheManager.writeInt("theme", 2);
    }
  }
}
