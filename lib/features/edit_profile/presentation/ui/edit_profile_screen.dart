import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:byaan/CommonUtils/image_utils.dart';
import 'package:byaan/features/home/data/data.dart';
import 'package:byaan/generated/l10n.dart';
import 'package:byaan/res/gaps.dart';
import 'package:byaan/res/m_colors.dart';
import 'package:byaan/widgets/custom_image.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String? selectedDate;
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: MColors.appBarColor,
                      border: Border.all(color: Colors.grey.withOpacity(.3)),
                    ),
                    child: const Icon(CupertinoIcons.back),
                  ),
                ),
                Text(
                  S.current.edit_profile,
                  style: const TextStyle(
                    color: Color(0xff0d1731),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  S.current.done,
                  style: const TextStyle(
                    color: Color(0xff2ca7f7),
                  ),
                ),
              ],
            ),
            Gaps.vGap12,
            Center(
              child: CustomImage(
                profile["image"]!,
                width: 120,
                height: 120,
                radius: 60,
              ),
            ),
            Gaps.vGap16,
            Center(
              child: Text(
                S.current.edit_image_profile,
                style: const TextStyle(
                  color: Color(0xff5c3e91),
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            Gaps.vGap50,
            Container(
              decoration: BoxDecoration(
                  border:
                      Border.all(color: Colors.grey.withOpacity(0.2), width: 1),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16)),
              padding: const EdgeInsets.all(6),
              child: TextField(
                decoration: InputDecoration(
                  label: Text(S.current.name),
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
                  border:
                      Border.all(color: Colors.grey.withOpacity(0.2), width: 1),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16)),
              padding: const EdgeInsets.all(6),
              child: TextField(
                decoration: InputDecoration(
                  label: Text(S.current.email),
                  focusedBorder: InputBorder.none,
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  prefixIcon: Container(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    child: SvgPicture.asset(
                      ImageUtils.getImagePath('ic_email', format: 'svg'),
                    ),
                  ),
                ),
              ),
            ),
            Gaps.vGap12,
            Container(
              decoration: BoxDecoration(
                  border:
                      Border.all(color: Colors.grey.withOpacity(0.2), width: 1),
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
                        obscure ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
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
            Gaps.vGap12,
            Container(
              decoration: BoxDecoration(
                  border:
                      Border.all(color: Colors.grey.withOpacity(0.2), width: 1),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16)),
              padding: const EdgeInsets.all(6),
              child: GestureDetector(
                onTap: () async {
                  DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime(1990),
                    firstDate: DateTime(1990),
                    lastDate: DateTime(DateTime.now().year + 2),
                  );
                  setState(() {
                    selectedDate = DateFormat(
                            'EEEE, dd. MMMM yyyy', Intl.getCurrentLocale())
                        .format(picked!);
                  });
                },
                child: TextField(
                  enabled: false,
                  decoration: InputDecoration(
                    label: Text(selectedDate != null
                        ? selectedDate!
                        : S.current.date_of_birth),
                    focusedBorder: InputBorder.none,
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                    prefixIcon: Container(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      child: SvgPicture.asset(
                        ImageUtils.getImagePath('ic_calendar', format: 'svg'),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
