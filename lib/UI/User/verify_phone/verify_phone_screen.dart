import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafey/CommonUtils/common_utils.dart';
import 'package:kafey/UI/User/verify_phone/widgets/confirm_phone_custom_text_field.dart';
import 'package:kafey/generated/l10n.dart';
import 'package:kafey/res/gaps.dart';

import 'cubit/verify_phone_cubit.dart';

class VerifyPhoneScreen extends StatelessWidget {
  VerifyPhoneScreen(this.phone, {Key? key}) : super(key: key);

  final String phone;

  final FocusNode firstNode = FocusNode();
  final FocusNode secondNode = FocusNode();
  final FocusNode thirdNode = FocusNode();
  final FocusNode fourNode = FocusNode();

  bool isFirstText = false,
      isSecondText = false,
      isThirdText = false,
      isFourText = false;

  String? firstText, secondText, thirdText, fourText;
  String? code;

  @override
  Widget build(BuildContext context) {
    firstNode.requestFocus();
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
                      ConfirmPhoneCustomTextField(firstNode, (text) {
                        isFirstText = text.length == 1;
                        firstText = text;
                        goNextNodeFocus(1, text.length);
                      }),
                      ConfirmPhoneCustomTextField(secondNode, (text) {
                        isSecondText = text.length == 1;
                        secondText = text;
                        goNextNodeFocus(2, text.length);
                      }),
                      ConfirmPhoneCustomTextField(thirdNode, (text) {
                        isThirdText = text.length == 1;
                        thirdText = text;
                        goNextNodeFocus(3, text.length);
                      }),
                      ConfirmPhoneCustomTextField(fourNode, (text) {
                        isFourText = text.length == 1;
                        fourText = text;
                        goNextNodeFocus(4, text.length);
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
                        cubit.postLogin(
                            int.parse(phone), int.parse(checkToSendRequest()!));
                      } else {
                        CommonUtils.showToastMessage(
                            S.of(context).Enter_4_digit_code_sent_to_you_at);
                      }
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

  String? checkToSendRequest() {
    if (isFirstText && isSecondText && isThirdText && isFourText) {
      code = "$firstText$secondText$thirdText$fourText";
    }
    return code!;
  }

  void goNextNodeFocus(int numberText, int size) {
    switch (numberText) {
      case 1:
        if (size == 1) {
          secondNode.requestFocus();
        } else {
          firstNode.requestFocus();
        }
        break;
      case 2:
        if (size == 1) {
          thirdNode.requestFocus();
        } else {
          firstNode.requestFocus();
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
}
