// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/news/data/data_sources/remote_data/news_remote_data.dart'
    as _i405;
import '../../features/news/data/data_sources/remote_data/news_remote_data_impl.dart'
    as _i1011;
import '../../features/news/data/repositories/news_repository_impl.dart'
    as _i164;
import '../../features/news/domain/repositories/news_repository.dart' as _i258;
import '../../features/search/data/data_sources/remote_data/search_remote_data.dart'
    as _i533;
import '../../features/search/data/data_sources/remote_data/search_remote_data_impl.dart'
    as _i1002;
import '../../features/search/data/repositories/search_repository_impl.dart'
    as _i1017;
import '../../features/search/domain/repositories/search_repository.dart'
    as _i357;
import '../utils/services/api_service.dart' as _i671;
import 'dio_module.dart' as _i1045;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.singleton<_i361.Dio>(() => dioModule.dio);
    gh.singleton<_i671.ApiService>(() => _i671.ApiService(gh<_i361.Dio>()));
    gh.factory<_i405.NewsRemoteData>(
      () => _i1011.NewsRemoteDataImpl(apiService: gh<_i671.ApiService>()),
    );
    gh.factory<_i533.SearchRemoteData>(
      () => _i1002.SearchRemoteDataImpl(apiService: gh<_i671.ApiService>()),
    );
    gh.factory<_i357.SearchRepository>(
      () => _i1017.SearchRepositoryImpl(
        searchRemoteData: gh<_i533.SearchRemoteData>(),
      ),
    );
    gh.factory<_i258.NewsRepository>(
      () =>
          _i164.NewsRepositoryImpl(newsRemoteData: gh<_i405.NewsRemoteData>()),
    );
    return this;
  }
}

class _$DioModule extends _i1045.DioModule {}
