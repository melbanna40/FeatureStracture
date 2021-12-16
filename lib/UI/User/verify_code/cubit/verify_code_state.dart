part of 'verify_phone_cubit.dart';

@immutable
abstract class VerifyCodeState {}

class VerifyPhoneInitial extends VerifyCodeState {}
class VerifyPhoneLoadingState extends VerifyCodeState {}
class VerifyPhoneSuccessState extends VerifyCodeState {}
class VerifyPhoneErrorState extends VerifyCodeState {}
