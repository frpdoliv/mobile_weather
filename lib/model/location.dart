class Location {
  String countryCode;
  String internalCityName;
  String? stateName;
  String latitude;
  String longitude;
  Map<String, String> cityNames;

  Location({required this.countryCode, required this.cityNames, required this.internalCityName, this.stateName, required this.latitude, required this.longitude});
}