import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/core/router/route_names.dart';
import 'package:news_app/core/utils/constants/app_colors.dart';
import 'package:news_app/core/utils/constants/app_icons.dart';
import 'package:news_app/core/utils/constants/app_text.dart';
import 'package:news_app/core/utils/shimmer/shimmer_effect.dart';
import 'package:news_app/features/home/data/models/home_card_model.dart';

class LeftContentContainer extends ConsumerWidget {
  const LeftContentContainer({super.key, required this.cardData});
  final HomeCardModel cardData;
  @override
  Widget build(BuildContext context, ref) {
    final bool isDarkMode =
        Theme.of(context).colorScheme.brightness == Brightness.dark;
    return GestureDetector(
      onTap: () {
        Navigator.of(
          context,
        ).pushNamed(RouteNames.news, arguments: cardData.cardName);
      },
      child: RPadding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          width: ScreenUtil().screenWidth,
          height: 198.h,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(24.r)),
          child: Stack(
            alignment: AlignmentDirectional.centerStart,
            children: [
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24.r),
                  child: Image.asset(
                    isDarkMode
                        ? cardData.cardImageLight
                        : cardData.cardImageDark,
                    fit: BoxFit.cover,
                    frameBuilder:
                        (context, child, frame, wasSynchronouslyLoaded) {
                          if (frame != null) {
                            return child;
                          } else {
                            return ShimmerEffect(
                              width: ScreenUtil().screenWidth,
                              height: 198.h,
                            );
                          }
                        },
                  ),
                ),
              ),
              Padding(
                padding: REdgeInsetsDirectional.only(start: 16, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(flex: 2),
                    Padding(
                      padding: REdgeInsetsDirectional.only(start: 12),
                      child: Text(
                        cardData.cardName,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ),
                    const Spacer(flex: 3),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.gray,
                        borderRadius: BorderRadius.circular(84.r),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 54.r,
                            height: 54.r,
                            padding: REdgeInsets.all(15.r),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              shape: BoxShape.circle,
                            ),
                            child: SvgPicture.asset(
                              isDarkMode
                                  ? AppIcons.arrowLeftDark
                                  : AppIcons.arrowLeftLight,
                              width: 24.r,
                              height: 24.r,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: REdgeInsetsDirectional.only(
                              start: 8,
                              end: 16,
                              bottom: 8,
                              top: 8,
                            ),
                            child: Text(
                              AppText.viewAll,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
