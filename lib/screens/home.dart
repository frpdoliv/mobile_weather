import 'package:flutter/material.dart';
import 'package:mobile_weather/widgets/weather_list.dart';

class Home extends StatelessWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea (
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.40,
          width: MediaQuery.of(context).size.width * 0.85,
          child: WeatherList()
        ),
      ),
    );
  }
}