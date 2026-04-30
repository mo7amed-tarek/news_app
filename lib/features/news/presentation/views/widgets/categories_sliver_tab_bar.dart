import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/news/presentation/views_model/news_notifier.dart';

class CategoriesSliverTabBar extends ConsumerWidget {
  const CategoriesSliverTabBar({super.key, required this.categoryId});
  final String categoryId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsProvider = ref.read(newsNotifierProvider(categoryId).notifier);
    return SliverAppBar(
      automaticallyImplyLeading: false,
      scrolledUnderElevation: 0,
      pinned: true,
      toolbarHeight: 30.h,
      flexibleSpace: FlexibleSpaceBar(
        background: SafeArea(
          child: TabBar(
            isScrollable: true,
            physics: const BouncingScrollPhysics(),
            tabAlignment: TabAlignment.start,
            dividerHeight: 0,
            unselectedLabelStyle: Theme.of(context).textTheme.bodyMedium,
            labelStyle: Theme.of(context).textTheme.bodyLarge,
            indicatorColor: Theme.of(context).colorScheme.inversePrimary,
            tabs: newsProvider.allCategories
                .map((category) => Tab(text: category.name))
                .toList(),
          ),
        ),
      ),
    );
  }
}
