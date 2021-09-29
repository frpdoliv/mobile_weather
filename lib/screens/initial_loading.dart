import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mobile_weather/model/location.dart';
import 'package:mobile_weather/model/location_forecast.dart';
import 'package:mobile_weather/providers/open_weather_api_forecast_fetcher.dart';
import 'package:mobile_weather/providers/open_weather_api_gps_location_fetcher.dart';
import 'package:mobile_weather/providers/open_weather_api_user_input_location_fetcher.dart';

class InitialLoading extends StatefulWidget {
  const InitialLoading({ Key? key }) : super(key: key);

  @override
  State<InitialLoading> createState() => _InitialLoadingState();
}

class _InitialLoadingState extends State<InitialLoading> {
  Future<void> _loadDefaultLocation() async {
    int initMilliseconds = DateTime.now().millisecondsSinceEpoch;
    Location? location = await OpenWeatherAPIGPSLocationFetcher().fetch();
    if (location == null) {
      List<Location> inputLocations = await OpenWeatherAPIUserInputLocationFetcher(['Lisbon', 'PT']).fetch();
      location = inputLocations[0];
    }

    OpenWeatherAPIForecastFetcher forecastFetcher = await OpenWeatherAPIForecastFetcher.create(longitude: location.longitude, latitude: location.latitude);
    int remainingTime = 1000 - (DateTime.now().millisecondsSinceEpoch - initMilliseconds);
    Future.delayed(
      Duration(milliseconds: remainingTime),
      () {
        Navigator.popAndPushNamed(context, '/', arguments: {
          'location': location,
          'forecast': forecastFetcher.locationForecast,
        });
      }
    );
  }
  
  @override
  void initState() {
    _loadDefaultLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Center(
        child: SpinKitCircle(color: Colors.red),
      ),
    );
  }
}