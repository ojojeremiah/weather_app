import 'package:weather_app/model/weather_forecast.dart';

abstract class WeatherRepository {
  Future<Weather> getWeatherData();
}
