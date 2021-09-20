import 'package:mobile_weather/model/weather_condition.dart';
import 'package:mobile_weather/model/wind_data.dart';

class HourlyForecast {
  final DateTime curTime;
  final double temperature;
  final double feelsLike;
  final int pressure;
  final int humidity;
  final double dewPoint;
  final int cloudiness;
  final double uvIndex;
  final double precipitationProb;
  final WindData windData;
  final WeatherCondition weatherCondition;

  HourlyForecast({
    required this.curTime,
    required this.temperature,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.cloudiness,
    required this.uvIndex,
    required this.precipitationProb,
    required this.windData,
    required this.weatherCondition,
  });
}