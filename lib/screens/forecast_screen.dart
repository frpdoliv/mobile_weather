import 'package:flutter/material.dart';
import 'package:mobile_weather/model/location_forecast.dart';

abstract class ForecastScreen extends StatelessWidget {
  final LocationForecast locationForecast;
  const ForecastScreen({ Key? key, required this.locationForecast }) : super(key: key);
}