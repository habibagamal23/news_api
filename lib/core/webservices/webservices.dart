import 'package:dio/dio.dart';
import 'package:nwesapi_app/features/home/model/NewsModel.dart';

class WebServices {
  Dio dio = Dio();

  WebServices() {
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      responseBody: true,
      error: true,
    ));
    dio.interceptors.add(InterceptorsWrapper(
      onError: (DioError e, ErrorInterceptorHandler handler) {
        print('Error: ${e.message}');
        return handler.next(e);
      },
    ));
  }
  Future<List<Article>> fetchTopHeadline() async {
    try {
      var respone = await dio.get(
          "https://newsapi.org/v2/top-headlines?country=us&apiKey=7442ff1006a5458ab13d6890abfc8019");

      if (respone.statusCode == 200) {
        List<dynamic> articles = respone.data["articles"];
        return articles.map((article) => Article.fromJosn(article)).toList();
      } else {
        throw Exception(respone.data["error"]["message"]);
      }
    } catch (e) {
      throw Exception("$e");
    }
  }
}
