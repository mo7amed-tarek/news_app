import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/shimmer/shimmer_effect.dart';
import 'package:news_app/features/news/data/models/article/article_model.dart';
import 'package:news_app/features/news/presentation/views/widgets/news_details_sheet_content.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  const NewsItem({super.key, required this.articleData});
  final ArticleModel articleData;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          builder: (_) => NewsDetailsSheetContent(articleData: articleData),
        );
      },
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
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
              child: CachedNetworkImage(
                imageUrl: articleData.urlToImage ?? "",
                width: ScreenUtil().screenWidth,
                height: 220.h,
                fit: BoxFit.cover,
                progressIndicatorBuilder: (context, url, progress) =>
                    ShimmerEffect(
                      width: ScreenUtil().screenWidth,
                      height: 220.h,
                    ),
                errorWidget: (context, url, error) =>
                    const Icon(Icons.info_outline, color: Colors.red),
              ),
            ),
            const RSizedBox(height: 10),
            Text(
              articleData.title ?? "No Title",
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(letterSpacing: 0.22),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const RSizedBox(height: 10),
            Visibility(
              visible: articleData.author != null,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Text(
                      "By : ${articleData.author}",
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(letterSpacing: 0.22),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const RSizedBox(width: 16),
                  RSizedBox(
                    width: 84,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        timeago.format(
                          DateTime.parse(articleData.publishedAt ?? ""),
                        ),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
