import 'package:mobile_weather/model/location.dart';
import 'package:mobile_weather/providers/gps_location_fetcher.dart';
import 'package:mobile_weather/providers/json_provider.dart';

class OpenWeatherAPIGPSLocationFetcher extends GPSLocationFetcher {

  @override
  Future<Location> getAPIData({required double latitude, required double longitude}) async {
    Map<String, dynamic> locationJSON = (await JSONProvider.get(Uri.parse("http://api.openweathermap.org/geo/1.0/reverse?lat=$latitude&lon=$longitude&limit=1&appid=$_apiKey")))[0];
    return Location.withAttr(
      latitude: double.parse(locationJSON['lat'].toString()),
      longitude: double.parse(locationJSON['lon'].toString()),
      defaultCityName: locationJSON['name'].toString(),
      countryCode: locationJSON['country'].toString(),
      stateName: locationJSON['state'],
      cityNames: locationJSON['local_names'] != null ? Map<String, String>.from(locationJSON['local_names']) : null,
    );
  }
}