import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/core/utils/constants/app_text.dart';
import 'package:news_app/core/utils/exceptions/dio_exceptions.dart';
import 'package:news_app/core/utils/exceptions/failure.dart';
import 'package:news_app/core/utils/services/api_service.dart';
import 'package:news_app/features/news/data/models/article/article_model.dart';
import 'package:news_app/features/search/data/data_sources/remote_data/search_remote_data.dart';

@Injectable(as: SearchRemoteData)
class SearchRemoteDataImpl implements SearchRemoteData {
  final ApiService apiService;
  @factoryMethod
  const SearchRemoteDataImpl({required this.apiService});

  @override
  Future<Either<Failure, List<ArticleModel>>> fetchSearchArticles({
    required String searchKeyword,
    required int page,
    int pageSize = 5,
  }) async {
    final List<ConnectivityResult> connectivityResult = await (Connectivity()
        .checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.none)) {
      return left(DioExceptions(errorMessage: AppText.networkError));
    }
    var result = await apiService.getRequest(
      endpoint: "/everything",
      queryParams: {
        "q": searchKeyword.toLowerCase(),
        "pageSize": pageSize.toString(),
        "page": page.toString(),
      },
    );
    return result.fold((failure) => left(failure), (categoryData) {
      final listOfArticles = (categoryData.data["articles"] as List)
          .map(
            (article) => ArticleModel.fromJson(article as Map<String, dynamic>),
          )
          .toList();
      return right(listOfArticles);
    });
  }
}
