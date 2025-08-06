import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
  final WeatherUseCase weatherUseCase;

  WeatherDataState _dataState = WeatherDataState.idle;
  String _errorMessage = '';
  String _successMessage = '';
  Weather? _weather;

  WeatherDataState get weatherState => _dataState;
  String get errorMessage => _errorMessage;
  String get successMessage => _successMessage;
  Weather? get weather => _weather;

  WeatherNotifier(this.weatherUseCase);

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

    final result = await weatherUseCase.call(); // ✅ use the injected dependency
    _weather = result.$1;
    final errorMessage = result.$2;

    if (_weather == null) {
      _setState(newState: WeatherDataState.error);
      Fluttertoast.showToast(msg: errorMessage);
    } else {
      _setState(newState: WeatherDataState.success);
    }
  }

  Future<Weather> getWeather() async {
    if (_weather != null) return _weather!;
    try {
      final result =
          await weatherUseCase.call(); // ✅ use the injected dependency
      _weather = result.$1;
      return _weather!;
    } catch (_) {
      throw Exception('Failed to fetch weather data');
    }
  }
}
