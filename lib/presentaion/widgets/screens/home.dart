import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/presentaion/presntaion%20_logic_%20holder/provider/provider.dart';
import 'package:weather_app/presentaion/widgets/screens/weathers.dart';
import 'package:weather_app/utils/app_colors.dart';

import '../../presntaion _logic_ holder/dependecy_injector.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    getIt<WeatherNotifier>().fetchWeatherData();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // Background image
          SizedBox(
            height: screenHeight,
            width: screenWidth,
            child: Image.asset(
              "assets/image/Image.png",
              fit: BoxFit.cover,
            ),
          ),
          // Weather data display
          Consumer<WeatherNotifier>(
            builder: (context, weatherNotifier, child) {
              final weather = weatherNotifier.weather;
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 70.sp),
                        child: Text(
                          weather?.location.region ?? 'Unknown Region',
                          style: TextStyle(
                            fontSize: 34.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primaryColor,
                            letterSpacing: 0.37,
                          ),
                        ),
                      ),
                      Text(
                        '${weather?.current.tempC.round().toString()}°',
                        style: const TextStyle(
                          fontSize: 96,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w200,
                          letterSpacing: 0.37,
                        ),
                      ),
                      Text(
                        weather?.current.condition?.text ?? 'Unknown Condition',
                        style: const TextStyle(
                          color: AppColors.colorGrey,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text(
                              'H: ${weather?.forecast?.forecastday?[0].day?.maxtempC != null ? NumberFormat('#').format(weather?.forecast?.forecastday?[0].day?.maxtempC) : '--'}°',
                              style: const TextStyle(
                                  color: AppColors.primaryColor),
                            ),
                          ),
                          Text(
                            'L: ${weather?.forecast?.forecastday?[0].day?.mintempC != null ? NumberFormat('#').format(weather?.forecast?.forecastday?[0].day?.mintempC) : '--'}°',
                            style:
                                const TextStyle(color: AppColors.primaryColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          // House image
          Positioned(
            top: screenHeight * 0.35,
            left: 10,
            child: Image.asset("assets/image/House.png"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 510),
            child: Container(
              height: 325,
              width: screenWidth,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(44)),
                gradient: AppColors.appGradient,
                boxShadow: [AppColors.appBoxShadowColor],
              ),
              child: Column(
                children: [
                  Center(
                    child: Icon(
                      Icons.horizontal_rule_rounded,
                      size: 60,
                      color: Color(0x4D000000),
                    ),
                  ),
                  // TabBar
                  TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    dividerColor: Colors.transparent,
                    unselectedLabelColor: AppColors.colorGrey,
                    labelColor: AppColors.colorGrey,
                    indicatorColor: const Color(0xB23B267B),
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                    tabs: const [
                      Tab(text: "Hourly Forecast"),
                      Tab(text: "Weekly Forecast"),
                    ],
                  ),
                  // Divider
                  Container(
                    height: 1,
                    color: AppColors.colorGrey,
                    width: double.maxFinite,
                  ),
                  // TabBarView
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        // Hourly Forecast
                        Consumer<WeatherNotifier>(
                          builder: (context, weatherNotifier, child) {
                            if (weatherNotifier.weather == null ||
                                weatherNotifier.weather!.forecast == null ||
                                weatherNotifier
                                        .weather!.forecast!.forecastday ==
                                    null ||
                                weatherNotifier
                                    .weather!.forecast!.forecastday!.isEmpty) {
                              return const Center(
                                  child: Text('No hourly data available'));
                            }
                            return SizedBox(
                              height: 130,
                              width: double.infinity,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: weatherNotifier.weather!.forecast!
                                        .forecastday![0].hour?.length ??
                                    0,
                                itemBuilder: (context, index) {
                                  final hourData = weatherNotifier.weather!
                                      .forecast!.forecastday![0].hour![index];
                                  final time = hourData.time != null
                                      ? hourData.time!.split(' ')[1]
                                      : '--:--';
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, left: 20, bottom: 100),
                                    child: Container(
                                      width: 50,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColors.transparentColor
                                                .withOpacity(0.8)),
                                        gradient: AppColors.appGradient,
                                        boxShadow: const [
                                          AppColors.appBoxShadowColor
                                        ],
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20)),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            time,
                                            style: const TextStyle(
                                                color: AppColors.primaryColor),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            hourData.tempC != null
                                                ? '${NumberFormat('#').format(hourData.tempC)}°'
                                                : '--°',
                                            style: const TextStyle(
                                                color: AppColors.primaryColor),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                        Text("Weather Forecast")
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: SizedBox(
              width: screenWidth,
              child: Image.asset(
                "assets/image/Rectangle 364.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 1,
            left: (screenWidth - 247) / 2,
            child: Image.asset(
              "assets/image/Subtract.png",
              width: 250,
            ),
          ),
          Positioned(
            bottom: 18,
            left: (screenWidth - 69) / 2,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x800D1431),
                    offset: Offset(10, 10),
                    blurRadius: 10,
                  ),
                  BoxShadow(
                    color: Color(0x80FFFFFF),
                    offset: Offset(-10, -10),
                    blurRadius: 100,
                  ),
                ],
                borderRadius: BorderRadius.circular(100),
              ),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                elevation: 0,
                color: Colors.white,
                child: SizedBox(
                  width: 60,
                  height: 60,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                        colors: [Color(0xFF5936B4), Color(0xFF362A84)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ).createShader(bounds),
                      child: IconButton(
                        icon: const Icon(Icons.add, size: 40),
                        onPressed: () {},
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 15,
            left: 35,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Weathers()),
                );
              },
              child: Image.asset(
                "assets/image/Map.png",
                width: 60,
              ),
            ),
          ),
          Positioned(
            bottom: 15,
            right: 35,
            child: Image.asset(
              "assets/image/List.png",
              width: 60,
            ),
          ),
        ],
      ),
    );
  }
}
