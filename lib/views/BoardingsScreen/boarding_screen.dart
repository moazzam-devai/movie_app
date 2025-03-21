import 'package:flutter/material.dart';
import 'package:movie/auth/signin.dart';
import 'package:movie/constants/app_colors.dart';
import 'package:movie/models/onboarding_model.dart';
import 'package:movie/widgets/boarding_button_widget.dart';
import 'package:movie/widgets/dots_indicator_widget.dart';
import 'package:movie/widgets/gradient_card_widget.dart';
import 'package:movie/widgets/onboarding_card_widget.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(onboardingList[_currentIndex].bgImage),
            fit: BoxFit.cover,
          ),
        ),
        child: CustomGradientCard(
          gradient: AppColors.customOnboardingGradient,
          child: Column(
            children: [
              const Spacer(),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: onboardingList.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return OnboardingCard(
                      onboarding: onboardingList[index],
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              CustomDotsIndicator(
                dotsCount: onboardingList.length,
                position: _currentIndex,
              ),
              const SizedBox(height: 30),
              PrimaryButton(
                onTap: () {
                  if (_currentIndex == onboardingList.length - 1) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  } else {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.fastOutSlowIn,
                    );
                  }
                },
                text: 'Continue',
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
