import 'package:flutter/material.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/model/all_weather.dart';
import '../utils/app_colors.dart';
import 'package:intl/intl.dart';

class Weathers extends StatefulWidget {
  const Weathers({super.key});

  @override
  State<Weathers> createState() => _WeathersState();
}

class _WeathersState extends State<Weathers> {
  final TextEditingController _search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      decoration: const BoxDecoration(
          gradient: AppColors.appGradient,
          boxShadow: [AppColors.appBoxShadowColor]),
      child: Padding(
        padding: const EdgeInsets.only(top: 47, left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_sharp,
                          color: AppColors.colorGrey.withOpacity(0.6),
                        )),
                    const Text("Weather",
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 28,
                            fontWeight: FontWeight.w400))
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      "assets/svg/Right Accessory.svg",
                      color: AppColors.primaryColor,
                      width: 200,
                    ))
              ],
            ),
            Center(
              child: InnerShadow(
                shadows: [
                  Shadow(
                    color: Color(0x40000000), // 25% black
                    blurRadius: 4,
                    offset: Offset(0, 4),
                  ),
                ],
                child: Container(
                  padding:
                      EdgeInsets.only(left: 8, top: 7, bottom: 7, right: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFF1C1B33),
                  ),
                  width: 356,
                  height: 36,
                  child: TextFormField(
                    controller: _search,
                    onSaved: (s) {
                      _search.text = s!;
                    },
                    style: const TextStyle(
                      height: 1,
                      letterSpacing: 2,
                      color: AppColors.primaryColor,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 4),
                      hintText: 'Search for a city or airport',
                      filled: true,
                      fillColor: Colors.transparent,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey.withOpacity(0.6),
                      ),
                      hintStyle: TextStyle(
                        color: Colors.grey.withOpacity(0.6),
                        fontSize: 17,
                        letterSpacing: -0.41,
                        fontWeight: FontWeight.w400,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: weatherData.length,
                  itemBuilder: (context, index) {
                    final weathers = weatherData[index];
                    return Center(
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 6, left: 8, bottom: 16, right: 8),
                            child:
                                SvgPicture.asset("assets/svg/Rectangle 1.svg"),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 35, left: 20),
                            child: Text(
                              "${NumberFormat('#.##').format(weathers.degreesInCelcius)}°",
                              style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 64,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.37),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 124, left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "H:${NumberFormat('#.##').format(weathers.longitude)}°    L:${NumberFormat('#.##').format(weathers.latitude)}° ",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.colorGrey,
                                      letterSpacing: -0.08),
                                ),
                                Text(
                                  weathers.cities,
                                  style: TextStyle(
                                      color: AppColors.primaryColor,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: -0.41),
                                )
                              ],
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                left: 178,
                              ),
                              child: Image.asset(
                                weathers.image,
                              )),
                          Padding(
                            padding: const EdgeInsets.only(top: 147, left: 265),
                            child: Text(
                              weathers.weatherCondition,
                              style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: -0.08),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    ));
  }
}
