import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/core/common_widgets/custom_elevated_button.dart';
import 'package:news_app/core/utils/constants/app_images.dart';
import 'package:news_app/core/utils/constants/app_text.dart';

class LottieErrorWidget extends StatelessWidget {
  const LottieErrorWidget({
    super.key,
    required this.errorMessage,
    required this.appBarTitle,
    this.onTryAgain,
  });
  final String errorMessage;
  final String appBarTitle;
  final void Function()? onTryAgain;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SafeArea(
          child: Row(
            children: [
              const BackButton(),
              Expanded(
                child: Padding(
                  padding: REdgeInsetsDirectional.only(end: 50),
                  child: Text(
                    appBarTitle,
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
        const RSizedBox(height: 42),
        Column(
          children: [
            Lottie.asset(
              AppImages.emptyNewsAnimation,
              width: ScreenUtil().screenWidth,
              fit: BoxFit.cover,
            ),
            Text(
              errorMessage,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const RSizedBox(height: 32),
            CustomElevatedButton(
              onPressed: onTryAgain,
              buttonTitle: AppText.tryAgain,
              width: ScreenUtil().screenWidth * 0.9,
              titleStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.22,
              ),
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            ),
          ],
        ),
      ],
    );
  }
}
