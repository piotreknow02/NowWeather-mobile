import 'package:flutter/material.dart';

final double borderRadius = 20.0;
final int darkenedColordark = 100;
final int darkenedColorlight = 200;

Color getDarkenedColor(bool isDark) => isDark ? Color.fromARGB(255, darkenedColordark, darkenedColordark, darkenedColordark): Color.fromARGB(255, darkenedColorlight, darkenedColorlight, darkenedColorlight);