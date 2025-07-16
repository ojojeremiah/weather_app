import 'package:weather_app/data/service/weather.dart';
import 'package:weather_app/domiain/model/weather_forecast.dart';

class WeatherUseCase {
  final WeatherApiServiceImpl _weatherApiServiceImpl;

  WeatherUseCase(this._weatherApiServiceImpl);

  Future<Weather> call() async {
    return await _weatherApiServiceImpl.getWeatherData();
  }
}
