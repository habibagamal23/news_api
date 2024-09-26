
class Article {
  Article({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });


  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final DateTime? publishedAt;
  final String? content;

  factory Article.fromJson(Map<String, dynamic> json){
    return Article(
      author: json["author"]??"Not know",
      title: json["title"]??"Not know",
      description: json["description"]??"Not know",
      url: json["url"]??"Not know",
      urlToImage: json["urlToImage"]??"Not know",
      publishedAt: DateTime.parse(json["publishedAt"] ?? ""),
      content: json["content"]??"Not know",
    );
  }

}


