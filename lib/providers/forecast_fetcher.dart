import 'package:meta/meta.dart';
import 'package:mobile_weather/model/current_forecast.dart';
import 'package:mobile_weather/model/daily_forecast.dart';
import 'package:mobile_weather/model/hourly_forecast.dart';
import 'package:mobile_weather/model/location_forecast.dart';
import 'package:mobile_weather/model/weather_condition.dart';
import 'package:mobile_weather/model/wind_data.dart';

abstract class ForecastFetcher {
  late LocationForecast _locationForecast;
  
  LocationForecast get locationForecast{
    return _locationForecast;
  }

  CurrentForecast _currentForecastFactory(Map<String, dynamic> forecastJSON) {
    Map<String, dynamic> currentJSON = forecastJSON['current'];
    return CurrentForecast(
      curTime: DateTime.fromMillisecondsSinceEpoch(currentJSON['dt'] * 1000)
        .add(Duration(seconds: forecastJSON['timezone_offset'])),
      sunrise: DateTime.fromMillisecondsSinceEpoch(currentJSON['sunrise'] * 1000)
        .add(Duration(seconds: forecastJSON['timezone_offset'])),
      sunset: DateTime.fromMillisecondsSinceEpoch(currentJSON['sunset'] * 1000)
        .add(Duration(seconds: forecastJSON['timezone_offset'])),
      temperature: currentJSON['temp'].toDouble(),
      feelsLike: currentJSON['feels_like'].toDouble(),
      pressure: currentJSON['pressure'],
      humidity: currentJSON['humidity'],
      dewPoint: currentJSON['dew_point'].toDouble(),
      cloudiness: currentJSON['clouds'],
      uvIndex: currentJSON['uvi'].toDouble(),
      windData: WindData(
        windGust: currentJSON['wind_gust'],
        windSpeed: currentJSON['wind_speed'],
        windDirection: currentJSON['wind_deg'],
      ),
      weatherCondition: WeatherCondition(
        iconID: currentJSON['weather'][0]['icon']
          .substring(0, currentJSON['weather'][0]['icon'].length - 1),
        mainDesc: currentJSON['weather'][0]['main'],
        desc: currentJSON['weather'][0]['description'],
      ),
    );
  }

  List<HourlyForecast> _hourlyForecastFactory(Map<String, dynamic> forecastJSON) {
    return forecastJSON['hourly'].map<HourlyForecast>((hForecast) => HourlyForecast(
        curTime: DateTime.fromMillisecondsSinceEpoch(hForecast['dt'] * 1000).add(Duration(seconds: forecastJSON['timezone_offset'])),
        temperature: hForecast['temp'].toDouble(),
        feelsLike: hForecast['feels_like'].toDouble(),
        pressure: hForecast['pressure'],
        humidity: hForecast['humidity'],
        dewPoint: hForecast['dew_point'].toDouble(),
        cloudiness: hForecast['clouds'],
        uvIndex: hForecast['uvi'].toDouble(),
        precipitationProb:  hForecast['pop'].toDouble(),
        windData: WindData(
          windDirection: hForecast['wind_deg'],
          windGust: hForecast['wind_gust'].toDouble(),
          windSpeed: hForecast['wind_speed'].toDouble(),
        ),
        weatherCondition: WeatherCondition(
          iconID: hForecast['weather'][0]['icon']
            .substring(0, hForecast['weather'][0]['icon'].length - 1),
          mainDesc: hForecast['weather'][0]['main'],
          desc: hForecast['weather'][0]['description'],
        ),
      )
    ).toList();
  }

  List<DailyForecast> _dailyForecastFactory(Map<String, dynamic> forecastJSON) {
    return forecastJSON['daily'].map<DailyForecast>((dForecast) => DailyForecast(
      curTime: DateTime.fromMillisecondsSinceEpoch(dForecast['dt'] * 1000)
        .add(Duration(seconds: forecastJSON['timezone_offset'])),
      sunrise: DateTime.fromMillisecondsSinceEpoch(dForecast['sunrise'] * 1000)
        .add(Duration(seconds: forecastJSON['timezone_offset'])),
      sunset: DateTime.fromMillisecondsSinceEpoch(dForecast['sunset'] * 1000)
        .add(Duration(seconds: forecastJSON['timezone_offset'])),
      moonrise: DateTime.fromMillisecondsSinceEpoch(dForecast['moonrise'] * 1000)
        .add(Duration(seconds: forecastJSON['timezone_offset'])),
      moonset: DateTime.fromMillisecondsSinceEpoch(dForecast['moonset'] * 1000)
        .add(Duration(seconds: forecastJSON['timezone_offset'])),
      moonPhase: dForecast['moon_phase'].toDouble(),
      maxTemp: dForecast['temp']['max'].toDouble(),
      minTemp: dForecast['temp']['min'].toDouble(),
      timeOfDayTemp: {
        TimeOfDay.morning: dForecast['temp']['morn'].toDouble(),
        TimeOfDay.day: dForecast['temp']['day'].toDouble(),
        TimeOfDay.evening: dForecast['temp']['eve'].toDouble(),
        TimeOfDay.night: dForecast['temp']['night'].toDouble(),
      },
      timeOfDayFeeling: {
        TimeOfDay.morning: dForecast['feels_like']['morn'].toDouble(),
        TimeOfDay.day: dForecast['feels_like']['day'].toDouble(),
        TimeOfDay.evening: dForecast['feels_like']['eve'].toDouble(),
        TimeOfDay.night: dForecast['feels_like']['night'].toDouble(),
      },
      pressure: dForecast['pressure'],
      humidity: dForecast['humidity'],
      dewPoint: dForecast['dew_point'].toDouble(),
      cloudiness: dForecast['clouds'],
      uvIndex: dForecast['uvi'].toDouble(),
      precipitationProb: dForecast['pop'].toDouble(),
      windData: WindData(
        windDirection: dForecast['wind_deg'],
        windSpeed: dForecast['wind_speed'].toDouble(),
        windGust: dForecast['wind_gust'].toDouble,
      ),
      weatherCondition: WeatherCondition(
        iconID: dForecast['weather'][0]['icon']
          .substring(0, dForecast['weather'][0]['icon'].length - 1),
        mainDesc: dForecast['weather'][0]['main'],
        desc: dForecast['weather'][0]['description'],
      ),
    )).toList();
  }

  Future<void> update() async {
    Map<String, dynamic> forecastJSON = await fetch();
    _locationForecast = LocationForecast(
      latitude: forecastJSON['lat'].toDouble(),
      longitude: forecastJSON['lon'].toDouble(),
      timezone: forecastJSON['timezone'],
      timezoneOffset: forecastJSON['timezone_offset'],
      currentForecast: _currentForecastFactory(forecastJSON),
      hourlyForecasts: _hourlyForecastFactory(forecastJSON),
      dailyForecasts: _dailyForecastFactory(forecastJSON),
    );
  }

  @protected
  Future<Map<String, dynamic>> fetch();
}