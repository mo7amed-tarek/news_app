import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/home/presentation/views/widgets/left_content_container.dart';
import 'package:news_app/features/home/presentation/views/widgets/right_content_container.dart';
import 'package:news_app/features/home/presentation/views_model/home_provider.dart';

class HomeCardsList extends ConsumerWidget {
  const HomeCardsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardsList = ref.read(homeProvider);
    return SliverList.separated(
      itemBuilder: (_, index) => index.isEven
          ? RightContentContainer(cardData: cardsList[index])
          : LeftContentContainer(cardData: cardsList[index]),
      separatorBuilder: (_, __) => const RSizedBox(height: 16),
      itemCount: cardsList.length,
    );
  }
}
