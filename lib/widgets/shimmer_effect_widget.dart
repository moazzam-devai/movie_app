// lib/widgets/shimmer_effect.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

Widget buildShimmerEffect() {
  return ListView.builder(
    itemCount: 5, // Show 5 shimmer placeholders
    padding: EdgeInsets.zero,
    scrollDirection: Axis.horizontal,
    itemBuilder: (BuildContext context, int index) {
      return Row(
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey[700]!,
            highlightColor: Colors.grey[500]!,
            child: Container(
              height: 180.h,
              width: 120.w,
              decoration: BoxDecoration(
                color: Colors.grey[700],
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ),
          SizedBox(width: 10.w),
        ],
      );
    },
  );
}

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 5, // Adjust number of shimmer placeholders
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 20.h),
            child: Shimmer.fromColors(
              baseColor: Colors.grey[700]!,
              highlightColor: Colors.grey[500]!,
              child: Row(
                children: [
                  Container(
                    width: 90.w,
                    height: 140.h,
                    color: Colors.white,
                  ),
                  SizedBox(width: 15.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 16.sp,
                          color: Colors.white,
                        ),
                        SizedBox(height: 5.h),
                        Container(
                          height: 12.sp,
                          color: Colors.white,
                          width: 200.w,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
