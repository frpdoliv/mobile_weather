import 'dart:convert';
import 'package:mobile_weather/providers/forecast_fetcher.dart';
import 'package:http/http.dart' as http;

class OpenWeatherAPIForecastFetcher extends ForecastFetcher {
  final String latitude;
  final String longitude;
  static const String apiKey = //TODO Place api key here
  
  OpenWeatherAPIForecastFetcher._({required this.latitude, required this.longitude});

  static Future<OpenWeatherAPIForecastFetcher> create({required String longitude, required String latitude}) async {
    OpenWeatherAPIForecastFetcher newInstance = OpenWeatherAPIForecastFetcher._(longitude: longitude, latitude: latitude);
    await newInstance.update();
    return newInstance;
  } 

  @override
  Future<Map<String, dynamic>> fetch() async {
    http.Response response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/onecall?lat=$latitude&lon=$longitude&appid=$apiKey'));
    return jsonDecode(response.body);
  }
}