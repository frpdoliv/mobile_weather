import 'package:mobile_weather/model/current_forecast.dart';
import 'package:mobile_weather/model/daily_forecast.dart';
import 'package:mobile_weather/model/hourly_forecast.dart';

class LocationForecast{
  final double latitude;
  final double longitude;
  final String timezone;
  final int timezoneOffset;
  final CurrentForecast currentForecast;
  final List<HourlyForecast> hourlyForecasts;
  final List<DailyForecast> dailyForecasts;

  LocationForecast({
    required this.latitude,
    required this.longitude,
    required this.timezone,
    required this.timezoneOffset,
    required this.currentForecast,
    required this.hourlyForecasts,
    required this.dailyForecasts,
  });
}