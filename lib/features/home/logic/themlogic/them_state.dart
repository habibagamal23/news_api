part of 'them_cubit.dart';

@immutable
abstract class ThemState {
  final ThemeData themedate;
  ThemState(this.themedate);
}

final class ThemInitial extends ThemState {
  ThemInitial(ThemeData lightTheme) : super(AppThemes.lightTheme);
}

final class ThemChanged extends ThemState {
  ThemChanged(ThemeData themedata) : super(themedata);
}
