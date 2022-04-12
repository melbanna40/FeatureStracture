import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:byaan/CommonUtils/image_utils.dart';
import 'package:byaan/generated/l10n.dart';
import 'package:byaan/res/gaps.dart';
import 'package:byaan/res/m_colors.dart';

import '../../../../res/strings.dart';
import '../../../../widgets/default_button.dart';
import '../../../../widgets/hex_color.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? selectedDate;
  bool obscure = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: HexColor("#f9fafa"),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Welcome back,",
                  style: TextStyle(
                      color: HexColor("#0d1731"),
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Good to see you again",
                  style: TextStyle(color: MColors.inActiveColor, fontSize: 20),
                ),
              ),
              Gaps.vGap50,
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.grey.withOpacity(0.2), width: 1),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16)),
                padding: const EdgeInsets.all(6),
                child: TextField(
                  decoration: InputDecoration(
                    label: const Text("Phone"),
                    focusedBorder: InputBorder.none,
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                    prefixIcon: Container(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      child: SvgPicture.asset(
                        ImageUtils.getImagePath('profile', format: 'svg'),
                      ),
                    ),
                  ),
                ),
              ),
              Gaps.vGap12,
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.grey.withOpacity(0.2), width: 1),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16)),
                padding: const EdgeInsets.all(6),
                child: TextField(
                  obscureText: obscure,
                  decoration: InputDecoration(
                    label: Text(S.current.password),
                    suffixIcon: InkWell(
                      onTap: () {
                        obscure = !obscure;
                        setState(() {});
                      },
                      child: Icon(
                          obscure
                              ? CupertinoIcons.eye
                              : CupertinoIcons.eye_slash,
                          color: Colors.grey),
                    ),
                    focusedBorder: InputBorder.none,
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                    prefixIcon: Container(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      child: SvgPicture.asset(
                        'assets/icons/ic_unlock.svg',
                      ),
                    ),
                  ),
                ),
              ),
              Gaps.vGap15,
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, forgetScreen);
                },
                child: const Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    'Forgot password',
                    style: TextStyle(
                        color: Color(0xff6e767c),
                        fontFamily: 'Poppins',
                        decoration: TextDecoration.underline),
                  ),
                ),
              ),
              Gaps.vGap30,
              DefaultButton(
                  borderRadius: BorderRadius.circular(18.0),
                  btnLblStyle:
                      const TextStyle(color: Colors.white, fontSize: 30),
                  height: 70,
                  horizontalMarginIsEnabled: false,
                  btnLbl: 'Sign In',
                  onPressedFunction: () {}),
              Gaps.vGap30,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 70,
                    height: 1,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                      colors: [Color(0x00555555), Color(0xff717171)],
                      stops: [0, 1],
                      begin: Alignment(-1.00, 0.00),
                      end: Alignment(1.00, -0.00),
                      // angle: 90,
                      // scale: undefined,
                    )),
                  ),
                  Gaps.hGap10,
                  const Text(
                    'Or continue with',
                    style: TextStyle(
                      color: Color(0xff0d1731),
                      fontFamily: 'Poppins',
                    ),
                  ),
                  Gaps.hGap10,
                  Transform.rotate(
                    angle: 3.141592653589793,
                    child: Container(
                      width: 70,
                      height: 1,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                        colors: [Color(0x00555555), Color(0xff717171)],
                        stops: [0, 1],
                        begin: Alignment(-1.00, 0.00),
                        end: Alignment(1.00, -0.00),
                        // angle: 90,
                        // scale: undefined,
                      )),
                    ),
                  ),
                ],
              ),
              Gaps.vGap30,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 135.5,
                    height: 54,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16)),
                        border: Border.all(
                            color: const Color(0xffecedee), width: 1)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.facebook,
                          color: Colors.blue[700],
                        ),
                        Gaps.hGap10,
                        const Text("Facebook",
                            style: TextStyle(
                                color: Color(0xff0d1731),
                                fontWeight: FontWeight.w400,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 12.0),
                            textAlign: TextAlign.left)
                      ],
                    ),
                  ),
                  Gaps.hGap15,
                  Container(
                    width: 135.5,
                    height: 54,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16)),
                        border: Border.all(
                            color: const Color(0xffecedee), width: 1)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.g_mobiledata,
                          color: Colors.red[700],
                          size: 35,
                        ),
                        Gaps.hGap5,
                        const Text("Google",
                            style: TextStyle(
                                color: Color(0xff0d1731),
                                fontWeight: FontWeight.w400,
                                fontFamily: "Poppins",
                                fontStyle: FontStyle.normal,
                                fontSize: 12.0),
                            textAlign: TextAlign.left)
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
