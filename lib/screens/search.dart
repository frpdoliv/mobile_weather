import 'package:flutter/material.dart';
import 'package:mobile_weather/model/location.dart';
import 'package:mobile_weather/providers/open_weather_api_location_fetcher.dart';
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
    //TODO Review this code
    /*
      _locationList = Future<List<Location>>.delayed(Duration(seconds: 2), () => OpenWeatherAPILocationFetcher().fetchLocations(userInput));
      setState(() => print('NewData'));
    */
    setState(() {
      _locationList = OpenWeatherAPILocationFetcher().fetchLocations(userInput);
    });
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
            Flexible(
              child: FutureBuilder<List<Location>>(
                future: _locationList,
                initialData: const [],
                builder: (BuildContext context, AsyncSnapshot<List<Location>> snapshot) {
                  switch(snapshot.connectionState) {
                    case ConnectionState.none:
                      return Text('Try using the magnifiying glass to search for a location');
                    case ConnectionState.active:
                    case ConnectionState.waiting:
                      return SpinKitCircle(color: Colors.red);
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
                },
              ),
            ),
          ]
        ),
      ),
    );
  }
}
