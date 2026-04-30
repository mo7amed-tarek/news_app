import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/core/utils/constants/app_text.dart';
import 'package:news_app/core/utils/exceptions/dio_exceptions.dart';
import 'package:news_app/core/utils/exceptions/failure.dart';
import 'package:news_app/core/utils/services/api_service.dart';
import 'package:news_app/features/news/data/data_sources/remote_data/news_remote_data.dart';
import 'package:news_app/features/news/data/models/article/article_model.dart';

@Injectable(as: NewsRemoteData)
class NewsRemoteDataImpl implements NewsRemoteData {
  @factoryMethod
  const NewsRemoteDataImpl({required this.apiService});

  final ApiService apiService;

  @override
  Future<List<ArticleModel>> fetchCategoryArticles({
    required String category,
  }) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.none)) {
      throw DioExceptions(errorMessage: AppText.networkError);
    }
    var result = await apiService.getRequest(
      endpoint: "/top-headlines",
      queryParams: {"category": category.toLowerCase()},
    );

    return result.fold(
      (failure) => throw failure,
      (categoryData) {
        if (categoryData.data == null || categoryData.data["articles"] == null) {
          return [];
        }
        final listOfArticles = (categoryData.data["articles"] as List)
            .map(
              (article) =>
                  ArticleModel.fromJson(article as Map<String, dynamic>),
            )
            .toList();
        return listOfArticles;
      },
    );
  }
}
