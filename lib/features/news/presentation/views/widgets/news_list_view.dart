import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/news/data/models/article/article_model.dart';
import 'package:news_app/features/news/presentation/views/widgets/news_item.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({super.key, required this.newsArticles});
  final List<ArticleModel> newsArticles;
  @override
  Widget build(BuildContext context) {
    return RPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, index) => NewsItem(articleData: newsArticles[index]),
        separatorBuilder: (context, index) => const RSizedBox(height: 16),
        itemCount: newsArticles.length,
      ),
    );
  }
}
