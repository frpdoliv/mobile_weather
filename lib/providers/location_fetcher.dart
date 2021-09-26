import 'package:mobile_weather/model/location.dart';

abstract class LocationFetcher {
  Future<List<Location>> fetchLocations(List<String> locationStrings);
}