import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DividerSection extends StatelessWidget {
  const DividerSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2.h,
      width: MediaQuery.of(context).size.width,
      color: Colors.red,
    );
  }
}
