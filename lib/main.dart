import 'package:flutter/material.dart';
import 'package:mobile_weather/screens/forecast_view.dart';
import 'package:mobile_weather/screens/search.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const ForecastView(),
      '/search': (context) => const Search(),
    },
  ));
}