import 'package:flutter/material.dart';
import 'package:mobile_weather/model/weather_data.dart';
import 'package:mobile_weather/widgets/weather_card.dart';

class Home extends StatelessWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea (
        child: WeatherCard(weatherData: WeatherData(maxTemp: 25, minTemp: 15, imgCode: '01'),),
      ),
    );
  }
}