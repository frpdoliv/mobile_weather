import 'package:meta/meta.dart';
import 'package:location/location.dart' as gps;
import 'package:mobile_weather/model/location.dart';
import 'package:mobile_weather/providers/device_location_provider.dart';

abstract class GPSLocationFetcher {
  Future<Location?> fetch() async {
    gps.LocationData? deviceLocation = await DeviceLocationProvider.getDeviceLocation();
    if (deviceLocation != null && deviceLocation.latitude != null && deviceLocation.longitude != null) {
      return getAPIData(latitude: deviceLocation.latitude as double, longitude: deviceLocation.longitude as double);
    }
  }

  @protected
  Future<Location> getAPIData({required double latitude, required double longitude});
}