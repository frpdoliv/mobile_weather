import 'package:mobile_weather/screens/current_forecast.dart';
import 'package:mobile_weather/screens/daily_forecast.dart';
import 'package:mobile_weather/screens/hourly_forecast.dart';

class LocationForecast{
  double latitude;
  double longitude;
  String timezone;
  int timezoneOffset;
  CurrentForecast currentForecast;
  List<HourlyForecast> hourlyForecasts;
  List<DailyForecast> dailyForecasts;

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