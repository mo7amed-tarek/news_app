import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/core/utils/constants/api_key.dart';

import 'package:news_app/core/utils/exceptions/dio_exceptions.dart';
import 'package:news_app/core/utils/exceptions/failure.dart';

@singleton
class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  // GET Request
  Future<Either<Failure, Response>> getRequest({
    required String endpoint,
    Map<String, dynamic>? queryParams,
    Map<String, String>? headers,
  }) async {
    try {
      Response response = await _dio.get(
        endpoint,
        queryParameters: queryParams,
        options: Options(headers: headers),
      );
      return right(response);
    } catch (error) {
      return left(DioExceptions.handleError(error));
    }
  }
}
