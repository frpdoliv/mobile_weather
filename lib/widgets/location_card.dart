import 'package:flutter/material.dart';
import 'package:mobile_weather/model/location.dart';

class LocationCard extends StatelessWidget {
  final Location location;
  final VoidCallback onTap;

  LocationCard({ Key? key , required this.location, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        title: Text(location.toString()),
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