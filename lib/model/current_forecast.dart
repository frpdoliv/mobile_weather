import 'package:mobile_weather/model/weather_condition.dart';
import 'package:mobile_weather/model/wind_data.dart';

class CurrentForecast {
  final DateTime curTime;
  final DateTime sunrise;
  final DateTime sunset;
  final double temperature;
  final double feelsLike;
  final int pressure;
  final int humidity;
  final double dewPoint;
  final int cloudiness;
  final double uvIndex;
  final WindData windData;
  final WeatherCondition weatherCondition;

  CurrentForecast({
    required this.curTime, 
    required this.sunrise, 
    required this.sunset,
    required this.temperature, 
    required this.feelsLike, 
    required this.pressure,
    required this.humidity,
    required this.dewPoint, 
    required this.cloudiness, 
    required this.uvIndex, 
    required this.windData, 
    required this.weatherCondition
  });
}