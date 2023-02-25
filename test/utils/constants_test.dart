import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pawang_hujan/utils/constants.dart';

void main() {
  group('Text styles', () {
    test('kHeading5 returns correct value', () {
      expect(
          kHeading5,
          GoogleFonts.poppins(
            fontSize: 23,
            fontWeight: FontWeight.w400,
          ));
    });

    test('kHeading6 returns correct value', () {
      expect(
          kHeading6,
          GoogleFonts.poppins(
            fontSize: 19,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.15,
          ));
    });

    test('kSubtitle returns correct value', () {
      expect(
          kSubtitle,
          GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.15,
          ));
    });

    test('kBodyText returns correct value', () {
      expect(
          kBodyText,
          GoogleFonts.poppins(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.25,
          ));
    });
  });
}
