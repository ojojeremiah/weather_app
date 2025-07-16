import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_forecast.dart';
import 'package:weather_app/repository/WeatherRepository.dart';
import 'package:weather_app/service/weather.dart';

/// Represents various states of the weather data fetching/updating lifecycle
enum WeatherDataState {
  idle,
  adding,
  fetching,
  loading,
  success,
  error,
}

class WeatherNotifier extends ChangeNotifier {
  final WeatherRepository weatherRepository;

  WeatherDataState _dataState = WeatherDataState.idle;
  String _errorMessage = '';
  String _successMessage = '';
  Weather? weathers;

  WeatherDataState get weatherState => _dataState;
  String get errorMessage => _errorMessage;
  String get successMessage => _successMessage;
  Weather? get weather => weathers;

  WeatherNotifier() : weatherRepository = WeatherApiServiceImpl();

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
      final result = await weatherRepository.getWeatherData();
      weathers = result;
      _setState(newState: WeatherDataState.success);
    } catch (e) {
      _setState(newState: WeatherDataState.error, errorMessage: e.toString());
    }

    Future.delayed(const Duration(seconds: 5), () {
      _setState(newState: WeatherDataState.idle);
    });
  }

  Future<Weather> getWeather() async {
    if (weather != null) return weather!;
    await fetchWeatherData();
    return weather ?? (throw Exception('Failed to fetch weather data'));
  }
}
