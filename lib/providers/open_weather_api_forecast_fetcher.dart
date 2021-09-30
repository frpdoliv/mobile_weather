import 'package:mobile_weather/providers/forecast_fetcher.dart';
import 'package:mobile_weather/providers/json_provider.dart';

class OpenWeatherAPIForecastFetcher extends ForecastFetcher {
  static const String apiKey = //TODO Place api key here
  
  OpenWeatherAPIForecastFetcher(): this.withCoordinates(latitude: 0, longitude: 0);

  OpenWeatherAPIForecastFetcher.withCoordinates({required double longitude, required double latitude}): super(latitude: latitude, longitude: longitude);

  @override
  Future<dynamic> fetch() async {
    return JSONProvider.get(Uri.parse('https://api.openweathermap.org/data/2.5/onecall?lat=$latitude&lon=$longitude&appid=$apiKey'));
  }
}