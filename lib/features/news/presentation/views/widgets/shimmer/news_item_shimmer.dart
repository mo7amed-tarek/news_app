import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/shimmer/shimmer_effect.dart';

class NewsItemShimmer extends StatelessWidget {
  const NewsItemShimmer({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: REdgeInsets.symmetric(horizontal: 4),
      padding: REdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(
            context,
          ).colorScheme.inversePrimary.withValues(alpha: 0.6),
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(
              context,
            ).colorScheme.inversePrimary.withValues(alpha: 0.8),
            blurStyle: BlurStyle.outer,
            blurRadius: 4.r,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: ShimmerEffect(
              radius: 8.r,
              width: ScreenUtil().screenWidth,
              height: 220.h,
            ),
          ),
          const RSizedBox(height: 10),
          ShimmerEffect(width: 180.w, height: 12.h),
          const RSizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(child: ShimmerEffect(width: 12, height: 12.h)),
              const RSizedBox(width: 16),
              ShimmerEffect(width: 84.w, height: 12.h),
            ],
          ),
        ],
      ),
    );
  }
}
