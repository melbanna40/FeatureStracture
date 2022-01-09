part of 'attendance_cubit.dart';

abstract class AttendanceState {
  const AttendanceState();
}

class AttendanceInitial extends AttendanceState {}

class AttendanceLoading extends AttendanceState {}

class AttendanceSuccess extends AttendanceState {}

class AttendanceError extends AttendanceState {}
