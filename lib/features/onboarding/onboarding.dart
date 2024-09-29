import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nwesapi_app/core/utils/colors_mangment.dart';
import 'package:nwesapi_app/features/onboarding/button.dart';
import '../../core/utils/styles.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 30.h), // Refined padding
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 120.h),
              Image.asset(
                'assets/news-report.png',
                fit: BoxFit.cover,
                width: 200.w,
                height: 200.h,
              ),
              SizedBox(height: 30.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Column(
                  children: [
                    Text('GlobalNews',
                        style: Theme.of(context).textTheme.headlineLarge),
                    SizedBox(height: 10.h),
                    Text(
                      'Stay informed with the latest news across various categories. Get real-time updates and insights from around the world.',
                      style:Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 30.h),
                    const GetStartedButton(), // Use const for static widgets
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
