import 'package:now_weather/managers/mainActivityManager.dart';
import 'package:now_weather/managers/valuesManager.dart' as values;
import 'package:flutter/material.dart';

class WeatherHorizontalInfo extends StatelessWidget {
  double borderRadius = values.borderRadius;
  String description;
  String location;
  String temp;
  bool addIcon;

  WeatherHorizontalInfo(
      {this.addIcon, this.location, this.description, this.temp});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (content) => getWeatherPageForCity(this.location)));
        },
        onLongPress: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text("Delete?"),
                    content: Text("Do you want to delete this widget?"),
                    actions: <Widget>[],
                  ));
        },
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).splashColor,
              borderRadius: BorderRadiusDirectional.circular(this.borderRadius),
              boxShadow: [
                BoxShadow(
                    blurRadius: this.borderRadius,
                    offset: Offset.fromDirection(245),
                    color: Color.fromARGB(200, 90, 90, 90))
              ]),
          alignment: Alignment.topLeft,
          margin: EdgeInsets.symmetric(
              vertical: this.borderRadius, horizontal: this.borderRadius / 2),
          width: MediaQuery.of(context).size.width,
          height: 122,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Row(children: [
                  Text(this.location,
                      style: Theme.of(context).primaryTextTheme.subtitle2,
                      textAlign: TextAlign.left),
                  Spacer(flex: 1),
                  Text(this.temp,
                      style: Theme.of(context).primaryTextTheme.headline6,
                      textAlign: TextAlign.right),
                ]),
                Row(children: [
                  Text(this.description,
                      style: Theme.of(context).primaryTextTheme.bodyText2,
                      textAlign: TextAlign.left),
                  // Spacer(flex: 1)
                ]),
              ],
            ),
          ),
        ));
  }
}
