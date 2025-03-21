import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/auth/signin.dart';
import 'package:movie/utils/text_styles.dart';
import 'package:movie/widgets/custom_textfield_widget.dart';
import 'package:movie/widgets/neon_card_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.clear();
    passwordController.clear();
    phoneController.clear();
    emailController.clear();
    usernameController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    emailController.dispose();
    super.dispose();
  }

  // Function to save user data to SharedPreferences
  Future<void> _saveUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', usernameController.text);
    await prefs.setString('email', emailController.text);
    await prefs.setString('phone', phoneController.text);
    await prefs.setString('password', passwordController.text);
  }

  // Function to display a message and navigate to the login screen
  void _showAccountCreatedMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: const Row(
          children: [
            Icon(Icons.check_circle, color: Colors.white), // Icon
            SizedBox(width: 10),
            Text("Account Created Successfully!",
                style: TextStyle(color: Colors.white)),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.r),
        ),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/newbg.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 30.h,
            left: 10.w,
            right: 10.w,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  SizedBox(height: 30.h),
                  CircleAvatar(
                    radius: 120.r,
                    backgroundImage: const AssetImage("assets/images/lo.png"),
                    backgroundColor: Colors.transparent,
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'Your Gateway to Entertainment Awaits!',
                    style: AppTextStyles.mainheadings(18),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    'Get Signup Now',
                    style: AppTextStyles.mainheadings(18),
                  ),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      children: [
                        CustomTextField(
                          hintText: 'Username',
                          iconPath: 'assets/icons/user.svg',
                          controller: usernameController,
                        ),
                        SizedBox(height: 20.h),
                        CustomTextField(
                          hintText: 'Email',
                          iconPath: 'assets/icons/email.svg',
                          controller: emailController,
                        ),
                        SizedBox(height: 20.h),
                        CustomTextField(
                          hintText: 'Phone',
                          iconPath: 'assets/icons/phone.svg',
                          controller: phoneController,
                        ),
                        SizedBox(height: 20.h),
                        CustomTextField(
                          hintText: 'Password',
                          iconPath: 'assets/icons/lock.svg',
                          isPasswordField: true,
                          controller: passwordController,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.h),
                  GestureDetector(
                    onTap: () async {
                      await _saveUserData();
                      _showAccountCreatedMessage();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                    },
                    child: const NeonCard(
                      intensity: 0,
                      glowSpread: 0,
                      child: SizedBox(
                        width: 300,
                        height: 50,
                        child: Center(
                          child: GradientText(
                            text: 'Signup',
                            fontSize: 22,
                            gradientColors: [
                              Colors.white,
                              Colors.white,
                              Colors.white
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
