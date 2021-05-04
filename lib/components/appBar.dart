import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:now_weather/managers/valuesManager.dart' as values;

AppBar nowWeaterBar = AppBar(
    title: Text("NowWeather"),
    leading: SvgPicture.asset("lib/assets/images/NowWeather_logo.svg"),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(values.borderRadius)));
