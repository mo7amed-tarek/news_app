import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/news/presentation/views/widgets/news_item.dart';
import 'package:news_app/features/news/presentation/views/widgets/shimmer/news_item_shimmer.dart';
import 'package:news_app/features/search/presentation/views_model/search_notifier.dart';
import 'package:news_app/features/search/presentation/views_model/search_state.dart';

class NewsSearchListView extends ConsumerWidget {
  const NewsSearchListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchProvider = ref.read(searchNotifierProvider.notifier);
    final searchState = ref.watch(searchNotifierProvider);
    return RPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.separated(
        controller: searchProvider.scrollController,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, index) {
          final articles = searchProvider.allArticles;

          if (index < articles.length) {
            return NewsItem(articleData: articles[index]);
          } else {
            return const NewsItemShimmer();
          }
        },
        separatorBuilder: (context, index) => const RSizedBox(height: 16),
        itemCount:
            searchProvider.allArticles.length +
            (searchState is FetchNewPageNewsLoadingState ? 5 : 0),
      ),
    );
  }
}
