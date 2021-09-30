class Location {
  String countryCode;
  String defaultCityName;
  String? stateName;
  double latitude;
  double longitude;
  Map<String, String>? cityNames;

  Location():
    this.withAttr(countryCode: 'PT', defaultCityName: 'Leiria', latitude: 0, longitude: 0);

  Location.withAttr({required this.countryCode, this.cityNames, required this.defaultCityName, this.stateName, required this.latitude, required this.longitude});

  @override
  String toString() {
    String stateString = stateName == null ? '' : '$stateName, ';
    return '${cityNames?['en'] ?? defaultCityName}, $stateString$countryCode';
  }
}