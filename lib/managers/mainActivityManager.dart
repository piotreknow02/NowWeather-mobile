import 'dart:convert';
import 'package:now_weather/managers/dataTransfer.dart';
import 'package:now_weather/pages/weatherPage.dart';
import "themeManager.dart";
import 'package:now_weather/managers/fileManager.dart';

ColorTheme getAppTheme({int c = 0, bool dark = false}) {
  return getTheme(color: ThemeColor.values[c], isDark: dark);
}

String getBgImage({int c = 0}) {
  switch (c) {
    case 0:
      return "lib/assets/images/NowWeather_bg_def.svg";
      break;
    case 1:
      return "lib/assets/images/NowWeather_bg_orange.svg";
      break;
    case 2:
      return "lib/assets/images/NowWeather_bg_green.svg";
      break;
    case 3:
      return "lib/assets/images/NowWeather_bg_pink.svg";
      break;
    case 4:
      return "lib/assets/images/NowWeather_bg_blue.svg";
      break;
    case 5:
      return "lib/assets/images/NowWeather_bg_red.svg";
      break;
    default:
      return "lib/assets/images/NowWeather_bg_def.svg";
      break;
  }
}

List<String> getColorTypes() {
  var list = <String>[];
  for (int i = 0; i < ThemeColor.values.length; i++) {
    list.add(ThemeColor.values[i].toString().replaceFirst("ThemeColor.", ""));
  }
  return list;
}

int parseColorTypeIndex(String type) {
  for (int i = 0; i < ThemeColor.values.length; i++) {
    if (ThemeColor.values[i].toString().replaceFirst("ThemeColor.", "") == type)
      return i;
  }
  return 0;
}

class UserSettings {
  int themeIndex;
  bool isDark;
  bool showTips;

  UserSettings(
      {this.themeIndex = 0, this.isDark = false, this.showTips = false});

  UserSettings.fromJSON(String json) {
    var userMap = jsonDecode(json);
    this.themeIndex = int.parse(userMap["themeIndex"]);
    this.isDark = userMap["isDark"] == "true";
    this.showTips = userMap["showTips"] == "true";
  }
  save() => saveUserSettings(this);
  static UserSettings load() {
    UserSettings _us;
    loadUserSettings().then((val) => _us = val ?? UserSettings());
    return _us ?? UserSettings();
  }
}

WeatherPage getWeatherPageForCity(String city) {
  final _wil = getLongWeatherForCity(city);
  var page = WeatherPage(
    location: _wil.loc,
    temp: _wil.temp.toString() + "°C",
    desc: _wil.desc,
    uvIndex: _wil.uvIndex.toString(),
    wind: _wil.wind.toString() + " km/h",
    windGuts: _wil.windGuts.toString() + " km/h",
    humidity: _wil.humidity.toString() + "%",
    dewPoint: _wil.dewPiont.toString() + "°C",
    pressure: _wil.pressure.toString() + " hPa",
    cloudCover: _wil.cloudCover.toString() + "%",
    visibility: _wil.visibility.toString() + " m",
    ceiling: _wil.ceiling.toString() + " m",
  );
  return page;
}

getWeathersFor(String str) {
  return null;
}
