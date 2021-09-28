import 'package:flutter/material.dart';
import 'package:mobile_weather/model/location.dart';
import 'package:mobile_weather/screens/current_forecast.dart';
import 'package:mobile_weather/screens/daily_forecast.dart';
import 'package:mobile_weather/screens/hourly_forecast.dart';
import 'package:mobile_weather/screens/search.dart';

class ForecastView extends StatefulWidget {
  const ForecastView({ Key? key }) : super(key: key);

  @override
  State<ForecastView> createState() => _ForecastViewState();
}

class _ForecastViewState extends State<ForecastView> {
  int _selectedIndex = 1;
  late Location location;
  final List<Widget> _screens = <Widget>[
    HourlyForecast(),
    CurrentForecast(),
    DailyForecast(),
  ];
  
  void userChangeLocation() async {
    Location? searchResult = await Navigator.pushNamed<Location>(context, '/search'); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Leiria, Portugal'),
        actions: <Widget>[
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.settings),
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
      body: _screens[_selectedIndex],
    );
  }
}