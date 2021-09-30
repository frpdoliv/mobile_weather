import 'package:flutter/material.dart';
import 'package:mobile_weather/model/location_forecast.dart';
import 'package:mobile_weather/screens/forecast_screen.dart';

class DailyForecast extends ForecastScreen {
  const DailyForecast({ Key? key, required LocationForecast locationForecast}): super(key: key, locationForecast: locationForecast);

  @override
  Widget build(BuildContext context) {
    return Text('DailyForecast');
  }
}