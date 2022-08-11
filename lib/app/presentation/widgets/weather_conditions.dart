import 'package:flutter/material.dart';

class WeatherConditions extends StatelessWidget {
  final String imgUrl;

  const WeatherConditions({
    Key? key,
    required this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Image.asset(
        imgUrl,
        width: 250,
        height: 250,
      ),
    );
  }
}
