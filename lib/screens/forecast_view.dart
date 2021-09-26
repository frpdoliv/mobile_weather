import 'package:flutter/material.dart';
import 'package:mobile_weather/screens/current_forecast.dart';
import 'package:mobile_weather/screens/daily_forecast.dart';
import 'package:mobile_weather/screens/hourly_forecast.dart';

class ForecastView extends StatefulWidget {
  const ForecastView({ Key? key }) : super(key: key);

  @override
  State<ForecastView> createState() => _ForecastViewState();
}

class _ForecastViewState extends State<ForecastView> {
  int _selectedIndex = 1;
  final List<Widget> _screens = <Widget>[
    HourlyForecast(),
    CurrentForecast(),
    DailyForecast(),
  ];
  
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
          onPressed: () => Navigator.pushNamed(context, '/search'),
          icon: Icon(Icons.search),
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