import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// const Color kPrimary = Color(0xff)

final TextStyle kHeading2 = GoogleFonts.poppins(
  fontSize: 75,
  fontWeight: FontWeight.w600,
);
final TextStyle kHeading5 = GoogleFonts.poppins(
  fontSize: 23,
  fontWeight: FontWeight.w400,
);
final TextStyle kHeading6 = GoogleFonts.poppins(
  fontSize: 19,
  fontWeight: FontWeight.w500,
  letterSpacing: 0.15,
);
final TextStyle kSubtitle = GoogleFonts.poppins(
  fontSize: 15,
  fontWeight: FontWeight.w400,
  letterSpacing: 0.15,
);
final TextStyle kBodyText = GoogleFonts.poppins(
  fontSize: 13,
  fontWeight: FontWeight.w400,
  letterSpacing: 0.25,
);

class AppSized {
  static const double paddingX = 20;
  static const double paddingY = 20;
  static const double paddingR = 15;
  static const double paddingL = 15;
  static const double paddingT = 15;
  static const double paddingB = 15;

  static const double marginX = 30;
  static const double marginY = 20;
  static const double marginR = 20;
  static const double marginL = 20;
  static const double marginT = 20;
  static const double marginB = 20;

  static const double radius = 20;
}

class AppColors {
  static const kPrimeColor = Color(0XFF29B2DD);
  static const kPictonBlue = Color(0XFF2DC8EA);
  static const kDarkCerulean = Color(0XFF001026);
  static const kWhite = Color(0XFFFFFFFF);
  static const kTransparent = Colors.transparent;
}

const dummyWeatherList = {
  "item_one": [29, '02d', "15.00"],
  "item_two": [26, '03d', "16.00"],
  "item_three": [23, '09d', "17.00"],
  "item_four": [24, '02d', "18.00"],
  "item_five": [29, '02d', "19.00"],
  "item_six": [32, '09d', "20.00"],
};
