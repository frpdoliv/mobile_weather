import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile_weather/model/location.dart';
import 'package:mobile_weather/providers/user_input_location_fetcher.dart';

class OpenWeatherAPIUserInputLocationFetcher implements UserInputLocationFetcher {
  List<String> locationStrings;
  
  OpenWeatherAPIUserInputLocationFetcher(this.locationStrings);

  @override
  Future<List<Location>> fetch() async {
    http.Response response = await http.get(Uri.parse('http://api.openweathermap.org/geo/1.0/direct?q=${locationStrings.join(',')}&limit=5&appid=$_apiKey'));
    List<dynamic> locationJSON = jsonDecode(response.body);
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