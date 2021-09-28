import 'package:flutter/material.dart';
import 'package:mobile_weather/model/location.dart';

class LocationCard extends StatelessWidget {
  final Location location;
  final VoidCallback onTap;

  LocationCard({ Key? key , required this.location, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String stateString = location.stateName == null ? '' : '${location.stateName}, ';
    return Card(
      child: ListTile(
        onTap: onTap,
        title: Text('${location.cityNames?['en'] ?? location.defaultCityName}, $stateString${location.countryCode}'),
        subtitle: IntrinsicHeight(
          child: Row(
            children: <Widget>[
              Text('Lat: ${location.latitude}'),
              const VerticalDivider(
                width: 5.0,
                thickness: 1.0,
                color: Colors.red,
              ),
              Text('Lon: ${location.longitude}')
            ]
          ),
        ),
      ),
    );
  }
}