part of 'main_cubit.dart';

@immutable
abstract class MainState {}

class MainInitial extends MainState {}

class MainLoadingState extends MainState {}

class MainSuccessState extends MainState {}

class MainErrorState extends MainState {}

class MainBottomNavState extends MainState {}
