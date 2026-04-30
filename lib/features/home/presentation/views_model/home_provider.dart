import 'package:news_app/core/utils/constants/app_images.dart';
import 'package:news_app/features/home/data/models/home_card_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_provider.g.dart';

@riverpod
List<HomeCardModel> home(ref) {
  return const [
    HomeCardModel(
      cardName: "General",
      cardImageLight: AppImages.generalLight,
      cardImageDark: AppImages.generalDark,
    ),
    HomeCardModel(
      cardName: "Business",
      cardImageLight: AppImages.busniessLight,
      cardImageDark: AppImages.busniessDark,
    ),
    HomeCardModel(
      cardName: "Sports",
      cardImageLight: AppImages.sportLight,
      cardImageDark: AppImages.sportDark,
    ),

    HomeCardModel(
      cardName: "Health",
      cardImageLight: AppImages.healthLight,
      cardImageDark: AppImages.healthDark,
    ),
    HomeCardModel(
      cardName: "Science",
      cardImageLight: AppImages.scienceLight,
      cardImageDark: AppImages.scienceDark,
    ),
    HomeCardModel(
      cardName: "Technology",
      cardImageLight: AppImages.technologyLight,
      cardImageDark: AppImages.technologyDark,
    ),
    HomeCardModel(
      cardName: "Entertainment",
      cardImageLight: AppImages.entertainmentLight,
      cardImageDark: AppImages.entertainmentDark,
    ),
  ];
}
