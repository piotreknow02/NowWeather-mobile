import 'package:now_weather/managers/fileManager.dart';
import 'package:now_weather/managers/themeManager.dart';
import 'package:flutter/material.dart';
import 'package:now_weather/managers/valuesManager.dart' as values;
import 'package:now_weather/components/appBar.dart';
import 'package:now_weather/components/appBarBottom.dart';
import 'package:now_weather/managers/mainActivityManager.dart';

class SettingsPage extends StatelessWidget {
  final double borderRadius = values.borderRadius;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: nowWeaterBar,
      bottomNavigationBar: NowWeatherBottomBar(ItemNumber.Settings),
      body: Column(
        children: <Widget>[
          Row(children: <Widget>[
            Spacer(flex: 1),
            Text("Settings",
                style: Theme.of(context).primaryTextTheme.subtitle2),
            Spacer(flex: 1)
          ]),
          Divider(
              thickness: this.borderRadius / 4,
              color: Theme.of(context).accentColor),
          Spacer(flex: 1),
          Row(children: <Widget>[
            Spacer(flex: 1),
            Text("Theme Settings"),
            Spacer(flex: 1)
          ]),
          Row(children: <Widget>[
            Spacer(flex: 1),
            DropdownButton<String>(
              items: getColorTypes()
                  .map((element) =>
                      DropdownMenuItem(value: element, child: Text(element)))
                  .toList(),
              hint: Text(ThemeColor.values[UserSettings.load().themeIndex]
                  .toString()
                  .replaceFirst("ThemeColor.", "")),
              onChanged: (selected) {
                var settings = UserSettings.load();
                settings.themeIndex = parseColorTypeIndex(selected);
                settings.save();
              },
            ),
            Spacer(flex: 4),
            Switch(
                value: UserSettings.load().isDark,
                onChanged: (value) {
                  var settings = UserSettings.load();
                  settings.isDark = value;
                  settings.save();
                }),
            Spacer(flex: 1)
          ]),
          Divider(thickness: 3),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Text("Show tips"),
            Checkbox(
                value: UserSettings.load().showTips,
                onChanged: (value) {
                  var settings = UserSettings.load();
                  settings.showTips = value;
                  settings.save();
                }),
          ]),
          Divider(thickness: 3),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            ElevatedButton(
                child: Text("Clear data"),
                onPressed: () {
                  clearData();
                })
          ]),
          Divider(thickness: 3),
          Spacer(flex: 6),
          Row(children: <Widget>[
            Spacer(flex: 1),
            Text("In order to\nsee changes\nrestart the app",
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).primaryTextTheme.subtitle2),
            Spacer(flex: 1)
          ]),
          Spacer(flex: 3)
        ],
      ),
    );
  }
}
