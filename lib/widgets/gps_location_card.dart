import 'package:flutter/material.dart';
import 'package:mobile_weather/providers/open_weather_api_gps_location_fetcher.dart';

class GPSLocationCard extends StatelessWidget {
  const GPSLocationCard({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () async {
          Navigator.pop(context, await OpenWeatherAPIGPSLocationFetcher().fetch());
        },
        title: const Text('My Location'),
        leading: const Icon(Icons.my_location),
      )
    );
  }
}