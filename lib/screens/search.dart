import 'package:flutter/material.dart';
import 'package:mobile_weather/model/location.dart';
import 'package:mobile_weather/providers/open_weather_api_location_fetcher.dart';
import 'package:mobile_weather/widgets/location_search_bar.dart';

class Search extends StatefulWidget {
  const Search({ Key? key }) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<Location>? _locationList;

  void onUserSumission(List<String> userInput) async {
    OpenWeatherAPILocationFetcher().fetchLocations(userInput);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
              child: LocationAppBar(onSubmitted: onUserSumission),
            ),
          ]
        ),
      ),
      
    );
  }
}