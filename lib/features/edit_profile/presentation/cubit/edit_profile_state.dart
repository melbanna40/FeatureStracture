part of 'edit_profile_cubit.dart';

@immutable
abstract class EditProfileState {
  const EditProfileState();
}

class EditProfileInitial extends EditProfileState {}

class ShowOnImagePickedSuccess extends EditProfileState {
  final XFile selectedFile;

  const ShowOnImagePickedSuccess(this.selectedFile);
}

class ShowOnImagePickedError extends EditProfileState {}

class EditProfileObscurePassword extends EditProfileState {
  final bool obscure;
  final IconData icon;

  const EditProfileObscurePassword({required this.obscure, required this.icon});
}
