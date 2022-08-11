import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pawang_hujan/app/common/app_text.dart';
import 'package:pawang_hujan/app/common/colors.dart';

class DetailInformasi extends StatelessWidget {
  final String feelLike;
  final String wind;
  final String humidity;
  final String presure;

  const DetailInformasi({
    Key? key,
    required this.feelLike,
    required this.wind,
    required this.humidity,
    required this.presure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Container(
          height: 200,
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 5),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const AppText(
                        text: "Feel Like",
                      ),
                      const SizedBox(height: 5),
                      AppText(
                        text: "$feelLike\u2103",
                        size: 20,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const AppText(
                        text: "Humidity",
                      ),
                      const SizedBox(height: 5),
                      AppText(
                        text: "$humidity%",
                        size: 20,
                      ),
                    ],
                  ),
                ],
              ),
              VerticalDivider(
                color: AppColors.colorWhite.withOpacity(0.5),
                width: 2,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      const AppText(
                        text: "Wind",
                      ),
                      const SizedBox(height: 5),
                      AppText(
                        text: "$wind km/h",
                        size: 20,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const AppText(
                        text: "Presure",
                      ),
                      const SizedBox(height: 5),
                      AppText(
                        text: "${presure}hPa",
                        size: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
