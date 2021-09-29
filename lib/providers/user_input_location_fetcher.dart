import 'package:flutter/cupertino.dart';
import 'package:mobile_weather/model/location.dart';

abstract class UserInputLocationFetcher {
  Future<List<Location>> fetch();
}