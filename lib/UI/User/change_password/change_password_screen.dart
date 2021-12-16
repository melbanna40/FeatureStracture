import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafey/CommonUtils/common_utils.dart';
import 'package:kafey/UI/User/login/cubit/login_cubit.dart';
import 'package:kafey/generated/l10n.dart';
import 'package:kafey/res/gaps.dart';
import 'package:kafey/res/m_colors.dart';

class ChangePasswordScreen extends StatelessWidget {
  String deviceId;
  String userToken;

  ChangePasswordScreen(this.deviceId, this.userToken);

  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
      final cubit = BlocProvider.of<LoginCubit>(context);
      return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  Gaps.vGap12,
                  Expanded(
                    flex: 1,
                    child: Container(
                        margin: const EdgeInsets.all(10),
                        child: Image.asset(
                          "assets/images/ic_logo.png",
                          width: 150,
                          height: 150,
                        )),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            label: Text(S.of(context).old_password),
                            hintText: S.of(context).old_password,
                            prefixIcon: Icon(CupertinoIcons.lock_shield),
                          ),
                          controller: _oldPasswordController,
                        ),
                        Gaps.vGap12,
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            label: Text(S.of(context).confirm_password),
                            hintText: S.of(context).confirm_password,
                            prefixIcon: Icon(CupertinoIcons.lock_shield),
                          ),
                          controller: _newPasswordController,
                        ),
                        Gaps.vGap30,
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: MColors.colorPrimarySwatch,
                              borderRadius: const BorderRadius.horizontal(
                                  left: Radius.circular(8),
                                  right: Radius.circular(8))),
                          child: MaterialButton(
                              child: Text(
                                S.of(context).submit,
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () async {
                                if (_oldPasswordController.text.isEmpty) {
                                  CommonUtils.showToastMessage(
                                      'Enter Old Password');
                                } else if (_newPasswordController
                                    .text.isEmpty) {
                                  CommonUtils.showToastMessage(
                                      'Enter New Password');
                                } else if (_newPasswordController.text.length <
                                    4) {
                                  CommonUtils.showToastMessage(
                                      'Password length must be 8 letters contains upper&lower case');
                                } else {
                                  cubit.doChangePassword(
                                      _oldPasswordController.text,
                                      _newPasswordController.text,
                                      deviceId,
                                      userToken);
                                }
                              }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      );
    });
  }

  onDispose() {
    _oldPasswordController.clear();
  }
}
