import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nwesapi_app/features/splash/splash_screen.dart';
import '../../features/home/logic/Articallogic/articals_cubit.dart';
import '../../features/home/ui/deatiales_screen.dart';
import '../../features/home/ui/home.dart';
import '../../features/onboarding/onboarding.dart';
import 'constant.dart';
import '../../features/home/model/NewsModel.dart'; // Import the Article model

class RoutesString {
  static const String onBoardingScreen = 'onBoardingScreen';
  static const String homeScreen = 'homeScreen';
  static const String newsDetailScreen = 'newsDetailScreen';
  static const String splashScreen = 'splashScreen';
}

class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {

    switch (settings.name) {
      case RoutesString.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());

      case RoutesString.onBoardingScreen:
        return MaterialPageRoute(builder: (context) => const OnBoarding());

      case RoutesString.homeScreen:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
        );

      case RoutesString.newsDetailScreen:
        final article = settings.arguments as Article;
        return MaterialPageRoute(
          builder: (context) => NewsDetailScreen(article: article),
        );

      default:
        return null;
    }
  }
}

