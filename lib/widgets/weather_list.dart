/*import 'package:flutter/material.dart';
import 'package:mobile_weather/model/weather_data.dart';
import 'package:mobile_weather/widgets/weather_card.dart';

class WeatherList extends StatelessWidget {
  final List<WeatherCard> weatherForecast = <WeatherCard>[
    WeatherCard(weatherData: WeatherData(maxTemp: 25, minTemp: 15, imgCode: '01')),
    WeatherCard(weatherData: WeatherData(maxTemp: 25, minTemp: 15, imgCode: '01')),
    WeatherCard(weatherData: WeatherData(maxTemp: 25, minTemp: 15, imgCode: '01')),
    WeatherCard(weatherData: WeatherData(maxTemp: 25, minTemp: 15, imgCode: '01')),
    WeatherCard(weatherData: WeatherData(maxTemp: 25, minTemp: 15, imgCode: '01')),
  ];

  final PageController pageController = PageController(
    initialPage: 0,
    viewportFraction: 0.80,
  );
  
  WeatherList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemCount: weatherForecast.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: const EdgeInsets.only(left: 5, right: 5),
          child: weatherForecast[index]
        );
      }
    );
  }
}*/