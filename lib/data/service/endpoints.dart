class Endpoints {
  Endpoints._();
  static const int receiveTimeout = 15000;
  static const int connectionTimeout = 15000;
  static const String baseUrl = "https://api.weatherapi.com/v1";
  static const String forecast = "/forecast.json";
  static const String apiKey = "f33d58c4adc842a4b4f113115250907";
  static const List<double> q = [48.8567, 2.3508];
}
