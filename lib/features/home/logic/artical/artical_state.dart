part of 'artical_cubit.dart';

@immutable
sealed class ArticalState {}

final class ArticalInitial extends ArticalState {}

final class ArticalLoading extends ArticalState {}

final class ArticalScuess extends ArticalState {
  final List<Article> articles;
  ArticalScuess(this.articles);
}

final class ArticalFaliuere extends ArticalState {
  final String errmsg;

  ArticalFaliuere(this.errmsg);
}
