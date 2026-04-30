import 'package:news_app/core/utils/exceptions/failure.dart';

sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class FetchNewsSuccessState extends SearchState {}

final class FetchNewsLoadingState extends SearchState {}

final class FetchNewsFailureState extends SearchState {
  FetchNewsFailureState({required this.error});
  final Failure error;
}

final class FetchNewPageNewsLoadingState extends SearchState {}
