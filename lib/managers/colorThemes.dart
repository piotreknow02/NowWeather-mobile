import 'package:flutter/material.dart';
import 'themeManager.dart';

class _ColorPalette
{
  Color color1;
  Color color2;
  Color color3;
  _ColorPalette(this.color1, this.color2, this.color3);
}
final darkColors = _ColorPalette(
  Color.fromARGB(255, 48, 48, 48),
  Color.fromARGB(255, 33, 33, 33),
  Color.fromARGB(255, 66, 66, 66));
final lightColors = _ColorPalette(
  Color.fromARGB(255, 245, 245, 245),
  Color.fromARGB(255, 209, 209, 209),
  Color.fromARGB(255, 107, 107, 107));
final orangeColors = _ColorPalette(
  Color.fromARGB(255, 255, 168, 54),
  Color.fromARGB(255, 255, 226, 41),
  Color.fromARGB(255, 117, 101, 0));
final greenColors = _ColorPalette(
  Color.fromARGB(255, 0, 145, 82),
  Color.fromARGB(255, 137, 255, 41),
  Color.fromARGB(255, 0, 64, 24));
final pinkColors = _ColorPalette(
  Color.fromARGB(255, 236, 94, 255),
  Color.fromARGB(255, 255, 168, 242),
  Color.fromARGB(255, 92, 0, 97));
final blueColors = _ColorPalette(
  Color.fromARGB(255, 87, 252, 255),
  Color.fromARGB(255, 38, 157, 255),
  Color.fromARGB(255, 13, 0, 69));
final redColors = _ColorPalette(
  Color.fromARGB(255, 250, 97, 97),
  Color.fromARGB(255, 255, 54, 54),
  Color.fromARGB(255, 163, 0, 57));
final defaultColors = _ColorPalette(
  Color.fromARGB(255, 79, 193, 255),
  Color.fromARGB(255, 94, 220, 255),
  Color.fromARGB(255, 90, 90, 90));


final lightTheme = ColorTheme(
  lightColors.color1,
  lightColors.color2,
  lightColors.color3,
  defaultColors.color1,
  defaultColors.color2,
  defaultColors.color3);
final darkTheme = ColorTheme(
  darkColors.color1,
  darkColors.color2,
  darkColors.color3,
  defaultColors.color1,
  defaultColors.color2,
  defaultColors.color3);
final darkOrangeTheme = ColorTheme(
  darkColors.color1,
  darkColors.color2,
  darkColors.color3,
  orangeColors.color1,
  orangeColors.color2,
  orangeColors.color3);
final darkGreenTheme = ColorTheme(
  darkColors.color1,
  darkColors.color2,
  darkColors.color3,
  greenColors.color1,
  greenColors.color2,
  greenColors.color3);
final darkPinkTheme = ColorTheme(
  darkColors.color1,
  darkColors.color2,
  darkColors.color3,
  pinkColors.color1,
  pinkColors.color2,
  pinkColors.color3);
final darkBlueTheme = ColorTheme(
  darkColors.color1,
  darkColors.color2,
  darkColors.color3,
  blueColors.color1,
  blueColors.color2,
  blueColors.color3);
final darkRedTheme = ColorTheme(
  darkColors.color1,
  darkColors.color2,
  darkColors.color3,
  redColors.color2,
  redColors.color1,
  redColors.color3);
final lightOrangeTheme = ColorTheme(
  lightColors.color1,
  lightColors.color2,
  lightColors.color3,
  orangeColors.color1,
  orangeColors.color2,
  orangeColors.color3);
final lightGreenTheme = ColorTheme(
  lightColors.color1,
  lightColors.color2,
  lightColors.color3,
  greenColors.color1,
  greenColors.color2,
  greenColors.color3);
final lightPinkTheme = ColorTheme(
  lightColors.color1,
  lightColors.color2,
  lightColors.color3,
  pinkColors.color1,
  pinkColors.color2,
  pinkColors.color3);
final lightBlueTheme = ColorTheme(
  lightColors.color1,
  lightColors.color2,
  lightColors.color3,
  blueColors.color1,
  blueColors.color2,
  blueColors.color3);
final lightRedTheme = ColorTheme(
  lightColors.color1,
  lightColors.color2,
  lightColors.color3,
  redColors.color2,
  redColors.color1,
  redColors.color3);