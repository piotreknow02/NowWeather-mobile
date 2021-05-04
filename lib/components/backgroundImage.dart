import 'package:flutter/material.dart';
import 'package:now_weather/managers/valuesManager.dart';
import 'package:now_weather/managers/backgroundManager.dart';
import 'package:now_weather/managers/mainActivityManager.dart';

final bgImage = Image(
  image: AssetImage(getRandomBgPath()),
  color: getDarkenedColor(UserSettings.load().isDark),
  colorBlendMode: BlendMode.darken,
  fit: BoxFit.cover,
  width: double.infinity,
  height: double.infinity,
);
