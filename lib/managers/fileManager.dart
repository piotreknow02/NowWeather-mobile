import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:now_weather/managers/mainActivityManager.dart';

saveUserSettings(UserSettings settings) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool("IsDark", settings.isDark);
  prefs.setInt("ThemeIndex", settings.themeIndex);
}

Future<UserSettings> loadUserSettings() async {
  final prefs = await SharedPreferences.getInstance();
  var userSettings = UserSettings(
      themeIndex: prefs.getInt("ThemeIndex") ?? 0,
      isDark: SchedulerBinding.instance.window.platformBrightness ==
          Brightness.dark);
  print(userSettings.isDark.toString());
  return Future.value(userSettings);
}

clearData() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.remove("IsDark");
  prefs.remove("ThemeIndex");
}
