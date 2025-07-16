import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/presentaion/widgets/screens/home.dart';
import 'package:weather_app/utils/Themes.dart';

import 'presentaion/presntaion _logic_ holder/dependecy_injector.dart';
import 'presentaion/presntaion _logic_ holder/provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dependencyInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, _) => MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => getIt<WeatherNotifier>(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppThemes.appLightTheme,
          home: const Home(),
        ),
      ),
    );
  }
}
