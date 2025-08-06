import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/domiain/model/weather_forecast.dart';
import 'package:weather_app/data/service/dio.dart';
import 'package:weather_app/data/service/endpoints.dart';

class WeatherApiServiceImpl {
  final DioClient dioClient;

  WeatherApiServiceImpl({required this.dioClient});

  Future<(Weather?, String)> getWeatherData() async {
    try {
      final response = await dioClient.get(
        Endpoints.baseUrl + Endpoints.forecast,
        queryParameters: {
          'key': Endpoints.apiKey,
          'q': Endpoints.q,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data;
        log("$data");
        return (Weather.fromJson(data), '');
      } else {
        return (null, 'Network connection failed');
      }
    } on DioException catch (e) {
      return (null, 'Network connection failed');
    } catch (e) {
      log("Network connection failed");
      return (null, 'Network connection failed');
    }
  }
}
