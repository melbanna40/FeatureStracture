import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileInitial());

  void onImagePickerClicked() async {
    try {
      final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.camera,
      );
      emit(ShowOnImagePickedSuccess(pickedFile!));
    } catch (e) {
      emit(ShowOnImagePickedError());
    }
  }

  bool _obscure = false;
  late EditProfileObscurePassword _obscurePasswordCash;

  bool get obscure => _obscure;
  EditProfileObscurePassword get obscurePasswordCash => _obscurePasswordCash;

  void obscurePassword() {
    _obscure = !_obscure;
    if (_obscure == false) {
      _obscurePasswordCash = EditProfileObscurePassword(
          obscure: _obscure, icon: CupertinoIcons.eye);
      emit(_obscurePasswordCash);
    } else {
      _obscurePasswordCash = EditProfileObscurePassword(
          obscure: _obscure, icon: CupertinoIcons.eye_slash);
      emit(_obscurePasswordCash);
    }
  }

}
