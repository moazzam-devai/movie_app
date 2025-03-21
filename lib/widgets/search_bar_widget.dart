import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Function(String) onSubmitted; // Add this callback

  const SearchBarWidget({
    super.key,
    required this.controller,
    required this.hintText,
    required this.onSubmitted, // Accept the onSubmitted function
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        color: const Color.fromARGB(78, 0, 0, 0),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: Colors.white),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Row(
          children: [
            // SVG Icon
            SvgPicture.asset(
              'assets/icons/search.svg',
              width: 20.w,
              height: 20.h,
              color: Colors.white,
            ),
            SizedBox(width: 10.w),
            // Search TextField
            Expanded(
              child: TextField(
                controller: controller,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                ),
                cursorColor: Colors.white,
                onSubmitted: (query) {
                  onSubmitted(query); 
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 14.sp,
                    fontFamily: 'OpenSans-VariableFont_wdth,wght.ttf',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
