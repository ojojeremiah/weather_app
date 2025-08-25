import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/data/service/weather.dart';
import 'package:weather_app/domiain/model/weather_forecast.dart';
import 'package:weather_app/domiain/use_case.dart';

// Mock the WeatherApiServiceImpl
class MockWeatherApiServiceImpl extends Mock implements WeatherApiServiceImpl {}

void main() {
  late MockWeatherApiServiceImpl mockWeatherApi;
  late WeatherUseCase weatherUseCase;

  setUp(() {
    mockWeatherApi = MockWeatherApiServiceImpl();
    weatherUseCase = WeatherUseCase(mockWeatherApi);
  });

  group('WeatherUseCase', () {
    test('returns Weather when WeatherApiServiceImpl returns data', () async {
      final mockWeather = Weather(
        location: Location(name: 'Paris'),
        current: Current(tempC: 20.5, condition: Condition(text: 'Sunny')),
        forecast: Forecast(
          forecastday: [
            Forecastday(
              date: '2025-08-03',
              day: Day(maxtempC: 26.8, mintempC: 13.3),
              hour: [],
            ),
          ],
        ),
      );

      when(() => mockWeatherApi.getWeatherData())
          .thenAnswer((_) async => (mockWeather, ''));

      final result = await weatherUseCase();

      expect(result.$1, isA<Weather>());
      expect(result.$1?.location.name, 'Paris');
      expect(result.$2, '');
    });

    test('returns error string when WeatherApiServiceImpl fails', () async {
      when(() => mockWeatherApi.getWeatherData())
          .thenAnswer((_) async => (null, 'Some error occurred'));

      final result = await weatherUseCase();

      expect(result.$1, isNull);
      expect(result.$2, 'Some error occurred');
    });
  });
}
