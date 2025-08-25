import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/domiain/model/weather_forecast.dart';
import 'package:weather_app/domiain/use_case.dart';
import 'package:weather_app/presentaion/presntaion%20_logic_%20holder/provider/provider.dart';

class MockWeatherUseCase extends Mock implements WeatherUseCase {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockWeatherUseCase mockWeatherUseCase;
  late WeatherNotifier weatherNotifier;

  final sampleWeather = Weather(
    location: Location(
      name: 'Paris',
      region: 'Ile-de-France',
      country: 'France',
      lat: 48.867,
      lon: 2.333,
      tzId: 'Europe/Paris',
      localtime: '2025-08-03 20:58',
    ),
    current: Current(
      tempC: 22.0,
      condition: Condition(text: 'Sunny', icon: '', code: 1000),
    ),
    forecast: null,
  );

  setUp(() {
    // Fluttertoast.showToast = (_) async {};
    mockWeatherUseCase = MockWeatherUseCase();
    weatherNotifier = WeatherNotifier(mockWeatherUseCase);
  });

  test('Initial state should be idle and weather null', () {
    expect(weatherNotifier.weatherState, WeatherDataState.idle);
    expect(weatherNotifier.weather, isNull);
  });

  test('fetchWeatherData sets weather and changes state to success', () async {
    when(() => mockWeatherUseCase.call())
        .thenAnswer((_) async => (sampleWeather, ''));

    await weatherNotifier.fetchWeatherData();

    expect(weatherNotifier.weatherState, WeatherDataState.success);
    expect(weatherNotifier.weather?.location.name, 'Paris');
  });

  test('fetchWeatherData sets error state on failure', () async {
    when(() => mockWeatherUseCase.call())
        .thenAnswer((_) async => (null, 'Network error'));

    await weatherNotifier.fetchWeatherData();

    expect(weatherNotifier.weatherState, WeatherDataState.error);
    expect(weatherNotifier.weather, isNull);
  });

  test('getWeather returns cached weather if already fetched', () async {
    when(() => mockWeatherUseCase.call())
        .thenAnswer((_) async => (sampleWeather, ''));

    final first = await weatherNotifier.getWeather();

    expect(first.location.name, 'Paris');
    verify(() => mockWeatherUseCase.call()).called(1); // only once
  });

  test('getWeather fetches if weather is null', () async {
    when(() => mockWeatherUseCase.call())
        .thenAnswer((_) async => (sampleWeather, ''));

    final result = await weatherNotifier.getWeather();

    expect(result.location.name, 'Paris');
    verify(() => mockWeatherUseCase.call()).called(1);
  });

  test('getWeather throws on fetch failure', () async {
    when(() => mockWeatherUseCase.call()).thenThrow(Exception('Server error'));

    expect(() => weatherNotifier.getWeather(), throwsException);
  });
}
