import 'package:flutter/material.dart';

import '../../common/app_large_text.dart';
import '../../common/colors.dart';

class CustomTemp extends StatelessWidget {
  final String temp;

  const CustomTemp({
    Key? key,
    required this.temp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: AppLargeText(
            text: temp,
            size: 90,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 5),
          child: Container(
            height: 20,
            width: 20,
            decoration: const BoxDecoration(
              color: Colors.amber,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Stack(
                children: [
                  Container(
                    height: 16,
                    width: 16,
                    decoration: const BoxDecoration(
                      color: AppColors.colorBlack,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
