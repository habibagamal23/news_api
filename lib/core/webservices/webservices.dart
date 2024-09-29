import 'package:dio/dio.dart';
import 'package:nwesapi_app/features/home/model/NewsModel.dart';

class WebServices {
  Dio dio = Dio();

  Future<List<Article>> fetchTopHeadline() async {
    try {
      var respone = await dio.get(
          "https://newsapi.org/v2/top-headlines?country=us&apiKey=4881729f455449e2834a0f136da1bd9b");

      if (respone.statusCode == 200) {
        Map<String, dynamic> jsondata = respone.data;
        List<dynamic> articals = jsondata["articles"];

        List<Article> articallist = [];

        for (var artical in articals) {
          Article artmodel = Article.fromJosn(artical);
          articallist.add(artmodel);
        }
        return articallist;
      } else {
        throw Exception(respone.data["error"]["message"]);
      }
    } catch (e) {
      throw Exception("$e");
    }
  }
}
