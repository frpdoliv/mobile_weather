import 'package:flutter/material.dart';
import 'package:mobile_weather/screens/forecast_view.dart';
import 'package:mobile_weather/screens/initial_loading.dart';
import 'package:mobile_weather/screens/search.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/loading',
    routes: {
      '/': (context) => const ForecastView(),
      '/search': (context) => const Search(),
      '/loading': (context) => const InitialLoading()
    },
  ));
}