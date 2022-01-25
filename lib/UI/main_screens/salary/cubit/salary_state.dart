// ignore_for_file: must_be_immutable

part of 'salary_cubit.dart';

abstract class SalaryState {}

class SalaryInitial extends SalaryState {}

class SalaryLoading extends SalaryState {}

class SalarySuccess extends SalaryState {}

class UpdateCurrentDateState extends SalaryState {}

class SalaryError extends SalaryState {
  String? msg;
}
