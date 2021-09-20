import 'package:mobile_weather/model/weather_condition.dart';
import 'package:mobile_weather/model/wind_data.dart';

enum TimeOfDay {morning, day, evening, night}

class DailyForecast{
  final DateTime curTime;
  final DateTime sunrise;
  final DateTime sunset;
  final DateTime moonrise;
  final DateTime moonset;
  final double moonPhase;
  final double maxTemp;
  final double minTemp;
  final Map<TimeOfDay, double> timeOfDayTemp;
  final Map<TimeOfDay, double> timeOfDayFeeling;
  final int pressure;
  final int humidity;
  final double dewPoint;
  final int cloudiness;
  final double uvIndex;
  final double precipitationProb;
  final WindData windData;
  final WeatherCondition weatherCondition;

  DailyForecast({
    required this.curTime,
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.maxTemp,
    required this.minTemp,
    required this.timeOfDayTemp,
    required this.timeOfDayFeeling,
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