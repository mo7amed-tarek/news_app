import 'package:news_app/features/news/data/models/article/article_model.dart';

abstract class NewsRemoteData {
  Future<List<ArticleModel>> fetchCategoryArticles({
    required String category,
  });
}
