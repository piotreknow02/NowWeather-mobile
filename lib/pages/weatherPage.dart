import 'package:flutter/material.dart';
import 'package:now_weather/managers/valuesManager.dart' as values;
import 'package:now_weather/components/appBar.dart';
import 'package:now_weather/components/appBarBottom.dart';

class WeatherPage extends StatelessWidget {
  final borderRadius = values.borderRadius;
  final itemNum = ItemNumber.Weather;

  final String temp;
  final String location;
  final String desc;
  final String uvIndex;
  final String wind;
  final String windGuts;
  final String humidity;
  final String dewPoint;
  final String pressure;
  final String cloudCover;
  final String visibility;
  final String ceiling;
  WeatherPage(
      {this.location,
      this.temp,
      this.desc,
      this.uvIndex,
      this.wind,
      this.windGuts,
      this.humidity,
      this.dewPoint,
      this.pressure,
      this.cloudCover,
      this.visibility,
      this.ceiling});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: nowWeaterBar,
        bottomNavigationBar: NowWeatherBottomBar(this.itemNum),
        body: Container(
          margin: EdgeInsets.symmetric(
              vertical: this.borderRadius, horizontal: this.borderRadius),
          child: Column(
            children: <Widget>[
              Row(children: [
                Text(this.location,
                    style: Theme.of(context).primaryTextTheme.headline6),
                Spacer(flex: 1),
                Text(this.temp,
                    style: Theme.of(context).primaryTextTheme.headline6)
              ]),
              Divider(
                  thickness: this.borderRadius / 4,
                  color: Theme.of(context).accentColor),
              Row(children: <Widget>[
                Text(this.desc,
                    style: Theme.of(context).primaryTextTheme.bodyText2),
                Spacer(flex: 1),
                Icon(Icons.wb_sunny,
                    size: this.borderRadius * 5,
                    color: Theme.of(context).splashColor),
              ]),
              Divider(thickness: this.borderRadius / 10),
              Row(children: [Text("UV index: " + this.uvIndex)]),
              Row(children: [Text("wind: " + this.wind)]),
              Row(children: [Text("wind guts: " + this.windGuts)]),
              Row(children: [Text("humidity: " + this.humidity)]),
              Row(children: [Text("dew point: " + this.dewPoint)]),
              Row(children: [Text("pressure: " + this.pressure)]),
              Row(children: [Text("cloud cover: " + this.cloudCover)]),
              Row(children: [Text("visibility: " + this.visibility)]),
              Row(children: [Text("ceiling: " + this.ceiling)]),
            ],
          ),
        ));
  }
}
