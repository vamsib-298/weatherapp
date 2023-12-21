import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp/app/modules/detail_page/controllers/detail_page_controller.dart';

class CityWeatherView extends GetView<DetailController> {
  final Weather weather;

  const CityWeatherView({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(weather.city),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Leading icon and city name side by side
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.location_city, size: 50),
                const SizedBox(width: 10),
                Text(
                  weather.city,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Current weather data
            Text(
              weather.description,
              style: const TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 20.0),
            Text(
              '${weather.temperature.toStringAsFixed(1)}°C',
              style: const TextStyle(fontSize: 36.0),
            ),
          ],
        ),
      ),
    );
  }
}
