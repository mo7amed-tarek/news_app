import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/core/di/di.dart';
import 'package:news_app/features/news/domain/repositories/news_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'news_providers.g.dart';

@riverpod
NewsRepository newsRepository(Ref ref) {
  return getIt<NewsRepository>();
}
