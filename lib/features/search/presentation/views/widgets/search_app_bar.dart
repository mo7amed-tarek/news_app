import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/core/utils/constants/app_icons.dart';
import 'package:news_app/core/utils/constants/app_text.dart';
import 'package:news_app/features/search/presentation/views_model/search_notifier.dart';

class SearchAppBar extends ConsumerWidget {
  const SearchAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isDarkMode =
        Theme.of(context).colorScheme.brightness == Brightness.dark;
    final searchProvider = ref.read(searchNotifierProvider.notifier);
    return Row(
      children: [
        const BackButton(),
        Expanded(
          child: Padding(
            padding: const EdgeInsetsDirectional.only(end: 16),
            child: TextField(
              controller: searchProvider.searchController,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                prefixIcon: Padding(
                  padding: REdgeInsetsDirectional.only(start: 16, end: 8),
                  child: SvgPicture.asset(
                    isDarkMode ? AppIcons.searchDark : AppIcons.searchLight,
                    width: 24.r,
                    height: 24.r,
                  ),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    searchProvider.resetSearchData();
                  },
                  icon: SvgPicture.asset(
                    isDarkMode ? AppIcons.clearLight : AppIcons.clearDark,
                    width: 24.r,
                    height: 24.r,
                  ),
                ),
                hint: Text(
                  AppText.search,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              ),
              textInputAction: TextInputAction.search,
              onSubmitted: (value) {
                searchProvider.resetNewsList();
                searchProvider.fetchSearchedNews(searchInWord: value);
              },
            ),
          ),
        ),
      ],
    );
  }
}
