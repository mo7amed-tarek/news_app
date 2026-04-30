import 'package:dartz/dartz.dart';
import 'package:news_app/core/utils/exceptions/failure.dart';
import 'package:news_app/features/news/data/models/article/article_model.dart';

abstract class NewsRepository {
  Future<Either<Failure, List<ArticleModel>>> fetchCategoryArticles({
    required String category,
  });
}
