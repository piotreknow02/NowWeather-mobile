import 'package:now_weather/components/appBar.dart';
import 'package:now_weather/components/appBarBottom.dart';
import 'package:now_weather/components/backgroundImage.dart';
import 'package:now_weather/components/weatherInfoHorizontal.dart';
import 'package:now_weather/managers/mainActivityManager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  final double borderRadius;
  final int themeIndex;
  final bool isDark;
  final bool addTips;

  HomePage(
      {this.themeIndex = 0,
      this.isDark = false,
      this.borderRadius = 20,
      this.addTips = false});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: nowWeaterBar,
      bottomNavigationBar: NowWeatherBottomBar(ItemNumber.Home),
      body: Stack(alignment: Alignment.topCenter, children: [
        bgImage,
        SvgPicture.asset(
          getBgImage(c: themeIndex),
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
          colorBlendMode: BlendMode.overlay,
        ),
        Container(
            height: 600,
            child: DraggableScrollableSheet(
                expand: false,
                maxChildSize: 1,
                minChildSize: 0.45,
                initialChildSize: 0.99,
                builder: (context, scrollController) {
                  return SingleChildScrollView(
                      controller: scrollController,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            WeatherHorizontalInfo(
                                location: "Nowy Sącz",
                                description: "Sunny",
                                temp: "20°C"),
                          ]));
                }))
      ]),
    );
  }
}
