import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nwesapi_app/features/home/logic/artical/artical_cubit.dart';
import '../../core/colors_mangment.dart';
import '../../core/constant.dart';
import '../../core/styles.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
       context.read<ArticalCubit>().getTopNews();
        Navigator.pushReplacementNamed(context, ConstantString.homeScreen);
      },
      style: TextButton.styleFrom(
        backgroundColor: ColorsManager.mainBlue,  // Using Theme or ColorsManager
        minimumSize: const Size(double.infinity, 52),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Text(
        'Get Started',
        style: TextStyles.font16WhiteSemiBold,
      ),
    );
  }
}
