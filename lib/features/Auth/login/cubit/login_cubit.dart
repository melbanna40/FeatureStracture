import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

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
  late LoginObscurePassword _obscurePasswordCash;

  bool get obscure => _obscure;
  LoginObscurePassword get obscurePasswordCash => _obscurePasswordCash;

  void obscurePassword() {
    _obscure = !_obscure;
    if (_obscure == false) {
      _obscurePasswordCash = LoginObscurePassword(
          obscure: _obscure, icon: CupertinoIcons.eye);
      emit(_obscurePasswordCash);
    } else {
      _obscurePasswordCash = LoginObscurePassword(
          obscure: _obscure, icon: CupertinoIcons.eye_slash);
      emit(_obscurePasswordCash);
    }
  }

}
