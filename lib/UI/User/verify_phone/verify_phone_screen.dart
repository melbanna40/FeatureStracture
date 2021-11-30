import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:cubit_template/CommonUtils/common_utils.dart';
import 'package:cubit_template/Helpers/hivr_helper.dart';
import 'package:cubit_template/generated/l10n.dart';
import 'package:cubit_template/res/gaps.dart';

import 'cubit/verify_phone_cubit.dart';
import 'widgets/confirm_phone_custom_text_field.dart';

class VerifyPhoneScreen extends StatelessWidget {
  final String phone;

  VerifyPhoneScreen(this.phone, {Key? key}) : super(key: key);

  bool isShow = false,
      isFirstText = false,
      isSecondText = false,
      isThirdText = false,
      isFourText = false;
  String? firstText, secondText, thirdText, fourText;

  String? code;

  FocusNode? firstNode = FocusNode();
  FocusNode secondNode = FocusNode();
  FocusNode thirdNode = FocusNode();
  FocusNode fourNode = FocusNode();

  int currentSeconds = 0;
  bool isScreenOn = true;
  Timer? _timer;

  String get timerText =>
      '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';
  final int timerMaxSeconds = 60;

  @override
  Widget build(BuildContext context) {
    firstNode!.requestFocus();
    return BlocBuilder<VerifyPhoneCubit, VerifyPhoneState>(
        builder: (context, state) {
      final cubit = BlocProvider.of<VerifyPhoneCubit>(context);
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.14),
                child: Text(
                  S.of(context).enterVerificationCode,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Text(
                S.of(context).Enter_4_digit_code_sent_to_you_at + phone,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
              Directionality(
                textDirection: TextDirection.ltr,
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ConfirmPhoneCustomTextField(firstNode!, (text) {
                        isFirstText = text.length == 1;
                        firstText = text;
                        checkToSendRequest();
                        goNextNodeFocus(1, text.length);
                      }),
                      ConfirmPhoneCustomTextField(secondNode, (text) {
                        isSecondText = text.length == 1;
                        secondText = text;
                        goNextNodeFocus(2, text.length);
                        checkToSendRequest();
                      }),
                      ConfirmPhoneCustomTextField(thirdNode, (text) {
                        isThirdText = text.length == 1;
                        thirdText = text;
                        goNextNodeFocus(3, text.length);
                        checkToSendRequest();
                      }),
                      ConfirmPhoneCustomTextField(fourNode, (text) {
                        isFourText = text.length == 1;
                        fourText = text;
                        goNextNodeFocus(4, text.length);
                        checkToSendRequest();
                      })
                    ],
                  ),
                ),
              ),
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .01),
                  child: MaterialButton(
                    height: MediaQuery.of(context).size.height * .07,
                    minWidth: MediaQuery.of(context).size.width * 0.8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    color: Theme.of(context).primaryColor,
                    onPressed: () async {
                      if (isFirstText &&
                          isSecondText &&
                          isThirdText &&
                          isFourText) {
                        cubit.postLogin(context,
                            int.parse(phone), int.parse(checkToSendRequest()!));

                        // await Hive.box(HiveHelper.KEY_BOX_USER_RESPONSE).put(
                        //     HiveHelper.KEY_BOX_USER_RESPONSE,
                        //     cubit.model.userData!.seller!);
                      } else {

                        CommonUtils.showToastMessage(S.of(context).empty_data);
                      }

                      // Log.e(cubit.model.data!.phone.toString());
                      // Navigator.pushReplacement(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => MainScreen()));
                    },
                    child: Text(
                      S.of(context).continue_key,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * .045,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              Gaps.vGap16,
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .01),
                  child: MaterialButton(
                    height: MediaQuery.of(context).size.height * .07,
                    minWidth: MediaQuery.of(context).size.width * 0.8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    color: Colors.white,
                    onPressed: () {},
                    child: Text(
                      S.of(context).reSend,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: MediaQuery.of(context).size.width * .045,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  startTimeout([int? milliseconds]) {
    var duration = const Duration(seconds: 1);
    _timer = Timer.periodic(duration, (timer) {
      if (isScreenOn) {
        // setState(() {
        //   print(timer.tick);
        //   currentSeconds = timer.tick;
        //   if (currentSeconds == timerMaxSeconds) {
        //     isShow = true;
        //   }
        //   if (timer.tick >= timerMaxSeconds || !is_screen_on) {
        //     timer.cancel();
        //   }
        // });
      }
    });
  }

  String? checkToSendRequest() {
    if (isFirstText && isSecondText && isThirdText && isFourText) {
      code = "$firstText$secondText$thirdText$fourText";
      doVerify(code!);
      return code!;
    }
  }

  void doVerify(String code) {
    // FocusScope.of(context).unfocus();
    // if (widget.params!["source"] == Const.SOURCE_FORGET_PASSWORD) {
    //   mPresenter!.doVerifyCodeForgetPassword(widget.params!["email"], code);
    // } else if (widget.params!["source"] == Const.SOURCE_REGISTER) {
    //   mPresenter!.doVerifyCode(widget.params!["email"], code);
    // } else if (widget.params!["source"] == Const.SOURCE_LOGIN) {
    //   mPresenter!.doVerifyCode(widget.params!["email"], code);
    // }
  }

  void resendCode() {
    // if (widget.params["source"] == Const.SOURCE_FORGET_PASSWORD) {
    //   mPresenter.sendCodeForgetPassword(widget.params["email"]);
    // } else if (widget.params["source"] == Const.SOURCE_REGISTER ||
    //     widget.params["source"] == Const.SOURCE_LOGIN) {
    //   mPresenter.sendCodeRegister(widget.params["email"]);
    // }
  }

  void goNextNodeFocus(int numberText, int size) {
    switch (numberText) {
      case 1:
        if (size == 1) {
          secondNode.requestFocus();
        } else {
          firstNode!.requestFocus();
        }
        break;
      case 2:
        if (size == 1) {
          thirdNode.requestFocus();
        } else {
          firstNode!.requestFocus();
        }
        break;
      case 3:
        if (size == 1) {
          fourNode.requestFocus();
        } else {
          secondNode.requestFocus();
        }
        break;
      case 4:
        if (size == 1) {
          fourNode.requestFocus();
        } else {
          thirdNode.requestFocus();
        }
        break;
    }
  }

  onDispose() {
    firstNode!.dispose();
    secondNode.dispose();
    thirdNode.dispose();
    fourNode.dispose();
  }
}
