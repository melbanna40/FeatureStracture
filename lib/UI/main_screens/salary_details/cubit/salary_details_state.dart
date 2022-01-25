part of 'salary_details_cubit.dart';

abstract class SalaryDetailsState {
  const SalaryDetailsState();
}

class SalaryDetailsInitial extends SalaryDetailsState {}

class SalaryDetailsLoading extends SalaryDetailsState {}

class SalaryDetailsSuccess extends SalaryDetailsState {}

class SalaryDetailsError extends SalaryDetailsState {}
