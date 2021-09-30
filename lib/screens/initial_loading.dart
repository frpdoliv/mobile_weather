import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mobile_weather/model/io_failure.dart';
import 'package:mobile_weather/model/location.dart';
import 'package:mobile_weather/providers/open_weather_api_gps_location_fetcher.dart';
import 'package:mobile_weather/providers/open_weather_api_user_input_location_fetcher.dart';

class InitialLoading extends StatefulWidget {
  const InitialLoading({ Key? key }) : super(key: key);

  @override
  State<InitialLoading> createState() => _InitialLoadingState();
}

class _InitialLoadingState extends State<InitialLoading> {
  bool _isSnackbarActive = false;

  void _closeSnackBars(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    _isSnackbarActive = false;
  }

  void _addSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('No internet connection'),
            action: SnackBarAction(
              label: 'Retry',
              onPressed: () {
                _closeSnackBars(context);
                _loadDefaultLocation();
              },
            ),
            duration: const Duration(
              days: 10000,
            ),
          )
    ).closed.then((_) => _isSnackbarActive = false);
    _isSnackbarActive = true;
  }

  Future<void> _loadDefaultLocation() async {
    try {
      int initMilliseconds = DateTime.now().millisecondsSinceEpoch;
      Location? location = await OpenWeatherAPIGPSLocationFetcher().fetch();
      if (location == null) {
        List<Location> inputLocations = await OpenWeatherAPIUserInputLocationFetcher(['Lisbon', 'PT']).fetch();
        location = inputLocations[0];
      }

      _closeSnackBars(context);
      int remainingTime = 1000 - (DateTime.now().millisecondsSinceEpoch - initMilliseconds);
      Future.delayed(
        Duration(milliseconds: remainingTime),
        () {
          Navigator.popAndPushNamed(context, '/', arguments: location);
        }
      );
    } on IOFailure {
      if (!_isSnackbarActive) {
        _addSnackBar(context);
      }
      Future.delayed(const Duration(seconds: 1, milliseconds: 500), _loadDefaultLocation);
    }
  }
  
  @override
  void initState() {
    _loadDefaultLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitCircle(color: Colors.red),
      ),
    );
  }
}