part of 'home_cubit.dart';

abstract class HomeState {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {
  const HomeInitial();
}

class HomeLoading extends HomeState {
  const HomeLoading();
}

class HomeLoaded extends HomeState {
  final Home? homeModel;

  const HomeLoaded(this.homeModel);
}

class HomeFailure extends HomeState {
  final String failureMessage;

  const HomeFailure(this.failureMessage);
}
