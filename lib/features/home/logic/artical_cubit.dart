import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../core/webservice/webservice.dart';
import '../model/NewsModel.dart';
part 'artical_state.dart';

class ArticalCubit extends Cubit<ArticalState> {
  final WebService newsservice;

  ArticalCubit(this.newsservice) : super(ArticalInitial());

  var article;

  Future<void> getTopNews() async {
    emit(ArticalLoading());
    try {
      article = await newsservice.fetchTopHeadlins();
      emit(ArticalScuess(article));
    } on DioError catch (dioError) {
      emit(ArticalFaliuere("Network issue: ${dioError.message}"));
    } catch (e) {
      emit(ArticalFaliuere("An unexpected error occurred: $e"));
    }
  }

}
