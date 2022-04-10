part of 'signup_cubit.dart';

@immutable
abstract class SignupState {
  const SignupState();
}

class SignupInitial extends SignupState {}

class ShowOnImagePickedSuccess extends SignupState {
  final XFile selectedFile;

  const ShowOnImagePickedSuccess(this.selectedFile);
}

class ShowOnImagePickedError extends SignupState {}

class SignupObscurePassword extends SignupState {
  final bool obscure;
  final IconData icon;

  const SignupObscurePassword({required this.obscure, required this.icon});
}
