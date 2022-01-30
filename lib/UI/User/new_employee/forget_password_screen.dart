import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafey/CommonUtils/common_utils.dart';
import 'package:kafey/CommonUtils/image_utils.dart';
 import 'package:kafey/generated/l10n.dart';
import 'package:kafey/res/gaps.dart';
import 'package:kafey/res/m_colors.dart';

import 'cubit/forget_password_cubit.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);
  final _emailNumberController = TextEditingController();
  final  emailFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
        builder: (context, state) {
      final cubit = BlocProvider.of<ForgetPasswordCubit>(context);
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
                        controller: _emailNumberController,
                        decoration: InputDecoration(
                            label: Text(S.of(context).email),
                            hintText: S.of(context).email,
                            prefixIcon: Icon(CupertinoIcons.person_alt_circle)),
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
                              S.of(context).login,
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              if (_emailNumberController.text.isEmpty) {
                                CommonUtils.showToastMessage(
                                    S.of(context).empty_data);
                              } else {
                                cubit
                                    .doServerLogin(_emailNumberController.text);
                              }
                            }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  onDispose() {
    _emailNumberController.clear();
  }
}
