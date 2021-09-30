import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mobile_weather/model/io_failure.dart';

class JSONProvider {
  JSONProvider._();

  static Future<dynamic> get(Uri url, {Map<String, String>? headers}) async {
    try {
      http.Response response = await http.get(url, headers: headers);
      return jsonDecode(response.body);
    } on HttpException {
      throw const IOFailure(message: 'HttpException', errorCode: ErrorCode.noConnection);
    } on SocketException {
      throw const IOFailure(message: "Can't establish internet connection", errorCode: ErrorCode.noConnection);
    } on FormatException {
      throw const IOFailure(message: 'Wrong JSON format', errorCode: ErrorCode.badFormat);
    }
  }
}