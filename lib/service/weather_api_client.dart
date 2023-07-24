import 'dart:convert';

import 'package:http/http.dart' as http;
import '../Model/Weather_model.dart';

class WeatherApiClient {
  Future<Weather>? getCurrentWeather(
      double? latitide, double? longtitude) async {
    var endpoint = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitide&lon=$longtitude&appid=910c2d3d7bc15c0fae111387d4eb1754&units=metric');

    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);
    print(Weather.fromJson(body).cityName);
    return Weather.fromJson(body);
  }
}
