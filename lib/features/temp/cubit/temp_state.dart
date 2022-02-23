part of 'temp_cubit.dart';

@immutable
abstract class TempState {
  const TempState();
}

class TempInitial extends TempState {}

class TempDataLoading extends TempState {
  const TempDataLoading();
}

class TempDataSuccessful extends TempState {
  final TempDataModelResource mResource;

  const TempDataSuccessful(this.mResource);
}

class TempDataFailed extends TempState {
  final String message;

  const TempDataFailed(this.message);
}
