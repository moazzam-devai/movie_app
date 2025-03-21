import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  static TextStyle whiteText(double fontSize) {
    return TextStyle(
      color: Colors.white,
      fontSize: fontSize.sp,
    );
  }

  static TextStyle mainheadings(double fontSize) {
    return TextStyle(
      color: Colors.white,
      fontSize: fontSize.sp,
      fontFamily: 'OpenSans-VariableFont_wdth,wght.ttf',
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle signuptext(double fontSize) {
    return TextStyle(
        color: Colors.green,
        fontWeight: FontWeight.bold,
        fontSize: fontSize.sp);
  }

  static TextStyle greenText(double fontSize) {
    return TextStyle(color: const Color(0xFFFF0000), fontSize: fontSize.sp);
  }

  static TextStyle redText(double fontSize) {
    return TextStyle(color: Colors.red, fontSize: fontSize.sp);
  }

  static TextStyle subheadings(double fontSize) {
    return TextStyle(color: Colors.grey, fontSize: fontSize.sp);
  }

  static TextStyle welcomehead(double fontSize) {
    return TextStyle(
        color: Colors.black,
        fontSize: fontSize.sp,
        fontWeight: FontWeight.bold);
  }
}

class MovieNameStyle {
  static TextStyle moviename(double fontSize) {
    return TextStyle(
      color: Colors.white,
      fontSize: fontSize.sp,
      fontFamily: 'OpenSans-VariableFont_wdth,wght.ttf',
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle moviedate(double fontSize) {
    return TextStyle(
      color: Colors.white,
      fontSize: fontSize.sp,
      fontFamily: 'OpenSans-VariableFont_wdth,wght.ttf',
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle movienumbername(double fontSize) {
    return TextStyle(
      color: Colors.white,
      fontSize: fontSize.sp,
      fontFamily: 'OpenSans-VariableFont_wdth,wght.ttf',
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle buttonTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle dialogContentStyle = TextStyle(
    color: Colors.white,
    fontSize: 15.sp,
  );

  static TextStyle labelStyle = TextStyle(
    color: Colors.white,
    fontSize: 16.sp,
  );
}
