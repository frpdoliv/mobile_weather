import 'package:flutter/material.dart';
import 'package:mobile_weather/model/io_failure.dart';
import 'package:mobile_weather/model/location.dart';
import 'package:mobile_weather/providers/open_weather_api_gps_location_fetcher.dart';
import 'package:mobile_weather/providers/open_weather_api_user_input_location_fetcher.dart';
import 'package:mobile_weather/widgets/blank_loading_screen.dart';
import 'package:mobile_weather/widgets/location_card.dart';
import 'package:mobile_weather/widgets/location_search_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Search extends StatefulWidget {
  const Search({ Key? key }) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  Future<List<Location>>? _locationList;

  void onUserSumission(List<String> userInput) {
    setState(() {
      _locationList = OpenWeatherAPIUserInputLocationFetcher(userInput).fetch();
    });
  }

  void onGPSLocationTap(BuildContext context) async {
    try {
      Navigator.pop(context, await OpenWeatherAPIGPSLocationFetcher().fetch());
    } on IOFailure {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("No internet connection"),
          backgroundColor: Colors.red,
        ),
      );
    }
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
            Card(
              child: ListTile(
                onTap: () => onGPSLocationTap(context),
                title: const Text('My Location'),
                leading: const Icon(Icons.my_location),
              )
            ),
            Flexible(
              child: FutureBuilder<List<Location>>(
                future: _locationList,
                initialData: const [],
                builder: (BuildContext context, AsyncSnapshot<List<Location>> snapshot) {
                  if (snapshot.hasError) {
                    if (snapshot.error is IOFailure) {
                      WidgetsBinding.instance?.addPostFrameCallback((_) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("No internet connection"),
                            backgroundColor: Colors.red,
                          ),
                        );
                      });
                      return const Text('Try using the magnifiying glass to search for a location');
                    } else {
                      throw snapshot.error!;
                    }
                  } else {
                    switch(snapshot.connectionState) {
                      case ConnectionState.none:
                        return const Text('Try using the magnifiying glass to search for a location');
                      case ConnectionState.active:
                      case ConnectionState.waiting:
                        return const BlankLoadingScreen();
                      case ConnectionState.done:
                        List<Location> fetchedLocations = snapshot.data!;
                        if (fetchedLocations.isEmpty){
                          return const Text('No locations found');
                        }
                        else {
                          return ListView.builder(
                            itemCount: fetchedLocations.length,
                            itemBuilder: (context, index) {
                              return LocationCard(
                                location: fetchedLocations[index],
                                onTap: () {
                                  Navigator.pop(context, fetchedLocations[index]);
                                },
                              );
                            },
                          );
                        }
                    }
                  }
                },
              ),
            ),
          ]
        ),
      ),
    );
  }
}
