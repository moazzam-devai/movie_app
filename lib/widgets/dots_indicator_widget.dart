import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import '../constants/app_colors.dart';

class CustomDotsIndicator extends StatelessWidget {
  final int position;
  final int dotsCount;
  const CustomDotsIndicator({
    required this.dotsCount,
    required this.position,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: dotsCount,
      position: position,
      decorator: DotsDecorator(
        color: AppColors.kWhite,
        size: const Size.square(8.0),
        activeSize: const Size(24, 8),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        activeColor: AppColors.kPrimary,
      ),
    );
  }
}
