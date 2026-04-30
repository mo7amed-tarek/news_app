import 'package:dartz/dartz.dart';
import 'package:news_app/core/utils/exceptions/dio_exceptions.dart';
import 'package:news_app/core/utils/exceptions/failure.dart';
import 'package:news_app/features/news/data/models/article/article_model.dart';
import 'package:news_app/features/news/data/models/article/source.dart';
import 'package:news_app/features/news/domain/repositories/news_repository.dart';
import 'package:news_app/features/news/presentation/views_model/news_providers.dart';
import 'package:news_app/features/news/presentation/views_model/news_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:url_launcher/url_launcher.dart';

part 'news_notifier.g.dart';

@riverpod
class NewsNotifier extends _$NewsNotifier {
  List<List<ArticleModel>> categoryArticlesList = [];
  List<ArticleModel> allArticles = [];
  List<Source> allCategories = [];
  late final NewsRepository newsRepo;
  @override
  NewsState build(String? categoryId) {
    newsRepo = ref.watch(newsRepositoryProvider);
    fetchCategoryNews(category: categoryId ?? "");
    return FetchNewsLoadingState();
  }

  Future<void> fetchCategoryNews({required String category}) async {
    var result = await newsRepo.fetchCategoryArticles(category: category);
    result.fold((failure) => state = FetchNewsFailureState(error: failure), (
      articlesData,
    ) {
      allArticles = articlesData;
      allCategories = articlesData
          .map((category) => category.source)
          .whereType<Source>()
          .toSet()
          .toList();
      initializeAllCategoriesArticles(allCategoriesList: allCategories);
      state = FetchNewsSuccessState();
    });
  }

  void initializeAllCategoriesArticles({
    required List<Source> allCategoriesList,
  }) {
    for (int i = 0; i < allCategoriesList.length; i++) {
      categoryArticlesList.add(
        getCategoryArticles(categoryName: allCategoriesList[i].name ?? ""),
      );
    }
  }

  List<ArticleModel> getCategoryArticles({required String categoryName}) {
    return allArticles
        .where((article) => article.source?.name == categoryName)
        .toList();
  }

  Future<void> launchInBrowserView(String url) async {
    state = OpenUrlLoadingState();
    var result = await tryLaunchInBrowserView(url);
    result.fold(
      (failure) => state = OpenUrlFailureState(error: failure),
      (success) => state = OpenUrlSuccessState(),
    );
  }

  Future<Either<Failure, void>> tryLaunchInBrowserView(String url) async {
    try {
      await launchUrl(Uri.parse(url), mode: LaunchMode.inAppBrowserView);
      return right(null);
    } catch (e) {
      return left(DioExceptions(errorMessage: e.toString()));
    }
  }
}
