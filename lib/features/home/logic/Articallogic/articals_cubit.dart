import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nwesapi_app/core/webservices/webservices.dart';
import 'package:nwesapi_app/features/home/model/NewsModel.dart';

part 'articals_state.dart';

class ArticalsCubit extends Cubit<ArticalsState> {
  ArticalsCubit() : super(ArticalsInitial());

  WebServices webServices = WebServices();

  late List<Article> myartical;

  Future getNews() async {
    emit(ArticalsLoading());
    try {
      myartical = await webServices.fetchTopHeadline();
      emit(ArticalsSucuess(myartical));
    } catch (e) {
      emit(ArticalsFaliuere("my error is $e"));
    }
  }
}
