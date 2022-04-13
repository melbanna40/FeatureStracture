part of 'login_cubit.dart';

abstract class LoginState {
  const LoginState();
  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {
  const LoginLoading();
}

class LoginSuccessful extends LoginState {
  final User user;

  const LoginSuccessful(this.user);
}

class LoginFailed extends LoginState {
  final String message;
  const LoginFailed(this.message);
}
