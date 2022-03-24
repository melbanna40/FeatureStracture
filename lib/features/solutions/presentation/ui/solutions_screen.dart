import 'package:byaan/features/solutions/presentation/widgets/answer_item.dart';
import 'package:byaan/generated/l10n.dart';
import 'package:byaan/res/gaps.dart';
import 'package:byaan/res/m_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SolutionsScreen extends StatelessWidget {
  const SolutionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: ListView(children: [
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
                S.current.solutions,
                style: const TextStyle(
                  color: Color(0xff0d1731),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              InkWell(
                onTap: () {
                  Get.back();
                  Get.back();
                  Get.back();
                },
                child: Text(
                  S.current.close,
                  style: const TextStyle(
                    color: Color(0xff2ca7f7),
                  ),
                ),
              ),
            ],
          ),
          Gaps.vGap12,
          ListView.builder(
              itemCount: 8,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return AnswerItem(index);
              })
        ]),
      ),
    );
  }
}
