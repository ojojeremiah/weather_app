import 'package:flutter/material.dart';
import 'package:weather_app/data/service/weather.dart';
import 'package:weather_app/domiain/model/weather_forecast.dart';
import 'package:weather_app/domiain/use_case.dart';

enum WeatherDataState {
  idle,
  adding,
  fetching,
  loading,
  success,
  error,
}

class WeatherNotifier extends ChangeNotifier {
  final WeatherApiServiceImpl weatherApiServiceImpl;

  WeatherDataState _dataState = WeatherDataState.idle;
  String _errorMessage = '';
  String _successMessage = '';
  Weather? _weather;

  WeatherDataState get weatherState => _dataState;
  String get errorMessage => _errorMessage;
  String get successMessage => _successMessage;
  Weather? get weather => _weather;

  WeatherNotifier({required this.weatherApiServiceImpl});

  void _setState({
    required WeatherDataState newState,
    String errorMessage = '',
    String successMessage = '',
  }) {
    _dataState = newState;
    _errorMessage = errorMessage;
    _successMessage = successMessage;
    notifyListeners();
  }

  Future<void> fetchWeatherData() async {
    _setState(newState: WeatherDataState.loading);

    try {
      final result = await WeatherUseCase(weatherApiServiceImpl).call();
      _weather = result;
      _setState(newState: WeatherDataState.success);
    } catch (e) {
      _setState(newState: WeatherDataState.error, errorMessage: e.toString());
    }

    Future.delayed(const Duration(seconds: 5), () {
      _setState(newState: WeatherDataState.idle);
    });
  }

  Future<Weather> getWeather() async {
    if (_weather != null) return _weather!;
    try {
      final result = await WeatherUseCase(weatherApiServiceImpl).call();
      _weather = result;
      return _weather!;
    } catch (_) {
      throw Exception('Failed to fetch weather data');
    }
  }
}
