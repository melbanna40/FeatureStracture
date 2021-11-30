import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:cubit_template/CommonUtils/image_utils.dart';
import 'package:cubit_template/generated/l10n.dart';
import 'package:cubit_template/res/gaps.dart';
import 'package:cubit_template/res/m_colors.dart';

import 'cubit/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final _phoneNumberController = TextEditingController();
  final phoneFocusNode = FocusNode();


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
      final cubit = BlocProvider.of<LoginCubit>(context);
      return Scaffold(
        backgroundColor: Colors.white,
          body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Gaps.vGap12,
              Container(
                  margin: const EdgeInsets.all(10),
                  child: Image.asset(
                    ImageUtils.getImagePath('final_logo'),
                    width: 100,
                    height: 100,
                  )),
              Row(
                children: [
                  CountryCodePicker(
                    onChanged: (val) {
                      cubit.countryCode = val.dialCode;
                    },

                    // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                    initialSelection: '+966',

                    countryFilter: const [
                      // '+20',
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
                  Expanded(
                    child: TextFormField(
                      controller: _phoneNumberController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          suffixIcon: const Icon(CupertinoIcons.phone_solid),
                          errorBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                              borderSide:
                                  BorderSide(color: Colors.red, width: 1)),
                          focusedErrorBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(50),
                                right: Radius.circular(50),
                              ),
                              borderSide:
                                  BorderSide(color: Colors.red, width: 1)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.horizontal(
                                left: Radius.circular(50),
                                right: Radius.circular(50),
                              ),
                              borderSide: BorderSide(
                                  color: MColors.colorPrimarySwatch, width: 1)),
                          enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(50),
                                right: Radius.circular(50),
                              ),
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 1,
                              )),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(50),
                              right: Radius.circular(50),
                            ),
                          ),
                          labelText: S.of(context).phoneNumber,
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 8.0)),
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(30),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      // initialValue: phone,
                      validator: (text) {
                        if (text!.isEmpty) {
                          return S.of(context).phoneIsRequired;
                        }
                        if (text.length < 9) {
                          return S.of(context).phoneIsTooShort;
                        }
                        return null;
                      },
                      autofocus: false,
                      focusNode: phoneFocusNode,
                      textInputAction: TextInputAction.next,
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        FocusScope.of(context).requestFocus(phoneFocusNode);
                      },
                    ),
                  ),
                ],
              ),
              Gaps.vGap30,
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: MColors.colorPrimarySwatch,
                    borderRadius: const BorderRadius.horizontal(
                        left: Radius.circular(50), right: Radius.circular(50))),
                child: MaterialButton(
                    child: Text(S.of(context).login),
                    onPressed: () {
                      if (_phoneNumberController.text.length > 8) {
                        cubit.postCheckPhone(_phoneNumberController.text);
                      } else {
                        Get.snackbar(
                          Get.locale == const Locale('ar')
                              ? "تأكد من ادخال رقم صحيح"
                              : "check your phone number",
                          "",
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      }
                    }),
              )
            ],
          ),
        ),
      ));
    });
  }

  onDispose(){
    _phoneNumberController.clear();

  }
}
