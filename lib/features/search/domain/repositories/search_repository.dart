import 'package:dartz/dartz.dart';
import 'package:news_app/core/utils/exceptions/failure.dart';
import 'package:news_app/features/news/data/models/article/article_model.dart';

abstract class SearchRepository {
  Future<Either<Failure, List<ArticleModel>>> fetchSearchArticles({
    required String searchKeyword,
    required int page,
    int pageSize = 5,
  });
}
