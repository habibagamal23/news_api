
part of 'theme_cubit.dart';


@immutable
abstract class ThemeState {
  final ThemeData themeData;
  ThemeState(this.themeData); // Remove 'const' here
}

class ThemeInitial extends ThemeState {
  ThemeInitial() : super(AppThemes.lightTheme);  // Default theme is light, no 'const'
}

class ThemeChanged extends ThemeState {
  ThemeChanged(ThemeData themeData) : super(themeData); // No 'const' here as well
}