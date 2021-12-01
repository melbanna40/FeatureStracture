// ignore_for_file: must_be_immutable

part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {}

class UpdateCurrentDateState extends HomeState {}

class HomeError extends HomeState {
  String? msg;
}
