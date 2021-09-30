import 'package:flutter/material.dart';
import 'package:mobile_weather/model/location.dart';
import 'package:mobile_weather/model/location_forecast.dart';
import 'package:mobile_weather/providers/forecast_fetcher.dart';
import 'package:mobile_weather/providers/open_weather_api_forecast_fetcher.dart';
import 'package:mobile_weather/screens/current_forecast.dart';
import 'package:mobile_weather/screens/daily_forecast.dart';
import 'package:mobile_weather/screens/forecast_screen.dart';
import 'package:mobile_weather/screens/hourly_forecast.dart';
import 'package:mobile_weather/widgets/blank_loading_screen.dart';

class ForecastView extends StatefulWidget {
  const ForecastView({ Key? key }) : super(key: key);

  @override
  State<ForecastView> createState() => _ForecastViewState();
}

class _ForecastViewState extends State<ForecastView> {
  int _selectedIndex = 1;
  Location? _location;
  ForecastFetcher _forecastFetcher = OpenWeatherAPIForecastFetcher();

  Location? get location {
    return _location;
  }

  set location(Location? location) {
    _location = location;
    if (location != null) {
      _forecastFetcher = OpenWeatherAPIForecastFetcher.withCoordinates(longitude: location.longitude, latitude: location.latitude);
    }
  }

  void userChangeLocation() async {
    Location? searchResult = await Navigator.pushNamed(context, '/search') as Location?;
    setState(() {
      location = searchResult ?? location;
    });
  }

  final List<ForecastScreen Function(LocationForecast locationForecast)> _screenBuilders = [
    (locationForecast) => HourlyForecast(locationForecast: locationForecast),
    (locationForecast) => CurrentForecast(locationForecast: locationForecast),
    (locationForecast) => DailyForecast(locationForecast: locationForecast),
  ];

  @override
  Widget build(BuildContext context) {
    location ??= ModalRoute.of(context)?.settings.arguments as Location?;
    if (location == null) {
      return const Text("You're not supposed to be here");
    } else {
      return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text(_location.toString()),
          actions: <Widget>[
            IconButton(
              onPressed: (){},
              icon: const Icon(Icons.settings),
            ),
          ],
          leading: IconButton(
            onPressed: userChangeLocation,
            icon: const Icon(Icons.search),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) => setState(() => _selectedIndex = index),
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.red,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.schedule),
              icon: Icon(Icons.schedule_outlined),
              label: 'Hourly',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.place),
              icon: Icon(Icons.place_outlined),
              label: 'Current',
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.calendar_today),
              icon: Icon(Icons.calendar_today_outlined),
              label: 'Daily',
            ),
          ],
        ),
        body: FutureBuilder(
          future: _forecastFetcher.locationForecast,
          builder: (BuildContext context, AsyncSnapshot<LocationForecast> snapshot) {
            switch(snapshot.connectionState) { 
              case ConnectionState.none:
                return const BlankLoadingScreen();
              case ConnectionState.active:
              case ConnectionState.waiting:
                return const BlankLoadingScreen();
              case ConnectionState.done:
                return _screenBuilders[_selectedIndex](snapshot.data as LocationForecast);
            }
          },
        ),
      );
    }
  }
}