part of 'leaves_cubit.dart';

@immutable
abstract class LeavesState {}

class LeavesInitial extends LeavesState {}

class LeavesLoading extends LeavesState {}

class LeavesSuccess extends LeavesState {}

class LeavesError extends LeavesState {}
