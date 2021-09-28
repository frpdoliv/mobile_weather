import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile_weather/model/location.dart';
import 'package:mobile_weather/providers/location_fetcher.dart';

class OpenWeatherAPILocationFetcher implements LocationFetcher {
  static const String _apiKey = "60349aea2f345aed3c44a21871eb8d20";
  
  Future<List<dynamic>> _fetchFromAPI(List<String> locationStrings) async {
    http.Response response = await http.get(Uri.parse('http://api.openweathermap.org/geo/1.0/direct?q=${locationStrings.join(',')}&appid=$_apiKey'));
    return jsonDecode(response.body);
  }

  @override
  Future<List<Location>> fetchLocations(List<String> locationStrings) async {
    List<dynamic> locationJSON = await _fetchFromAPI(locationStrings);
    return locationJSON.map<Location>((location) {
      return Location(
        latitude: location['lat'].toString(),
        longitude: location['lon'].toString(),
        stateName: location['state'],
        countryCode: location['country'],
        defaultCityName: location['name'],
        cityNames: location['local_names'] != null ? Map<String, String>.from(location['local_names']) : null,
      );
    }).toList();
  }
}