import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp/app/modules/detail_page/controllers/detail_page_controller.dart';
import 'package:weatherapp/data/api/app_url.dart';

class HomeController extends GetxController {
  final TextEditingController cityController = TextEditingController();
  RxList<Weather> citiesWeather = <Weather>[].obs;
  RxList<Weather> filteredCities = <Weather>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Fetch weather for random cities only if the list is empty
    if (citiesWeather.isEmpty) {
      getRandomCitiesWeather();
    }
  }

  Future<void> getRandomCitiesWeather() async {
    final List<String> randomCities = [
      'Mumbai',
      'Delhi',
      'Bangalore',
      'Hyderabad',
      'Chennai',
      'Kolkata',
      'Ahmedabad',
      'Pune',
      'Jaipur',
      'Lucknow',
    ];

    for (var cityName in randomCities) {
      await getCurrentWeatherByCity(cityName);
    }
  }

  Future<void> getCurrentWeatherByCity(String cityName) async {
    try {
      WeatherApiUrl.getWeatherUrl(cityName);

      final response =
          await http.get(Uri.parse(WeatherApiUrl.getWeatherUrl(cityName)));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final weather = Weather(
          city: data['name'],
          description: data['weather'][0]['description'],
          temperature: (data['main']['temp'] - 273.15),
          weatherIcon: data['weather'][0]['icon'],
        );

        if (!citiesWeather.any((w) => w.city == weather.city)) {
          citiesWeather.add(weather);
          filteredCities.assignAll(citiesWeather);
        }
      } else {
        throw Exception('Failed to load weather data for $cityName');
      }
    } catch (e) {
      // Handle errors, e.g., no internet connection
      print('Error fetching weather data: $e');
    }
  }

  void filterCities(String keyword) {
    filteredCities.assignAll(
      citiesWeather
          .where(
              (city) => city.city.toLowerCase().contains(keyword.toLowerCase()))
          .toList(),
    );
  }
}
