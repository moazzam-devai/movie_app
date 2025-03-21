import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie/auth/signup.dart';
import 'package:movie/utils/text_styles.dart';
import 'package:movie/views/BottomNav/bottomnavbar_screen.dart';
import 'package:movie/widgets/custom_textfield_widget.dart';
import 'package:movie/widgets/neon_card_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Function to get the stored user data from SharedPreferences
  Future<void> _loginUser() async {
    final prefs = await SharedPreferences.getInstance();

    String? storedemail = prefs.getString('email');
    String? storedPassword = prefs.getString('password');

    String enteredUsername = usernameController.text;
    String enteredPassword = passwordController.text;

    if (storedemail != null && storedPassword != null) {
      if (enteredUsername == storedemail && enteredPassword == storedPassword) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: const Row(
              children: [
                Icon(Icons.check_circle, color: Colors.white), // Icon
                SizedBox(width: 10),
                Text("Welcome back!", style: TextStyle(color: Colors.white)),
              ],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.r),
            ),
            behavior: SnackBarBehavior.floating,
            margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
          ),
        );

        Navigator.pushReplacement(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(builder: (context) => const BottomNavBarScreen()),
        );
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: const Row(
              children: [
                Icon(Icons.no_accounts, color: Colors.white),
                SizedBox(width: 10),
                Text("Invalid username or password!",
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
    } else {
      // No stored credentials found (new user)
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("No account found. Please sign up.")),
      );
    }
  }

  @override
  void dispose() {
    usernameController.clear();
    passwordController.clear();
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
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
            top: 120.h,
            left: 10.w,
            right: 10.w,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 120.r,
                    backgroundImage: const AssetImage("assets/images/lo.png"),
                    backgroundColor: Colors.transparent,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    'Your Gateway to Entertainment Awaits!',
                    style: AppTextStyles.mainheadings(18),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    'Get Login Now',
                    style: AppTextStyles.mainheadings(18),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: CustomTextField(
                            hintText: 'Username',
                            iconPath: 'assets/icons/user.svg',
                            controller: usernameController,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        SizedBox(
                          width: double.infinity,
                          child: CustomTextField(
                            hintText: 'Password',
                            iconPath: 'assets/icons/lock.svg',
                            isPasswordField: true,
                            controller: passwordController,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.h),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignupScreen(),
                        ),
                      );
                    },
                    child: RichText(
                      text: TextSpan(
                        text: "Don't have an account? ",
                        style: AppTextStyles.whiteText(16),
                        children: <TextSpan>[
                          TextSpan(
                            text: "Sign up",
                            style: AppTextStyles.greenText(16),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  GestureDetector(
                    onTap: _loginUser, // Call the login function on tap
                    child: const NeonCard(
                      intensity: 0,
                      glowSpread: 0,
                      child: SizedBox(
                        width: 300,
                        height: 50,
                        child: Center(
                          child: GradientText(
                            text: 'Login',
                            fontSize: 22,
                            gradientColors: [
                              Colors.white,
                              Colors.white,
                              Colors.white,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
