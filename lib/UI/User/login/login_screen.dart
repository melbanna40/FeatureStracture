import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:kafey/CommonUtils/common_utils.dart';
import 'package:kafey/CommonUtils/image_utils.dart';
import 'package:kafey/UI/User/forget_password/forget_password_screen.dart';
import 'package:kafey/generated/l10n.dart';
import 'package:kafey/res/gaps.dart';
import 'package:kafey/res/m_colors.dart';

import 'cubit/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? deviceId;

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
                          decoration: InputDecoration(
                              label: Text(S.of(context).email),
                              hintText: S.of(context).email,
                              prefixIcon:
                                  Icon(CupertinoIcons.person_alt_circle)),
                          controller: _emailController,
                        ),
                        Gaps.vGap12,
                        TextFormField(
                          obscureText: cubit.passwordVisibility,
                          decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                  onTap: () {
                                    cubit.updatePasswordVisibility();
                                  },
                                  child: Icon(cubit.passwordVisibility
                                      ? CupertinoIcons.eye
                                      : CupertinoIcons.eye_slash)),
                              label: Text(S.of(context).password),
                              hintText: S.of(context).password,
                              prefixIcon: Icon(CupertinoIcons.lock_shield)),
                          controller: _passwordController,
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
                              onPressed: () async {
                                await CommonUtils.getDeviceId()
                                    .then((value) => deviceId = value);
                                if (_emailController.text.isEmpty) {
                                  CommonUtils.showToastMessage('Enter Email');
                                } else if (_passwordController.text.isEmpty) {
                                  CommonUtils.showToastMessage(
                                      'Enter Password');
                                } else if (_passwordController.text.length <
                                    4) {
                                  CommonUtils.showToastMessage(
                                      'Password length must be 8 letters contains upper&lower case');
                                } else {
                                  cubit.doServerLogin(_emailController.text,
                                      _passwordController.text, deviceId!);
                                }
                              }),
                        ),
                        Gaps.vGap12,
                        InkWell(
                          onTap: () {
                            Get.to(() => ForgetPasswordScreen());
                          },
                          child: Text(
                            S.of(context).forget_password,
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Row(
                  //   children: [
                  //     CountryCodePicker(
                  //       onChanged: (val) {
                  //         cubit.countryCode = val.dialCode;
                  //       },
                  //
                  //       // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                  //       initialSelection: '+966',
                  //
                  //       countryFilter: const [
                  //         // '+20',
                  //         '+966',
                  //         // '+212',
                  //         // '+971',
                  //         // '+973',
                  //         // '+968',
                  //         // '+965',
                  //         // '+962',
                  //         // '+963',
                  //         // '+216',
                  //         // '+218',
                  //         // '+970',
                  //         // '+213',
                  //         // '+222',
                  //         // '+961',
                  //         // '+249',
                  //         // '+964',
                  //         // '+967',
                  //         // '+253',
                  //         // '+252',
                  //         // '+269',
                  //
                  //       ],
                  //       showCountryOnly: false,
                  //       showOnlyCountryWhenClosed: false,
                  //       alignLeft: false,
                  //       onInit: (val) {
                  //         cubit.countryCode = val!.dialCode;
                  //       },
                  //     ),
                  //     Expanded(
                  //       child: TextFormField(
                  //         controller: _phoneNumberController,
                  //         keyboardType: TextInputType.phone,
                  //         decoration: InputDecoration(
                  //             suffixIcon: const Icon(CupertinoIcons.phone_solid),
                  //             errorBorder: const OutlineInputBorder(
                  //                 borderRadius: BorderRadius.all(
                  //                   Radius.circular(8),
                  //                 ),
                  //                 borderSide:
                  //                     BorderSide(color: Colors.red, width: 1)),
                  //             focusedErrorBorder: const OutlineInputBorder(
                  //                 borderRadius: BorderRadius.horizontal(
                  //                   left: Radius.circular(50),
                  //                   right: Radius.circular(50),
                  //                 ),
                  //                 borderSide:
                  //                     BorderSide(color: Colors.red, width: 1)),
                  //             focusedBorder: OutlineInputBorder(
                  //                 borderRadius: const BorderRadius.horizontal(
                  //                   left: Radius.circular(50),
                  //                   right: Radius.circular(50),
                  //                 ),
                  //                 borderSide: BorderSide(
                  //                     color: MColors.colorPrimarySwatch, width: 1)),
                  //             enabledBorder: const OutlineInputBorder(
                  //                 borderRadius: BorderRadius.horizontal(
                  //                   left: Radius.circular(50),
                  //                   right: Radius.circular(50),
                  //                 ),
                  //                 borderSide: BorderSide(
                  //                   color: Colors.grey,
                  //                   width: 1,
                  //                 )),
                  //             border: const OutlineInputBorder(
                  //               borderSide: BorderSide(color: Colors.grey),
                  //               borderRadius: BorderRadius.horizontal(
                  //                 left: Radius.circular(50),
                  //                 right: Radius.circular(50),
                  //               ),
                  //             ),
                  //             labelText: S.of(context).phoneNumber,
                  //             contentPadding:
                  //                 const EdgeInsets.symmetric(horizontal: 8.0)),
                  //         inputFormatters: [
                  //           LengthLimitingTextInputFormatter(30),
                  //           FilteringTextInputFormatter.digitsOnly,
                  //         ],
                  //         // initialValue: phone,
                  //         validator: (text) {
                  //           if (text!.isEmpty) {
                  //             return S.of(context).phoneIsRequired;
                  //           }
                  //           if (text.length < 9) {
                  //             return S.of(context).phoneIsTooShort;
                  //           }
                  //           return null;
                  //         },
                  //         autofocus: false,
                  //         focusNode: phoneFocusNode,
                  //         textInputAction: TextInputAction.next,
                  //         onTap: () {
                  //           FocusScope.of(context).unfocus();
                  //           FocusScope.of(context).requestFocus(phoneFocusNode);
                  //         },
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            )),
      );
    });
  }

  onDispose() {
    _emailController.clear();
  }
}
