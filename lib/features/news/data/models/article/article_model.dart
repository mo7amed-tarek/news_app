import 'package:news_app/features/news/data/models/article/source.dart';

class ArticleModel {
  ArticleModel({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  static ArticleModel empty() => ArticleModel();

  factory ArticleModel.fromJson(Map<String, dynamic>? articleData) {
    if (articleData != null && articleData.isNotEmpty) {
      return ArticleModel(
        source: articleData['source'] != null
            ? Source.fromJson(articleData['source'])
            : null,
        author: articleData['author'],
        title: articleData['title'],
        description: articleData['description'],
        url: articleData['url'],
        urlToImage: articleData['urlToImage'],
        publishedAt: articleData['publishedAt'],
        content: articleData['content'],
      );
    } else {
      return empty();
    }
  }
}
