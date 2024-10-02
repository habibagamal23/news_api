import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/SharedPrefsHelper.dart';
import '../../core/utils/constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkOnboardingStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(100.r),
          child: Image.asset('assets/news-report.png'),
        ),
      ),
    );
  }

  Future<void> _checkOnboardingStatus() async {
    await Future.delayed(const Duration(seconds: 3));

    bool hasVisitedOnboarding = await SharedPrefsHelper.getVisitedOnboarding();

    if (hasVisitedOnboarding) {
      Navigator.pushReplacementNamed(context, ConstantString.homeScreen);
    } else {
      Navigator.pushReplacementNamed(context, ConstantString.onBoardingScreen);
    }
  }
}
