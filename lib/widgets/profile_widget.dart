import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileSection extends StatelessWidget {
  final String title;
  final String content;

  const ProfileSection({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.white,
              fontFamily: 'OpenSans-VariableFont_wdth,wght.ttf',
            ),
          ),
          Text(
            content,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.white70,
              fontFamily: 'OpenSans-VariableFont_wdth,wght.ttf',
            ),
          ),
        ],
      ),
    );
  }
}
