import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/utils/text_styles.dart';

class ReusableWidgets {
  static Widget reusableContainer({
    required double height,
    required double width,
    required Color color,
    required BorderRadius borderRadius,
    Widget? child,
  }) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius,
      ),
      child: child,
    );
  }

  static Widget movieNumberBadge(String text) {
    return reusableContainer(
      height: 30.h,
      width: 30.w,
      color: Colors.red,
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(10.r),
        topLeft: Radius.circular(10.r),
      ),
      child: Center(
        child: Text(text, style: MovieNameStyle.movienumbername(13)),
      ),
    );
  }
}
