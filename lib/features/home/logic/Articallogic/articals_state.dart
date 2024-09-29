part of 'articals_cubit.dart';

@immutable
sealed class ArticalsState {}

final class ArticalsInitial extends ArticalsState {}

final class ArticalsLoading extends ArticalsState {}

final class ArticalsSucuess extends ArticalsState {
  final List<Article> articals;
  ArticalsSucuess(this.articals);
}

final class ArticalsFaliuere extends ArticalsState {
  final String err;
  ArticalsFaliuere(this.err);
}
