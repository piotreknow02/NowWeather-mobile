import 'package:now_weather/components/appBar.dart';
import 'package:now_weather/components/appBarBottom.dart';
import 'package:now_weather/components/backgroundImage.dart';
import 'package:now_weather/managers/valuesManager.dart' as values;
import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  final double borderRadius = values.borderRadius;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: nowWeaterBar,
        bottomNavigationBar: NowWeatherBottomBar(ItemNumber.Home),
        body: Stack(
          children: <Widget>[
            bgImage,
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).splashColor,
                  borderRadius:
                      BorderRadiusDirectional.circular(this.borderRadius),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: this.borderRadius,
                        offset: Offset.fromDirection(245),
                        color: Color.fromARGB(200, 90, 90, 90))
                  ]),
              margin: EdgeInsets.symmetric(
                  vertical: this.borderRadius,
                  horizontal: this.borderRadius / 2),
              child: Text("Loading..."),
            )
          ],
        ));
  }
}
