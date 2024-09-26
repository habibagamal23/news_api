import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/styles.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial()) {
    _getThemeFromPrefs(); // Load saved theme on initialization
  }

  // Save the theme preference to SharedPreferences
  Future<void> _saveThemeToPrefs(Brightness brightness) async {
    final themeIndex = brightness == Brightness.light ? 0 : 1;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('theme', themeIndex);
  }

  // Retrieve the saved theme from SharedPreferences
  Future<void> _getThemeFromPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final savedThemeIndex = prefs.getInt('theme') ?? 0;
    if (savedThemeIndex == 0) {
      emit(ThemeChanged(AppThemes.lightTheme));
    } else {
      emit(ThemeChanged(AppThemes.darkTheme));
    }
  }

  // Toggle between light and dark theme
  void toggleTheme() {
    if (state.themeData.brightness == Brightness.light) {
      emit(ThemeChanged(AppThemes.darkTheme));
      _saveThemeToPrefs(Brightness.dark);
    } else {
      emit(ThemeChanged(AppThemes.lightTheme));
      _saveThemeToPrefs(Brightness.light);
    }
  }
}
