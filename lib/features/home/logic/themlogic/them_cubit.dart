import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/SharedPrefsHelper.dart';
import '../../../../core/utils/styles.dart';

part 'them_state.dart';

class ThemCubit extends Cubit<ThemState> {
  ThemCubit() : super(ThemInitial(AppThemes.lightTheme)) {
    getTheme();
  }

  Future saveTheme(Brightness brightness) async {
    final themeindex = brightness == Brightness.light ? 0 : 1;
    await SharedPrefsHelper.setTheme(themeindex);
  }

  Future getTheme() async {
    var savedindex = await SharedPrefsHelper.getTheme();
    if (savedindex == 0) {
      emit(ThemChanged(AppThemes.lightTheme));
    } else {
      emit(ThemChanged(AppThemes.darkTheme));
    }
  }

  void Toggle() {
    if (state.themedate.brightness == Brightness.light) {
      emit(ThemChanged(AppThemes.darkTheme));
      saveTheme(Brightness.dark);
    } else {
      emit(ThemChanged(AppThemes.lightTheme));
      saveTheme(Brightness.light);
    }
  }
}
