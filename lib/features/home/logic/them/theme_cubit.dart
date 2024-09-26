import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/styles.dart';
part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(LightThemeState()) {
    _loadThemeFromPrefs();
  }

  Future<void> _saveThemeToPrefs(bool isDarkTheme) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkTheme', isDarkTheme);
  }

  Future<void> _loadThemeFromPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final isDarkTheme = prefs.getBool('isDarkTheme') ?? false;
    if (isDarkTheme) {
      emit(DarkThemeState());
    } else {
      emit(LightThemeState());
    }
  }

  void toggleTheme() {
    if (state is LightThemeState) {
      emit(DarkThemeState());
      _saveThemeToPrefs(true);
    } else {
      emit(LightThemeState());
      _saveThemeToPrefs(false);
    }
  }
}
