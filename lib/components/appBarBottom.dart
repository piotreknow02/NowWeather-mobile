import 'package:now_weather/managers/mainActivityManager.dart';
import 'package:flutter/material.dart';
import 'package:now_weather/managers/valuesManager.dart' as values;

enum ItemNumber { Home, MyLocation, Search, Weather, Settings }

class NowWeatherBottomBar extends StatelessWidget {
  final ItemNumber itemNum;
  final double borderRadius = values.borderRadius;
  NowWeatherBottomBar(this.itemNum);
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: UserSettings.load().showTips,
      showUnselectedLabels: UserSettings.load().showTips,
      currentIndex: itemNum.index,
      backgroundColor: Theme.of(context).accentColor,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.location_on), label: "My location"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
        BottomNavigationBarItem(icon: Icon(Icons.cloud), label: "Settings"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
      ],
      onTap: (int index) {
        final iIndex = ItemNumber.values[index];
        if (iIndex == itemNum) return;
        switch (iIndex) {
          case ItemNumber.Home:
            while (Navigator.canPop(context)) Navigator.pop(context);
            break;
          case ItemNumber.MyLocation:
            Navigator.maybePop(context);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        getWeatherPageForCity("My location")));
            break;
          case ItemNumber.Search:
            Navigator.maybePop(context);
            Navigator.pushNamed(context, "/search");
            break;
          case ItemNumber.Settings:
            Navigator.maybePop(context);
            Navigator.pushNamed(context, "/settings");
            break;
          case ItemNumber.Weather:
            Navigator.maybePop(context);
            Navigator.pushNamed(context, "/search");
            break;
        }
      },
    );
  }
}
