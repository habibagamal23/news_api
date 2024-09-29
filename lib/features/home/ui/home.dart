import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nwesapi_app/features/home/logic/Articallogic/articals_cubit.dart';
import 'package:nwesapi_app/features/home/logic/themlogic/them_cubit.dart';

import '../../../core/utils/colors_mangment.dart';
import '../../../core/utils/constant.dart';
import '../../../core/utils/styles.dart';

import '../model/NewsModel.dart';
import 'news_body_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("News App"),
          actions: [
            Switch(
              activeColor: Colors.grey,
              inactiveThumbColor: ColorsManager.mainBlue,
              value: context.read<ThemCubit>().state.themedate.brightness ==
                  Brightness.dark,
              onChanged: (value) {
                context.read<ThemCubit>().Toggle();
              },
            ),
          ],
        ),
        body: BlocBuilder<ArticalsCubit, ArticalsState>(
            builder: (context, state) {
          if (state is ArticalsLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ArticalsSucuess) {
            return ListView.builder(
                itemCount: state.articals.length,
                itemBuilder: (context, index) {
                  return NewsCard(article: state.articals[index]);
                });
          } else if (state is ArticalsFaliuere) {
            return Text(state.err);
          }
          return Text("news app");
        }));
  }
}
