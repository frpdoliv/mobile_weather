import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:mobile_weather/providers/forecast_fetcher.dart';

class AssetForecastFetcher extends ForecastFetcher {
  final String _assetPath;

  AssetForecastFetcher._({required String assetPath}): 
    _assetPath = assetPath, 
    super();

  @override
  Future<Map<String, dynamic>> fetch() async {
    String jsonString = await rootBundle.loadString(_assetPath);
    return jsonDecode(jsonString);
  }

  static Future<AssetForecastFetcher> create({required String assetPath}) async {
    AssetForecastFetcher newInstance = AssetForecastFetcher._(assetPath: assetPath);
    await newInstance.update();
    return newInstance;
  }
}