class Location {
  String countryCode;
  String defaultCityName;
  String? stateName;
  String latitude;
  String longitude;
  Map<String, String>? cityNames;

  Location({required this.countryCode, this.cityNames, required this.defaultCityName, this.stateName, required this.latitude, required this.longitude});
}