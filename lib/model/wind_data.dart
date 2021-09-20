class WindData {
  final double windSpeed;
  final int windDirection;
  final double? windGust;

  WindData({this.windGust, required this.windDirection, required this.windSpeed});
}