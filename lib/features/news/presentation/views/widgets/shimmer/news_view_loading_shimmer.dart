import 'package:flutter/material.dart';
import 'package:news_app/features/news/presentation/views/widgets/news_sliver_app_bar.dart';
import 'package:news_app/features/news/presentation/views/widgets/shimmer/categories_sliver_tab_bar_shimmer.dart';
import 'package:news_app/features/news/presentation/views/widgets/shimmer/news_list_shimmer.dart';

class NewsViewLoadingShimmer extends StatelessWidget {
  const NewsViewLoadingShimmer({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          NewsSliverAppBar(category: category),
          const CategoriesSliverTabBarShimmer(),
        ],
        body: const TabBarView(
          physics: BouncingScrollPhysics(),
          children: [
            NewsListShimmer(),
            NewsListShimmer(),
            NewsListShimmer(),
            NewsListShimmer(),
            NewsListShimmer(),
            NewsListShimmer(),
            NewsListShimmer(),
          ],
        ),
      ),
    );
  }
}
