import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nwesapi_app/features/home/logic/artical_cubit.dart';
import 'package:nwesapi_app/features/onboarding/onboarding.dart';

import 'core/constant.dart';
import 'core/routes.dart';
import 'core/webservice/webservice.dart';

void main() {
  runApp(BlocProvider(
    create: (_) => ArticalCubit(WebService()),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          onGenerateRoute: AppRoutes().onGenerateRoute,
          initialRoute: ConstantString.onBoardingScreen,
        ));
  }
}
