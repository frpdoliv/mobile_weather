import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        children: [
          Flexible(
            child: Center(child: Text('Ceu mt nublado'),),
          ),
        ],
      )
    );
  }
}