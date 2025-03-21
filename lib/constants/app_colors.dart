import 'package:flutter/material.dart';

class AppColors {
  static const Color kPrimary = Colors.black;
  static const Color kWhite = Color(0xFFFEFEFE);
  static LinearGradient customOnboardingGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      const Color(0xFF110C1D).withOpacity(0.0),
      const Color(0xFF110C1D),
    ],
  );
}
