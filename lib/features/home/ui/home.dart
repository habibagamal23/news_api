import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/colors_mangment.dart';
import '../../../core/utils/constant.dart';
import '../../../core/utils/styles.dart';

import '../model/NewsModel.dart';

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
              value: true,
              onChanged: (value) {
                // Toggle the theme
              },
            ),
          ],
        ),
        body: Container(
          child: Text("Home", style: Theme.of(context).textTheme.titleLarge),
        ));
  }
}
