import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/shimmer/shimmer_effect.dart';

class CategoriesSliverTabBarShimmer extends StatelessWidget {
  const CategoriesSliverTabBarShimmer({super.key});

  @override
  Widget build(BuildContext context) {
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
            indicatorColor: Theme.of(context).colorScheme.inversePrimary,
            tabs: [
              Tab(
                child: ShimmerEffect(width: 40.w, height: 12.h, radius: 24.r),
              ),
              Tab(
                child: ShimmerEffect(width: 40.w, height: 12.h, radius: 24.r),
              ),
              Tab(
                child: ShimmerEffect(width: 40.w, height: 12.h, radius: 24.r),
              ),
              Tab(
                child: ShimmerEffect(width: 40.w, height: 12.h, radius: 24.r),
              ),
              Tab(
                child: ShimmerEffect(width: 40.w, height: 12.h, radius: 24.r),
              ),
              Tab(
                child: ShimmerEffect(width: 40.w, height: 12.h, radius: 24.r),
              ),
              Tab(
                child: ShimmerEffect(width: 40.w, height: 12.h, radius: 24.r),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
