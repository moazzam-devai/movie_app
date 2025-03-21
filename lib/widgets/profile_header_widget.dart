import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: CircleAvatar(
            backgroundColor: Colors.black,
            radius: 80.r,
            backgroundImage: const AssetImage('assets/images/lo.png'),
          ),
        ),
        SizedBox(height: 10.h),
        Align(
          alignment: Alignment.center,
          child: Text(
            'Muhammad Ali Tahir',
            style: TextStyle(
              fontSize: 24.sp,
              fontFamily: 'OpenSans-VariableFont_wdth,wght.ttf',
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            '@muhammadali_tahir',
            style: TextStyle(
              fontSize: 16.sp,
              fontFamily: 'OpenSans-VariableFont_wdth,wght.ttf',
              color: Colors.white70,
            ),
          ),
        ),
      ],
    );
  }
}
