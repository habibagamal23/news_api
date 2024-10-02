import 'package:flutter/material.dart';
import '../../core/sharedPrafrance/SharedPrefsHelper.dart';
import '../../core/utils/colors_mangment.dart';
import '../../core/utils/routes.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        await SharedPrefsHelper.setVisitedOnboarding(true);
        Navigator.pushReplacementNamed(context, RoutesString.homeScreen);
      },
      style: TextButton.styleFrom(
        backgroundColor: ColorsManager.mainBlue,
        minimumSize: const Size(double.infinity, 52),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Text(
        'Get Started',
        style: Theme.of(context).textTheme.labelLarge,
      ),
    );
  }
}
