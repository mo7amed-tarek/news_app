import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/news/presentation/views/widgets/shimmer/news_item_shimmer.dart';

class NewsListShimmer extends StatelessWidget {
  const NewsListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return RPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, __) => const NewsItemShimmer(),
        separatorBuilder: (_, __) => const RSizedBox(height: 16),
        itemCount: 12,
      ),
    );
  }
}
