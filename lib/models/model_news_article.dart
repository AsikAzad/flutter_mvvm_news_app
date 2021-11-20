class ModelNewsArticle {
  late String title;
  late String publishedAt;
  late String description;
  late String url;
  late String urlToImage;

  ModelNewsArticle(
      {required this.title,
      required this.publishedAt,
      required this.description,
      required this.url,
      required this.urlToImage});

  factory ModelNewsArticle.fromJson(Map<String, dynamic> json) {
    return ModelNewsArticle(
        title: json['title'],
        publishedAt: json['publishedAt'],
        description: json['description'],
        url: json['url'],
        urlToImage: json['urlToImage']);
  }
}
