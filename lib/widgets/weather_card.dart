/*import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_weather/model/weather_data.dart';

class WeatherCard extends StatelessWidget {
  WeatherCard({ Key? key, required this.weatherData}) : super(key: key);

  final WeatherData weatherData;
  final Color? _dividerColor = Colors.grey[350]; 
  final TextStyle _weatherStateStyle = GoogleFonts.ubuntu(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 24.0,
  );
  final TextStyle _valueDescriptionStyle = GoogleFonts.ubuntu(
    color: Colors.grey[850],
    fontWeight: FontWeight.w600,
    fontSize: 14.0,
  ); 
  final TextStyle _valueStyle = GoogleFonts.ubuntu(
    color: Colors.grey,
    fontSize: 14.0,
  ); 


  @override
  Widget build(BuildContext context) {
    return Card(
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
            Expanded (
              flex: 2,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Ceu Mt Nubladuh',
                  style: _weatherStateStyle,
                ),
              ),
            ),
            Divider (
              color: _dividerColor,
              indent: 0.5,
              endIndent: 0.5,
            ),
            Expanded (
              flex: 6,
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
                  RichText(
                    text: TextSpan (
                      children: <TextSpan>[
                        TextSpan(
                          text: 'MIN: ',
                          style: _valueDescriptionStyle,
                        ),
                        TextSpan(
                          text: '${weatherData.minTemp}',
                          style: _valueStyle,
                        ),
                      ]
                    ),
                  ),
                  VerticalDivider(
                    color: _dividerColor,
                    width: 50.0,
                  ),
                  RichText(
                    text: TextSpan (
                      children: <TextSpan>[
                        TextSpan(
                          text: 'MAX: ',
                          style: _valueDescriptionStyle,
                        ),
                        TextSpan(
                          text: '${weatherData.maxTemp}',
                          style: _valueStyle,
                        ),
                      ]
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}*/