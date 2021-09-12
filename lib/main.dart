import 'package:flutter/material.dart';
import 'package:mobile_weather/screens/home.dart';
import 'package:mobile_weather/widgets/weather_card.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Scaffold(
    body: SafeArea(
      child: SizedBox(
        height: 250,
        width: 250,
        child: WeatherCard()
      ),
    ),
  ),
));