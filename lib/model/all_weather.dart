class AllWeatherData {
  double degreesInCelcius;
  int longitude;
  int latitude;
  String cities;
  String image;
  String weatherCondition;

  AllWeatherData(
      {required this.degreesInCelcius,
      required this.longitude,
      required this.latitude,
      required this.cities,
      required this.image,
      required this.weatherCondition});
}

List<AllWeatherData> weatherData = [
  AllWeatherData(
      degreesInCelcius: 19,
      longitude: 24,
      latitude: 18,
      cities: "Montreal,  Canada",
      image: 'assets/image/Moon cloud mid rain.png',
      weatherCondition: "Mid Rain"),
  AllWeatherData(
      degreesInCelcius: 20,
      longitude: 21,
      latitude: -19,
      cities: "Toronto,  Canada",
      image: 'assets/image/Moon cloud fast wind.png',
      weatherCondition: "Fast Wind"),
  AllWeatherData(
      degreesInCelcius: 13,
      longitude: 16,
      latitude: 8,
      cities: "Tokyo,  Japan",
      image: 'assets/image/Sun cloud angled rain.png',
      weatherCondition: "Showers")
];
