import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/features/news/presentation/views/widgets/categories_sliver_tab_bar.dart';
import 'package:news_app/features/news/presentation/views/widgets/news_list_view.dart';
import 'package:news_app/features/news/presentation/views/widgets/news_sliver_app_bar.dart';
import 'package:news_app/features/news/presentation/views_model/news_notifier.dart';

class NewsViewBody extends ConsumerWidget {
  const NewsViewBody({super.key, required this.categoryId});
  final String categoryId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsProvider = ref.read(newsNotifierProvider(categoryId).notifier);
    return DefaultTabController(
      length: newsProvider.allCategories.length,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          NewsSliverAppBar(category: categoryId),
          CategoriesSliverTabBar(categoryId: categoryId),
        ],
        body: TabBarView(
          physics: const BouncingScrollPhysics(),
          children: newsProvider.categoryArticlesList
              .map((articles) => NewsListView(newsArticles: articles))
              .toList(),
        ),
      ),
    );
  }
}
