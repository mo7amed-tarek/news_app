import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/core/utils/constants/api_key.dart';

@module
abstract class DioModule {
  @singleton
  Dio get dio => Dio(
        BaseOptions(
          baseUrl: "https://newsapi.org/v2",
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
          },
          queryParameters: {"apiKey": ApiKeys.newsApi},
        ),
      );
}
