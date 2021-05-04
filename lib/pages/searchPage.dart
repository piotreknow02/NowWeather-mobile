import 'package:flutter/material.dart';
import 'package:now_weather/managers/valuesManager.dart' as values;
import 'package:now_weather/components/backgroundImage.dart';
import 'package:now_weather/components/appBar.dart';
import 'package:now_weather/components/appBarBottom.dart';
import 'package:now_weather/managers/mainActivityManager.dart';

class SearchPage extends StatelessWidget {
  final double borderRadius = values.borderRadius;
  var suggestions = <Widget>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: nowWeaterBar,
        bottomNavigationBar: NowWeatherBottomBar(ItemNumber.Search),
        body: Stack(children: [
          bgImage,
          Column(children: <Widget>[
            Container(
                margin: EdgeInsets.symmetric(
                    vertical: this.borderRadius, horizontal: this.borderRadius),
                decoration: BoxDecoration(
                    color: Theme.of(context).hoverColor,
                    borderRadius: BorderRadius.circular(this.borderRadius),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: this.borderRadius,
                          offset: Offset.fromDirection(245),
                          color: Color.fromARGB(200, 90, 90, 90))
                    ]),
                child: Column(children: [
                  TextField(
                      decoration:
                          InputDecoration(hintText: "Search for a city"),
                      textAlign: TextAlign.center,
                      onChanged: (str) => getWeathersFor(str),
                      onSubmitted: (str) => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) =>
                                  getWeatherPageForCity(str)))),
                ])),
            Divider(
                color: Theme.of(context).accentColor,
                thickness: this.borderRadius / 4),
          ])
        ]));
  }
}
