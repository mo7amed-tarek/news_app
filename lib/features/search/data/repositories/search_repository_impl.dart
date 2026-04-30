import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/core/utils/exceptions/failure.dart';
import 'package:news_app/features/news/data/models/article/article_model.dart';
import 'package:news_app/features/search/data/data_sources/remote_data/search_remote_data.dart';
import 'package:news_app/features/search/domain/repositories/search_repository.dart';

@Injectable(as: SearchRepository)
class SearchRepositoryImpl implements SearchRepository {
  final SearchRemoteData searchRemoteData;
  @factoryMethod
  const SearchRepositoryImpl({required this.searchRemoteData});
  @override
  Future<Either<Failure, List<ArticleModel>>> fetchSearchArticles({
    required String searchKeyword,
    required int page,
    int pageSize = 5,
  }) async {
    return await searchRemoteData.fetchSearchArticles(
      searchKeyword: searchKeyword,
      page: page,
      pageSize: pageSize,
    );
  }
}
