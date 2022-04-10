import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

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
  late SignupObscurePassword _obscurePasswordCash;

  bool get obscure => _obscure;
  SignupObscurePassword get obscurePasswordCash => _obscurePasswordCash;

  void obscurePassword() {
    _obscure = !_obscure;
    if (_obscure == false) {
      _obscurePasswordCash = SignupObscurePassword(
          obscure: _obscure, icon: CupertinoIcons.eye);
      emit(_obscurePasswordCash);
    } else {
      _obscurePasswordCash = SignupObscurePassword(
          obscure: _obscure, icon: CupertinoIcons.eye_slash);
      emit(_obscurePasswordCash);
    }
  }

}
