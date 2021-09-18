import 'package:flutter/material.dart';
import 'package:mobile_weather/providers/weather_data_fetcher.dart';
import 'package:mobile_weather/screens/current_forecast.dart';
import 'package:mobile_weather/screens/daily_forecast.dart';
import 'package:mobile_weather/screens/hourly_forecast.dart';
import 'package:mobile_weather/widgets/weather_list.dart';

class MainScreenFrame extends StatefulWidget {
  const MainScreenFrame({ Key? key }) : super(key: key);

  @override
  State<MainScreenFrame> createState() => _MainScreenFrameState();
}

class _MainScreenFrameState extends State<MainScreenFrame> {
  int _selectedIndex = 1;
  final List<Widget> _screens = <Widget>[
    HourlyForecast(),
    CurrentForecast(),
    DailyForecast(),
  ];

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: _screens[_selectedIndex]
    );
  }
}