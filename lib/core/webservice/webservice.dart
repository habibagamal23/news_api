import 'package:dio/dio.dart';

import '../../features/home/model/NewsModel.dart';

class WebService {
  Dio _dio = Dio();
  String baseurl = 'https://newsapi.org/v2';

  Future<List<Article>> fetchTopHeadlins() async {
    final String url =
        '$baseurl/top-headlines?country=us&language=en&apiKey=4881729f455449e2834a0f136da1bd9b&category';
    try {
      final response = await _dio.get(
        url,
      );
      print("Response Data: ${response.data}");
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = response.data;

        List<dynamic> articles = jsonData['articles'];

        List<Article> articlesList = [];

        for (var article in articles) {
          Article articleModel = Article.fromJson(article);
          articlesList.add(articleModel);
        }
        return articlesList;
      } else {
        throw Exception(response.data["error"]["message"]);
      }
    } catch (e) {
      throw Exception("Failed to fetch weather: $e");
    }
  }
}
