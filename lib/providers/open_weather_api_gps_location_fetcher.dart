import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile_weather/model/location.dart';
import 'package:mobile_weather/providers/gps_location_fetcher.dart';

class OpenWeatherAPIGPSLocationFetcher extends GPSLocationFetcher {

  @override
  Future<Location> getAPIData({required double latitude, required double longitude}) async {
    http.Response response = await http.get(Uri.parse("http://api.openweathermap.org/geo/1.0/reverse?lat=$latitude&lon=$longitude&limit=1&appid=$_apiKey"));
    Map<String, dynamic> locationJSON = jsonDecode(response.body)[0];
    return Location(
      latitude: locationJSON['lat'].toString(),
      longitude: locationJSON['lon'].toString(),
      defaultCityName: locationJSON['name'].toString(),
      countryCode: locationJSON['country'].toString(),
      stateName: locationJSON['state'].toString(),
      cityNames: locationJSON['local_names'] != null ? Map<String, String>.from(locationJSON['local_names']) : null,
    );
  }
}