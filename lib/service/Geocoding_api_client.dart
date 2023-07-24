import 'package:weather/Model/Geocoding_model.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class GeocodingApiClientLatt {
  Future<double?> getCurrentCityDetail(String? city) async {
    var endPoint = Uri.parse(
        "http://api.openweathermap.org/geo/1.0/direct?q=$city&limit=1&appid=910c2d3d7bc15c0fae111387d4eb1754");
    var response = await http.get(endPoint);
    var body = jsonDecode(response.body)[0];
    print("${Geocoding.fromJson(body).lattitide}");
    return Geocoding.fromJson(body).lattitide;
  }
}

class GeocodingApiClientLong {
  Future<double?> getCurrentCityDetail(String? city) async {
    var endPoint = Uri.parse(
        "http://api.openweathermap.org/geo/1.0/direct?q=$city&limit=1&appid=910c2d3d7bc15c0fae111387d4eb1754");
    var response = await http.get(endPoint);
    var body = jsonDecode(response.body)[0];
    print("${Geocoding.fromJson(body).longtitude}");
    return Geocoding.fromJson(body).longtitude;
  }
}
