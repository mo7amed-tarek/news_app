import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/loaders/loaders.dart';
import 'package:news_app/features/news/presentation/views/widgets/shimmer/news_list_shimmer.dart';
import 'package:news_app/features/search/presentation/views/widgets/news_search_list_view.dart';
import 'package:news_app/features/search/presentation/views/widgets/search_app_bar.dart';
import 'package:news_app/features/search/presentation/views_model/search_notifier.dart';
import 'package:news_app/features/search/presentation/views_model/search_state.dart';

class SearchViewBody extends ConsumerWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchStates = ref.watch(searchNotifierProvider);
    ref.listen<SearchState>(searchNotifierProvider, (previous, next) {
      if (next is FetchNewsFailureState) {
        Loaders.showErrorMessage(
          message: next.error.errorMessage,
          context: context,
        );
      }
    });
    return Column(
      children: [
        const RSizedBox(height: 16),
        const SearchAppBar(),
        const RSizedBox(height: 12),
        Expanded(
          child: LayoutBuilder(
            builder: (context, __) {
              if (searchStates is FetchNewsLoadingState) {
                return const NewsListShimmer();
              } else {
                return const NewsSearchListView();
              }
            },
          ),
        ),
      ],
    );
  }
}
