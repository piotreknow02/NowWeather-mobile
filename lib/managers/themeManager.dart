import 'package:flutter/material.dart';
import 'colorThemes.dart';

double titleFontSize = 50;
double subtitleFontSize = 40;
double textFontSize = 20;

enum ThemeColor { DEFAULT, ORANGE, GREEN, PINK, BLUE, RED }

ColorTheme getTheme(
    {ThemeColor color = ThemeColor.DEFAULT, bool isDark = false}) {
  switch (color) {
    case ThemeColor.DEFAULT:
      if (isDark) return darkTheme;
      return lightTheme;
    case ThemeColor.ORANGE:
      if (isDark) return darkOrangeTheme;
      return lightOrangeTheme;
    case ThemeColor.GREEN:
      if (isDark) return darkGreenTheme;
      return lightGreenTheme;
    case ThemeColor.PINK:
      if (isDark) return darkPinkTheme;
      return lightPinkTheme;
    case ThemeColor.BLUE:
      if (isDark) return darkBlueTheme;
      return lightBlueTheme;
    case ThemeColor.RED:
      if (isDark) return darkRedTheme;
      return lightRedTheme;
  }
  return lightTheme;
}

class ColorTheme {
  Color background;
  Color primary;
  Color secondary;
  Color accent;
  Color secondaryAccent;
  Color thirdColor;

  ColorTheme(this.background, this.primary, this.secondary, this.accent,
      this.secondaryAccent, this.thirdColor);

  Theme toTheme(Widget child) {
    final mainStyle = TextStyle(
        decoration: TextDecoration.none,
        color: this.accent,
        decorationColor: this.secondaryAccent,
        fontWeight: FontWeight.w300,
        fontSize: titleFontSize,
        fontFamily: "Lobster");
    final textStyle = TextStyle(
        decoration: TextDecoration.none,
        color: this.thirdColor,
        decorationColor: this.thirdColor,
        fontWeight: FontWeight.w300,
        fontSize: textFontSize,
        fontFamily: "Comic Neue");
    final subtitleStyle = TextStyle(
        decoration: TextDecoration.none,
        color: this.accent,
        decorationColor: this.thirdColor,
        fontWeight: FontWeight.w600,
        fontSize: subtitleFontSize,
        fontFamily: "Raleway");
    final buttonStyle = TextStyle(
        color: this.secondary,
        decorationColor: this.thirdColor,
        fontSize: subtitleFontSize,
        fontFamily: "Comic Neue");

    final data = ThemeData(
        primaryTextTheme: TextTheme(
            headline6: mainStyle,
            subtitle2: subtitleStyle,
            bodyText2: textStyle,
            bodyText1: textStyle,
            caption: subtitleStyle,
            button: buttonStyle),
        primaryColor: this.primary,
        secondaryHeaderColor: this.secondary,
        backgroundColor: this.background,
        accentColor: this.accent,
        focusColor: this.secondaryAccent,
        hoverColor: this.thirdColor,
        highlightColor: this.accent,
        splashColor: this.secondaryAccent,
        selectedRowColor: this.thirdColor,
        disabledColor: this.thirdColor,
        buttonColor: this.accent,
        fontFamily: "Comic Neue",
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: this.secondaryAccent, hoverColor: this.accent),
        scaffoldBackgroundColor: this.background,
        canvasColor: this.secondaryAccent,
        hintColor: this.secondaryAccent,
        dialogBackgroundColor: this.secondary,
        errorColor: this.accent,
        bottomAppBarColor: this.accent,
        toggleableActiveColor: this.secondaryAccent);

    final t = Theme(
      data: data,
      child: child,
    );
    return t;
  }
}
