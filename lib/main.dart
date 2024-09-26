import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nwesapi_app/features/home/logic/artical/artical_cubit.dart';
import 'package:nwesapi_app/features/onboarding/onboarding.dart';

import 'core/constant.dart';
import 'core/routes.dart';
import 'core/webservice/webservice.dart';
import 'features/home/logic/them/theme_cubit.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ArticalCubit(WebService()),
        ),
        BlocProvider(
          create: (_) => ThemeCubit(), // Add ThemeCubit here
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, themeState) {
        return ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: themeState.themeData,
            onGenerateRoute: AppRoutes().onGenerateRoute,
            initialRoute: ConstantString.onBoardingScreen,
          ),
        );
      },
    );
  }
}
