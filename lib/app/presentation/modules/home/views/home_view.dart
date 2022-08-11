import 'package:flutter/material.dart';
import 'package:pawang_hujan/app/common/app_large_text.dart';
import 'package:pawang_hujan/app/common/colors.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../widgets/custome_temp.dart';
import '../../../widgets/detail_informasi.dart';
import '../../../widgets/weather_conditions.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget appBar() => Container(
          color: AppColors.colorBlack,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Text(
                      DateFormat().add_MMMMEEEEd().format(
                            DateTime.now(),
                          ),
                      style: GoogleFonts.poppins(
                        color: AppColors.colorWhite,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: AppColors.textWhite,
                        size: 20,
                      ),
                      const SizedBox(width: 5),
                      AppLargeText(
                        text: (controller.currentWeatherData.name != null)
                            ? controller.currentWeatherData.name
                                .toString()
                                .toUpperCase()
                            : "",
                        size: 16,
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        );

    Widget content() => Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Image.asset(
                'assets/bg.png',
                color: Colors.white10,
              ),
            ),
            ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                // searchBar(),
                WeatherConditions(
                  imgUrl: (controller.currentWeatherData.weather != null)
                      ? "assets/weather/${controller.currentWeatherData.weather![0].icon}.png"
                      : 'assets/thunder_2d.png',
                ),
                AppLargeText(
                    text: (controller.currentWeatherData.weather != null)
                        ? controller.currentWeatherData.weather![0].description
                            .toString()
                            .toUpperCase()
                        : ''),
                CustomTemp(
                  temp: (controller.currentWeatherData.main != null)
                      ? "${(controller.currentWeatherData.main!.temp)?.round().toString()}"
                      : "0".toString(),
                ),
                DetailInformasi(
                  feelLike: (controller.currentWeatherData.main != null)
                      ? "${(controller.currentWeatherData.main!.feelsLike)?.round().toString()}"
                      : "0",
                  humidity: (controller.currentWeatherData.main != null)
                      ? "${(controller.currentWeatherData.main!.humidity)?.round().toString()}"
                      : "0",
                  wind: (controller.currentWeatherData.wind != null)
                      ? "${(controller.currentWeatherData.wind!.speed)?.round().toString()}"
                      : "0",
                  presure: (controller.currentWeatherData.main != null)
                      ? "${(controller.currentWeatherData.main!.pressure)?.round().toString()}"
                      : "0",
                )
              ],
            ),
          ],
        );

    return Scaffold(
      backgroundColor: AppColors.colorBlack,
      resizeToAvoidBottomInset: false,
      body: Obx(
        () => controller.isLoading.isFalse
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SafeArea(
                child: Column(
                  children: [
                    Flexible(
                      flex: 1,
                      child: appBar(),
                    ),
                    Flexible(
                      flex: 9,
                      child: content(),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
