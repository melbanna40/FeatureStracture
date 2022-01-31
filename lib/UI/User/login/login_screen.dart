import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafey/CommonUtils/common_utils.dart';
import 'package:kafey/CommonUtils/image_utils.dart';
import 'package:kafey/generated/l10n.dart';
import 'package:kafey/res/gaps.dart';
import 'package:kafey/res/m_colors.dart';

import 'cubit/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final _phoneController = TextEditingController();
  final _companyDomainController = TextEditingController();
  final _passwordController = TextEditingController();

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
                              label: Text(S.of(context).company_domain),
                              hintText: S.of(context).company_domain,
                              prefixIcon: Icon(Icons.add_business)),
                          controller: _companyDomainController,
                        ),
                        Gaps.vGap12,
                        TextFormField(
                          decoration: InputDecoration(
                              label: Text(S.of(context).phoneNumber),
                              suffixIcon:  CountryCodePicker(
                                hideMainText: true,
                                // showFlag: false,
                                onChanged: (val) {
                                  cubit.countryCode = val.dialCode;
                                },

                                // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                                initialSelection: '+966',

                                countryFilter: const [
                                  '+20',
                                  '+966',
                                  // '+212',
                                  // '+971',
                                  // '+973',
                                  // '+968',
                                  // '+965',
                                  // '+962',
                                  // '+963',
                                  // '+216',
                                  // '+218',
                                  // '+970',
                                  // '+213',
                                  // '+222',
                                  // '+961',
                                  // '+249',
                                  // '+964',
                                  // '+967',
                                  // '+253',
                                  // '+252',
                                  // '+269',

                                ],
                                showCountryOnly: false,
                                showOnlyCountryWhenClosed: false,
                                alignLeft: false,
                                onInit: (val) {
                                  cubit.countryCode = val!.dialCode;
                                },
                              ),
                              hintText: S.of(context).phoneNumber,
                              prefixIcon:
                                  Icon(CupertinoIcons.person_alt_circle)),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          controller: _phoneController,
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
                                if (_phoneController.text.isEmpty) {
                                  CommonUtils.showToastMessage('Enter Email');
                                } else if (_passwordController.text.isEmpty) {
                                  CommonUtils.showToastMessage(
                                      'Enter Password');
                                } else if (_passwordController.text.length <
                                    6) {
                                  CommonUtils.showToastMessage(
                                      'Password length must be 8 letters contains upper&lower case');
                                } else {
                                  cubit.doServerLogin(
                                    // "${cubit.countryCode}"
                                        "${_phoneController.text}",
                                      _passwordController.text,
                                      _companyDomainController.text);
                                }
                              }),
                        ),
                        Gaps.vGap12,
                        // InkWell(
                        //   onTap: () {
                        //     Get.to(() => ForgetPasswordScreen());
                        //   },
                        //   child: Text(
                        //     S.of(context).new_employee,
                        //     style: TextStyle(color: Colors.blue),
                        //   ),
                        // ),
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
    _phoneController.clear();
  }
}
