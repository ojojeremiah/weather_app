import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_app/data/service/dio.dart';
import 'package:weather_app/data/service/weather.dart';
import 'package:weather_app/domiain/use_case.dart';
import 'package:weather_app/presentaion/presntaion%20_logic_%20holder/provider/provider.dart';

final getIt = GetIt.instance;

Future<void> dependencyInjection() async {
  getIt.registerSingleton(Dio());
  getIt.registerSingleton(DioClient(getIt<Dio>()));
  getIt.registerSingleton<WeatherApiServiceImpl>(
      WeatherApiServiceImpl(dioClient: getIt<DioClient>()));
  getIt.registerSingleton(
      WeatherNotifier(weatherApiServiceImpl: getIt<WeatherApiServiceImpl>()));
  getIt.registerSingleton(WeatherUseCase(getIt<WeatherApiServiceImpl>()));
}
