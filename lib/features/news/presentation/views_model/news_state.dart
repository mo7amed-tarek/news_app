import 'package:news_app/core/utils/exceptions/failure.dart';

class NewsState {}

final class NewsInitialState extends NewsState {}

final class FetchNewsSuccessState extends NewsState {}

final class FetchNewsLoadingState extends NewsState {}

final class FetchNewsFailureState extends NewsState {
  FetchNewsFailureState({required this.error});
  final Failure error;
}

final class OpenUrlSuccessState extends NewsState {}

final class OpenUrlLoadingState extends NewsState {}

final class OpenUrlFailureState extends NewsState {
  OpenUrlFailureState({required this.error});
  final Failure error;
}
