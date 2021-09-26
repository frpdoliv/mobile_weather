import 'package:flutter/material.dart';
import 'package:mobile_weather/model/location_forecast.dart';

class CurrentForecast extends StatelessWidget {
  final LocationForecast? _forecastData; 
  
  const CurrentForecast({ Key? key , LocationForecast? forecastData}) : 
    _forecastData = forecastData,
    super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('CurrentForecast'),
        Text('CurrentForecast'),
        Text('CurrentForecast'),
        Text('CurrentForecast'),
        Text('CurrentForecast'),
        Text('CurrentForecast'),
        Text('CurrentForecast'),
        Text('CurrentForecast'),
        Text('CurrentForecast'),
        Text('CurrentForecast'),
        Text('CurrentForecast'),
      ],
    );
  }
}