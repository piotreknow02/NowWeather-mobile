import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherInfoShort
{
  String loc;
  String desc;
  int temp;
  String date;

  WeatherInfoShort({this.loc = "Somewhere", this.desc = "Normal", this.temp = 18, this.date = "Current"});

  WeatherInfoShort.fromJSON(String json)
  {
    Map<String, dynamic> weather = jsonDecode(json);
    this.date = weather["date"];
    this.desc = weather["desc"];
    this.temp = weather["temp"];
  }
}
WeatherInfoShort getShortWeatherForCity(String city)
{
  final request = http.get("http://127.0.0.1:5000/nowweather/getweather?city=" + city + "&info=short");
  String _wis;
  request.then((val) => _wis = val.body);
  return WeatherInfoShort.fromJSON(_wis);
}
WeatherInfoLong getLongWeatherForCity(String city)
{
  final request = http.get("http://127.0.0.1:5000/nowweather/getweather?city=" + city + "&info=long");
  String _wil;
  request.then((val) => _wil = val.body);
  return WeatherInfoLong.fromJSON(_wil);
}
class WeatherInfoLong extends WeatherInfoShort
{
  int uvIndex;
  int wind;
  int windGuts;
  int humidity;
  int dewPiont;
  double pressure;
  int cloudCover;
  int visibility;
  int ceiling;
  WeatherInfoLong({this.uvIndex = 0, this.wind = 0, this.windGuts = 0, this.humidity = 0, this.dewPiont, this.pressure = 1080, this.ceiling = 2400, this.cloudCover = 0, this.visibility = 10000});
  WeatherInfoLong.fromJSON(String json)
  {
    Map<String, dynamic> weather = jsonDecode(json);
    this.date = weather["date"];
    this.desc = weather["desc"];
    this.temp = weather["temp"];
    this.uvIndex = weather["UVindex"];
    this.wind = weather["wind"];
    this.windGuts = weather["windGuts"];
    this.humidity = weather["humidity"];
    this.dewPiont = weather["dewPoint"];
    this.pressure = weather["pressure"];
    this.cloudCover = weather["cloudCover"];
    this.visibility = weather["visibility"];
    this.ceiling = weather["ceiling"];
  }
}