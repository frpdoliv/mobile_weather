import 'dart:io';

import 'package:http/http.dart';
import 'package:yaml/yaml.dart';
import 'package:mobile_weather/model/weather_data.dart';

class WeatherDataFetcher {
  static String apiKey = () { 
    File apiKeyFile = File('assets/api_keys.dart');
    return loadYaml(apiKeyFile.readAsStringSync())['open_weather_api_key'];
  }();
  String latitude;
  String longitude;

  WeatherDataFetcher._({required this.latitude, required this.longitude});

  static Future<WeatherDataFetcher> create({required String latitude, required String longitude}) async {
    WeatherDataFetcher newInstance = WeatherDataFetcher._(latitude: latitude, longitude: longitude);
    await newInstance.update();
    return newInstance;
  }

  Future<void> update() async {
    get(Uri.parse('https://api.openweathermap.org/data/2.5/onecall?lat=$latitude&lon=$longitude&exclude=minutely&appid=$apiKey'));
  }
}