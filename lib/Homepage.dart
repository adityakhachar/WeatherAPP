import 'package:flutter/material.dart';
import 'package:weather/Model/Geocoding_model.dart';
import 'package:weather/Model/Weather_model.dart';
import 'package:weather/service/Geocoding_api_client.dart';
import 'package:weather/views/additional_information.dart';
import 'package:weather/views/current_weather.dart';
import 'package:weather/service/weather_api_client.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  WeatherApiClient client = WeatherApiClient();
  GeocodingApiClientLatt geoClientlatt = GeocodingApiClientLatt();
  GeocodingApiClientLong geoClientlong = GeocodingApiClientLong();
  Weather? data;
  @override
  void initState() {
    super.initState();
    geoClientlatt.getCurrentCityDetail("Ahmedabad");
    geoClientlong.getCurrentCityDetail("Ahmedabad");
  }

  Future<void> getData() async {
    data = await client.getCurrentWeather(21.461200, 72.09000);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFf9f9f9),
        appBar: AppBar(
          backgroundColor: Color(0xFFf9f9f9),
          title: const Text(
            "Weather App",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
            color: Colors.black,
          ),
        ),
        body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CurrentWeather(Icons.wb_sunny_rounded, "${data!.temp}",
                      "${data!.cityName}"),
                  const SizedBox(height: 60.0),
                  const Text(
                    "Additional Information",
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Color(0xdd212121),
                        fontWeight: FontWeight.bold),
                  ),
                  Divider(),
                  SizedBox(height: 20.0),
                  additionalInformation("${data!.wind}", "${data!.humidity}",
                      "${data!.pressure}", "${data!.feels_like}")
                ],
              );
            } else {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }
            return Container();
          },
        ));
  }
}
