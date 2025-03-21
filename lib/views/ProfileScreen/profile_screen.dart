import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/widgets/divider_section_widget.dart';
import 'package:movie/widgets/profile_header_widget.dart';
import 'package:movie/widgets/profile_widget.dart';
import 'package:movie/widgets/update_profile_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/images/hbg.png', fit: BoxFit.cover),
          ),
          Positioned(
            top: 50.h,
            left: 0.w,
            right: 0.w,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),
                    const ProfileHeader(),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: const ProfileSection(
                        title: 'About',
                        content:
                            'Lorem Ipsum is simply dummy text of the printing and typesetting industry...',
                      ),
                    ),
                    const DividerSection(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: const ProfileSection(
                        title: 'Address',
                        content: 'Lahore, Pakistan',
                      ),
                    ),
                    const DividerSection(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: const ProfileSection(
                        title: 'Postal Code',
                        content: '4500',
                      ),
                    ),
                    const DividerSection(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: const ProfileSection(
                        title: 'Subscriptions',
                        content: 'Nope',
                      ),
                    ),
                    const DividerSection(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: const ProfileSection(
                        title: 'Account Created Date',
                        content: '23-4-2024',
                      ),
                    ),
                    SizedBox(height: 20.h),
                    const UpdateProfileButton(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
