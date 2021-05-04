import 'dart:core';
import 'package:now_weather/managers/mainActivityManager.dart';
import 'pages/searchPage.dart';
import 'pages/settingsPage.dart';
import 'package:now_weather/pages/homePage.dart';
import 'package:now_weather/pages/weatherPage.dart';
import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserSettings settings = UserSettings.load();
    return NowWeather(
        themeIndex: settings.themeIndex,
        isDark: settings.isDark,
        addTips: settings.showTips);
  }
}

class NowWeather extends StatelessWidget {
  final themeIndex;
  final isDark;
  final addTips;

  NowWeather({this.themeIndex, this.isDark, this.addTips = false});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getAppTheme(c: this.themeIndex, dark: false)
          .toTheme(context.widget)
          .data,
      darkTheme: getAppTheme(c: this.themeIndex, dark: true)
          .toTheme(context.widget)
          .data,
      routes: <String, WidgetBuilder>{
        "/": (context) => HomePage(),
        "/search": (context) => SearchPage(),
        "/settings": (context) => SettingsPage(),
        "/mylocation": (context) => WeatherPage()
      },
      initialRoute: "/",
    );
  }
}
