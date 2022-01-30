import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafey/CommonUtils/common_utils.dart';
import 'package:kafey/CommonUtils/image_utils.dart';
import 'package:kafey/UI/User/change_password/cubit/change_password_cubit.dart';
import 'package:kafey/generated/l10n.dart';
import 'package:kafey/res/gaps.dart';
import 'package:kafey/res/m_colors.dart';

class ChangePasswordScreen extends StatelessWidget {
  final String user_id;
  final String tenant_id;

  ChangePasswordScreen(this.user_id, this.tenant_id);

  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
        builder: (context, state) {
      final cubit = BlocProvider.of<ChangePasswordCubit>(context);
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
                          ImageUtils.getImagePath('ic_kafey_logo'),
                          width: 150,
                          height: 150,
                        )),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        TextFormField(
                          obscureText: cubit.oldPasswordVisibility,
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  cubit.updatePasswordVisibility();
                                },
                                child: Icon(cubit.oldPasswordVisibility
                                    ? CupertinoIcons.eye
                                    : CupertinoIcons.eye_slash)),
                            label: Text(S.of(context).password),
                            hintText: S.of(context).password,
                            prefixIcon: Icon(CupertinoIcons.lock_shield),
                          ),
                          controller: _oldPasswordController,
                        ),
                        Gaps.vGap12,
                        TextFormField(
                          obscureText: cubit.newPasswordVisibility,
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  cubit.updateNewPasswordVisibility();
                                },
                                child: Icon(cubit.newPasswordVisibility
                                    ? CupertinoIcons.eye
                                    : CupertinoIcons.eye_slash)),
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
                                right: Radius.circular(8)),
                          ),
                          child: MaterialButton(
                              child: Text(
                                S.of(context).submit,
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () async {
                                if (_oldPasswordController.text.isEmpty) {
                                  CommonUtils.showToastMessage(
                                      'ادخل الرقم السري');
                                } else if (_newPasswordController
                                    .text.isEmpty) {
                                  CommonUtils.showToastMessage(
                                      'ادخل الرقم السري التأكيدي');
                                } else if (_newPasswordController.text.length <
                                    6) {
                                  CommonUtils.showToastMessage(
                                      'الرقم السري يجب ان لا يقل عن 6 احرف');
                                } else if (_newPasswordController.text.trim() !=
                                    _oldPasswordController.text.trim()) {
                                  CommonUtils.showToastMessage(
                                      'الرقم السري غير متطابق');
                                } else {
                                  cubit.doChangePassword(
                                      _newPasswordController.text, user_id, tenant_id);
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
}
