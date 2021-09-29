import 'package:location/location.dart';

class DeviceLocationProvider {
  static Future<bool> _tryGetPermission(Location deviceLocation) async {
    PermissionStatus permissionStatus = await deviceLocation.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await deviceLocation.requestPermission();
    }
    return (permissionStatus == PermissionStatus.granted || permissionStatus == PermissionStatus.grantedLimited);
  }

  static Future<bool> _tryTurnOnLocation(Location deviceLocation) async {
    bool serviceEnabled = await deviceLocation.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await deviceLocation.requestService();
    }
    return serviceEnabled;
  }

  static Future<LocationData?> getDeviceLocation() async {
    Location deviceLocation = Location();
    bool hasPermission = await _tryGetPermission(deviceLocation);
    bool hasService = await _tryTurnOnLocation(deviceLocation); 
    if (hasPermission && hasService) {
      await deviceLocation.changeSettings(accuracy: LocationAccuracy.low);
      return deviceLocation.getLocation();
    }
  }
}