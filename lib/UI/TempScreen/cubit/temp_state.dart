// ignore_for_file: must_be_immutable

part of 'temp_cubit.dart';

@immutable
abstract class TempState {}

class TempInitial extends TempState {}

class TempLoading extends TempState {}

class TempSuccess extends TempState {}

class TempError extends TempState {
  String? msg;
}
