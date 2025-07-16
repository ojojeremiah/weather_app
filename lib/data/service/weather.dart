import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weather_app/domiain/model/weather_forecast.dart';
import 'package:weather_app/data/service/dio.dart';
import 'package:weather_app/data/service/dio_exception.dart';
import 'package:weather_app/data/service/endpoints.dart';
import 'package:weather_app/utils/app_colors.dart';

class WeatherApiServiceImpl {
  final DioClient dioClient;

  WeatherApiServiceImpl({required this.dioClient});

  Future<Weather> getWeatherData() async {
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
        return Weather.fromJson(data);
      } else {
        throw Exception('Failed to load weather data');
      }
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      Fluttertoast.showToast(
        msg: "Network Connection failed",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColors.colorGrey,
        textColor: AppColors.primaryColor,
        fontSize: 14,
      );
      throw errorMessage;
    }
  }
}
