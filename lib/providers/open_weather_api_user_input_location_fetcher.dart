import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile_weather/model/location.dart';
import 'package:mobile_weather/providers/json_provider.dart';
import 'package:mobile_weather/providers/user_input_location_fetcher.dart';

class OpenWeatherAPIUserInputLocationFetcher implements UserInputLocationFetcher {
  List<String> locationStrings;
  
  OpenWeatherAPIUserInputLocationFetcher(this.locationStrings);

  @override
  Future<List<Location>> fetch() async {
    List<dynamic> locationJSON = await JSONProvider.get(Uri.parse('http://api.openweathermap.org/geo/1.0/direct?q=${locationStrings.join(',')}&limit=5&appid=$_apiKey'));
    return locationJSON.map<Location>((location) {
      return Location.withAttr(
        latitude: double.parse(location['lat'].toString()),
        longitude: double.parse(location['lon'].toString()),
        stateName: location['state'],
        countryCode: location['country'],
        defaultCityName: location['name'],
        cityNames: location['local_names'] != null ? Map<String, String>.from(location['local_names']) : null,
      );
    }).toList();
  }
}