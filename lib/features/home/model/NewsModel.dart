class Article {
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final DateTime? publishedAt;
  final String? content;

  Article({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Article.fromJosn(Map<String, dynamic> json) {
    return Article(
      author: json["author"] ?? "not know",
      title: json["title"] ?? "not know",
      description: json["description"] ?? "not know",
      url: json["url"] ?? "not know",
      urlToImage: json["urlToImage"] ?? "not know",
      publishedAt: DateTime.tryParse(json["publishedAt"] ?? "not know"),
      content: json["content"] ?? "not know",
    );
  }
}
