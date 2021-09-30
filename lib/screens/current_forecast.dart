import 'package:flutter/material.dart';
import 'package:mobile_weather/model/location_forecast.dart';
import 'package:mobile_weather/screens/forecast_screen.dart';

class CurrentForecast extends ForecastScreen {
  const CurrentForecast({ Key? key, required LocationForecast locationForecast}): super(key: key, locationForecast: locationForecast);

  @override
  Widget build(BuildContext context) {
    return Text(locationForecast.timezone);
  }
}