import 'package:flutter/material.dart';
import 'package:mobile_weather/model/weather_data.dart';

class WeatherCard extends StatelessWidget {
  WeatherCard({ Key? key, required this.weatherData}) : super(key: key);

  final WeatherData weatherData;
  final Color? _dividerColor = Colors.grey[350]; 

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.40,
      width: MediaQuery.of(context).size.width * 0.85,
      child: Card(
        elevation: 6.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding (
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0, 
            vertical: 15.0
          ),
          child: Column (
            children: <Widget> [
              const Expanded (
                flex: 1,
                child: Align(
                  alignment: Alignment.center,
                  child: Text('Ceu Mt Nubladuh'),
                ),
              ),
              Divider (
                color: _dividerColor,
                indent: 0.5,
                endIndent: 0.5,
              ),
              Expanded (
                flex: 7,
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset('assets/weather_indicators/${weatherData.imgCode}.png')
                ),
              ),
              Divider (
                color: _dividerColor,
                indent: 0.5,
                endIndent: 0.5,
              ),
              Expanded (
                flex: 2,
                child: Row (
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget> [
                    Text('MIN: ${weatherData.minTemp}'),
                    VerticalDivider(
                      color: _dividerColor,
                      width: 50.0,
                    ),
                    Text('MAX: ${weatherData.maxTemp}'),
                  ],
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}