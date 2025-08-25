import 'package:weather_app/data/service/weather.dart';
import 'package:weather_app/domiain/model/weather_forecast.dart';

class WeatherUseCase {
  final WeatherApiServiceImpl weatherApiServiceImpl;

  WeatherUseCase(this.weatherApiServiceImpl);

  Future<(Weather?, String)> call() async {
    return await weatherApiServiceImpl.getWeatherData();
  }
}
