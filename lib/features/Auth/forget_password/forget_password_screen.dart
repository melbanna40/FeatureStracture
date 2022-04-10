import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:byaan/CommonUtils/image_utils.dart';
import 'package:byaan/generated/l10n.dart';
import 'package:byaan/res/gaps.dart';
import 'package:byaan/res/m_colors.dart';
import '../../../../widgets/default_button.dart';
import '../../../../widgets/hex_color.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  String? selectedDate;
  bool obscure = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor("#f9fafa"),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Forgot password?",
                    style: TextStyle(
                        color: HexColor("#0d1731"),
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Fill in your email and we’ll send a code to reset your password.",
                    style:
                        TextStyle(color: MColors.inActiveColor, fontSize: 20),
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
                      label: Text("Phone"),
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
                Gaps.vGap100,
                DefaultButton(
                    borderRadius: BorderRadius.circular(18.0),
                    btnLblStyle:
                        const TextStyle(color: Colors.white, fontSize: 30),
                    height: 70,
                    horizontalMarginIsEnabled: false,
                    btnLbl: 'Send',
                    onPressedFunction: () {}),
              ],
            ),
          ),
        ));
  }
}
