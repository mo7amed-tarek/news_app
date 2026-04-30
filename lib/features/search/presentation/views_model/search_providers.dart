import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/core/di/di.dart';
import 'package:news_app/features/search/domain/repositories/search_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_providers.g.dart';

@riverpod
SearchRepository searchRepository(Ref ref) {
  return getIt<SearchRepository>();
}
