import 'package:flutter/material.dart';
import 'package:byaan/features/home/data/data.dart';
import 'package:byaan/generated/l10n.dart';
import 'package:byaan/res/gaps.dart';
import 'package:byaan/widgets/custom_image.dart';

class HomeTestExamWidget extends StatelessWidget {
  const HomeTestExamWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xffceeffd),
        borderRadius: BorderRadius.circular(25),
        boxShadow: const [
          BoxShadow(
            color: Color(0x19a8afb1),
            offset: Offset(0, 4),
            blurRadius: 40,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            child: CustomImage(
              profile["image"]!,
              width: 60,
              height: 60,
              radius: 30,
            ),
          ),
          Gaps.hGap8,
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.current.showQuiz,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Gaps.vGap4,
              Text(
                S.current.checkYourPreparation,
                style: const TextStyle(
                  color: Color(0xff6e767c),
                ),
              ),
            ],
          )),
          const Icon(Icons.arrow_forward_ios_rounded)
        ],
      ),
    );
  }
}
