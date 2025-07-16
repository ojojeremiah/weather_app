import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/provider.dart';
import 'package:weather_app/screens/home.dart';
import 'package:weather_app/utils/Themes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ChangeNotifierProvider(
    create: (context) => WeatherNotifier(),
    child: const MyApp(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, _) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => WeatherNotifier()..fetchWeatherData(),
            )
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppThemes.appLightTheme,
            home: const Home(),
          ),
        );
      },
    );
  }
}
