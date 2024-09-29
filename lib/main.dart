import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nwesapi_app/features/home/logic/Articallogic/articals_cubit.dart';

import 'core/utils/constant.dart';
import 'core/utils/routes.dart';
import 'core/utils/styles.dart';
import 'features/home/logic/themlogic/them_cubit.dart';

void main() {
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider(create: (_) => ArticalsCubit()),
      BlocProvider(create: (_) => ThemCubit())
    ], child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return
      BlocBuilder<ThemCubit, ThemState>(builder: (context , state){
        return ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: state.themedate,
            onGenerateRoute: AppRoutes().onGenerateRoute,
            initialRoute: ConstantString.onBoardingScreen,
          ),
        );
      });

  }
}
