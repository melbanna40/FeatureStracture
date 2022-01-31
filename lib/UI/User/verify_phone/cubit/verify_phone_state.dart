part of 'verify_phone_cubit.dart';

@immutable
abstract class VerifyPhoneState {}

class VerifyPhoneInitial extends VerifyPhoneState {}
class VerifyPhoneLoadingState extends VerifyPhoneState {}
class VerifyPhoneSuccessState extends VerifyPhoneState {}
class VerifyPhoneErrorState extends VerifyPhoneState {}
