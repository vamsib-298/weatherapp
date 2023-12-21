
class WeatherApiUrl {
  static const String apiKey = '63618d6a98582d2f7d459f5e7d26842f';
  static String getWeatherUrl(String cityName) {
    return 'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey';
  }
}
