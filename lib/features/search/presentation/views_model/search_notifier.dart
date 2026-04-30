import 'package:flutter/material.dart';
import 'package:news_app/features/news/data/models/article/article_model.dart';
import 'package:news_app/features/search/domain/repositories/search_repository.dart';
import 'package:news_app/features/search/presentation/views_model/search_providers.dart';
import 'package:news_app/features/search/presentation/views_model/search_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_notifier.g.dart';

@riverpod
class SearchNotifier extends _$SearchNotifier {
  List<ArticleModel> allArticles = [];
  String? previousSearchWord;
  int page = 1;
  late final ScrollController scrollController;
  late final TextEditingController searchController;
  late final SearchRepository searchRepo;

  @override
  SearchState build() {
    onInit();
    searchRepo = ref.watch(searchRepositoryProvider);
    ref.onDispose(() {
      searchController.dispose();
      scrollController.dispose();
    });
    return SearchInitial();
  }

  void onInit() {
    searchController = TextEditingController();
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (!isTop && state is! FetchNewPageNewsLoadingState) {
          page++;
          state = FetchNewPageNewsLoadingState();
          fetchSearchedNews(searchInWord: previousSearchWord);
        }
      }
    });
  }

  Future<void> fetchSearchedNews({required String? searchInWord}) async {
    if (searchInWord != null && searchInWord.trim() != "") {
      previousSearchWord = searchInWord;
      if (allArticles.isEmpty) state = FetchNewsLoadingState();
      var result = await searchRepo.fetchSearchArticles(
        searchKeyword: searchInWord,
        page: page,
      );
      result.fold((failure) => state = FetchNewsFailureState(error: failure), (
        articlesData,
      ) {
        allArticles.addAll(articlesData);
        state = FetchNewsSuccessState();
      });
    }
  }

  void resetNewsList() {
    page = 1;
    allArticles.clear();
  }

  void resetSearchData() {
    page = 1;
    previousSearchWord = null;
    searchController.clear();
    allArticles.clear();
    state = SearchInitial();
  }
}
