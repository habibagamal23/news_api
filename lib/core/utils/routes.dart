import 'package:flutter/material.dart';
import '../../features/home/ui/deatiales_screen.dart';
import '../../features/home/ui/home.dart';
import '../../features/onboarding/onboarding.dart';
import 'constant.dart';
import '../../features/home/model/NewsModel.dart'; // Import the Article model

class AppRoutes {

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ConstantString.onBoardingScreen:
        return MaterialPageRoute(builder: (context) => OnBoarding());

      case ConstantString.homeScreen:
    return MaterialPageRoute(
        builder: (context) => HomeScreen());

      case ConstantString.newsDetailScreen:
        final article = settings.arguments as Article;
        return MaterialPageRoute(
          builder: (context) => NewsDetailScreen(article: article),
        );



      default:
        return null;
    }
  }
}
