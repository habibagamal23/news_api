import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nwesapi_app/features/home/logic/Articallogic/articals_cubit.dart';
import '../../core/SharedPrefsHelper.dart';
import '../../core/utils/colors_mangment.dart';
import '../../core/utils/constant.dart';
import '../../core/utils/styles.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async{
       await SharedPrefsHelper.setVisitedOnboarding(true);
        Navigator.pushReplacementNamed(context, ConstantString.homeScreen);
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
