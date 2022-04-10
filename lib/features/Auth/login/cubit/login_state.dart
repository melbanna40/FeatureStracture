part of 'login_cubit.dart';

@immutable
abstract class LoginState {
  const LoginState();
}

class LoginInitial extends LoginState {}

class ShowOnImagePickedSuccess extends LoginState {
  final XFile selectedFile;

  const ShowOnImagePickedSuccess(this.selectedFile);
}

class ShowOnImagePickedError extends LoginState {}

class LoginObscurePassword extends LoginState {
  final bool obscure;
  final IconData icon;

  const LoginObscurePassword({required this.obscure, required this.icon});
}
