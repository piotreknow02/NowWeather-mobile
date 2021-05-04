import 'dart:core';
import 'dart:math';

String getRandomBgPath()
{
  while(true)
  {
  final index = Random.secure().nextInt(bgs.length - 1);
  if (bgs[index].condition)
    return bgs[index].path;
  else continue;
  }
}

enum Seasons {Spring, Summer, Autumn, Winter}
Map<Seasons, DateTime> seasonsMap = 
{
  Seasons.Spring: DateTime(DateTime.now().year, 21, 3),
  Seasons.Summer: DateTime(DateTime.now().year, 20, 6),
  Seasons.Autumn: DateTime(DateTime.now().year, 22, 9),
  Seasons.Winter: DateTime(DateTime.now().year, 21, 12)
};

final List<Background> bgs = [
    Background(path: "lib/assets/images/backgrounds/aerial-photo-of-mountain-surrounded-by-fog-733174.jpg", condition: Conditions.seasonCondition([Seasons.Spring, Seasons.Summer, Seasons.Autumn]) && Conditions.isSunsetOrSunriseCondition()),
    Background(path: "lib/assets/images/backgrounds/alone-buildings-city-cityscape-220444.jpg"),
    Background(path: "lib/assets/images/backgrounds/architecture-buildings-business-city-325185.jpg"),
    Background(path: "lib/assets/images/backgrounds/bird-s-eye-view-photo-of-pine-trees-during-daytime-3509970.jpg", condition: Conditions.seasonCondition([Seasons.Winter])),
    Background(path: "lib/assets/images/backgrounds/blue-and-green-sky-and-mountain-3617500.jpg", condition: Conditions.seasonCondition([Seasons.Winter]) && !Conditions.isDayCondition()),
    Background(path: "lib/assets/images/backgrounds/elio-santos-B6hw9ooyldM-unsplash.jpg", condition: Conditions.seasonCondition([Seasons.Spring, Seasons.Summer, Seasons.Autumn]) && Conditions.isDayCondition()),
    Background(path: "lib/assets/images/backgrounds/forest-during-day-2440061.jpg", condition: Conditions.isSunsetOrSunriseCondition()),
    Background(path: "lib/assets/images/backgrounds/green-grass-pathway-2254030.jpg", condition: Conditions.seasonCondition([Seasons.Spring, Seasons.Summer, Seasons.Autumn])),
    Background(path: "lib/assets/images/backgrounds/green-pine-trees-covered-with-fogs-under-white-sky-during-167699.jpg"),
    Background(path: "lib/assets/images/backgrounds/ireland-1971997_1920.jpg", condition: Conditions.seasonCondition([Seasons.Spring, Seasons.Summer, Seasons.Autumn]) && Conditions.isDayCondition()),
    Background(path: "lib/assets/images/backgrounds/lago-di-limides-3025780_1920.jpg", condition: Conditions.seasonCondition([Seasons.Spring, Seasons.Summer, Seasons.Autumn]) && Conditions.isSunsetOrSunriseCondition()),
    Background(path: "lib/assets/images/backgrounds/landscape-3369304_1920.jpg", condition: Conditions.seasonCondition([Seasons.Spring, Seasons.Summer, Seasons.Autumn]) && Conditions.isSunsetOrSunriseCondition()),
    Background(path: "lib/assets/images/backgrounds/light-sea-dawn-landscape-33545.jpg", condition: Conditions.isSunsetOrSunriseCondition()),
    Background(path: "lib/assets/images/backgrounds/lightning-and-gray-clouds-1162251.jpg", condition: !Conditions.isSunsetOrSunriseCondition()),
    Background(path: "lib/assets/images/backgrounds/max-larochelle-uu-Jw5SunYI-unsplash.jpg", condition: !Conditions.isDayCondition()),
    Background(path: "lib/assets/images/backgrounds/mountain-view-golden-hour-photography-733168.jpg", condition: Conditions.isSunsetOrSunriseCondition()),
    Background(path: "lib/assets/images/backgrounds/osman-rana-HOtPD7Z_74s-unsplash.jpg", condition: Conditions.seasonCondition([Seasons.Autumn])),
    Background(path: "lib/assets/images/backgrounds/pathway-along-the-pine-trees-2310641.jpg", condition: Conditions.seasonCondition([Seasons.Autumn])),
    Background(path: "lib/assets/images/backgrounds/photography-of-fall-trees-1591447.jpg", condition: Conditions.seasonCondition([Seasons.Autumn])),
    Background(path: "lib/assets/images/backgrounds/rain-drops-459451.jpg"),
    Background(path: "lib/assets/images/backgrounds/symmetrical-photography-of-clouds-covered-blue-sky-1486974.jpg", condition: Conditions.seasonCondition([Seasons.Spring, Seasons.Summer, Seasons.Autumn])),
    Background(path: "lib/assets/images/backgrounds/village-in-front-of-the-mountains-2175952.jpg", condition: Conditions.seasonCondition([Seasons.Spring, Seasons.Summer, Seasons.Autumn]))
  ];

class Conditions
{
  static bool timeCondition(DateTime from, DateTime to)
  {
    final now = DateTime.now();
    if(from.hour < now.hour && to.hour > now.hour)
      return true;
    return false;
  }
  static bool seasonCondition(List<Seasons> s)
  {
    for (Seasons season in s) {
      final DateTime seasonStart = seasonsMap[season];
      final DateTime seasonEnd = seasonsMap[Seasons.values[season.index]];
      if(dateCondition(seasonStart, seasonEnd)) return true;
    }
    return false;
  }
  static bool dateCondition(DateTime from, DateTime to)
  {
    final now = DateTime.now();
    if(from.month <= now.month && to.month >= now.month)
    {
      if(from.month == now.month)
        return from.day < now.day ? true : false;
      else if(to.month ==now.month)
        return to.day > now.day ? true : false;
      else return true;
    }
    return false;
  }
  static bool isDayCondition()
  {
    final now = DateTime.now();
    if(now.hour < 19 && now.hour > 6)
      return true;
    return false;
  }
  static bool isSunsetOrSunriseCondition()
  {
    final now = DateTime.now();
    if(now.hour > 17 && now.hour < 19)
      return true;
    if (now.hour > 4 && now.hour < 7)
      return true;
    return false;
  }
}

class Background
{
  final String path;
  final bool condition;
  Background({this.path = "", this.condition = true});
}
