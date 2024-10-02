import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nwesapi_app/features/home/logic/Articallogic/articals_cubit.dart';
import 'core/sharedPrafrance/SharedPrefsHelper.dart';
import 'features/home/logic/themlogic/them_cubit.dart';
import 'myapp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefsHelper.init();

  runApp(
    MultiBlocProvider(providers: [
      BlocProvider(create: (_) => ThemCubit()),
      BlocProvider(create: (_) => ArticalsCubit()..getNews()),
    ], child: const MyApp()),
  );
}
