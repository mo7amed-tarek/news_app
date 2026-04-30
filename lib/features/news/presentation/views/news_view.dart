import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/core/common_widgets/lottie_error_widget.dart';
import 'package:news_app/features/news/presentation/views/widgets/news_view_body.dart';
import 'package:news_app/features/news/presentation/views/widgets/shimmer/news_view_loading_shimmer.dart';
import 'package:news_app/features/news/presentation/views_model/news_notifier.dart';
import 'package:news_app/features/news/presentation/views_model/news_state.dart';

class NewsView extends ConsumerWidget {
  const NewsView({super.key, required this.categoryId});
  final String categoryId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsState = ref.watch(newsNotifierProvider(categoryId));
    final newsProvider = ref.watch(newsNotifierProvider(categoryId).notifier);
    return Scaffold(
      body: LayoutBuilder(
        builder: (_, __) {
          if (newsState is FetchNewsSuccessState) {
            return NewsViewBody(categoryId: categoryId);
          } else if (newsState is FetchNewsFailureState) {
            return LottieErrorWidget(
              errorMessage: newsState.error.errorMessage,
              appBarTitle: categoryId,
              onTryAgain: () =>
                  newsProvider.fetchCategoryNews(category: categoryId),
            );
          } else {
            return NewsViewLoadingShimmer(category: categoryId);
          }
        },
      ),
    );
  }
}
