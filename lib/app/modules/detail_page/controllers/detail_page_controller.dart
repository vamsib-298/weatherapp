import 'package:get/get.dart';

class DetailController extends GetxController {
  // Add any controller logic here if needed
  
}

class Weather {
  final String city;
  final String description;
  final double temperature;
  final String weatherIcon;

  Weather({
    required this.city,
    required this.description,
    required this.temperature,
    required this.weatherIcon,
  });
}