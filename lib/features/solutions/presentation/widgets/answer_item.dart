import 'dart:math';

import 'package:byaan/CommonUtils/image_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnswerItem extends StatelessWidget {
  final int index;

  const AnswerItem(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0fa8afb1),
            offset: Offset(0, 2),
            blurRadius: 40,
            spreadRadius: 11,
          ),
        ],
      ),
      child: ExpansionTile(
        trailing: const SizedBox.shrink(),
        title: Row(children: [
          Text('${index+1}.'),
          Expanded(
              child: Container(
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.all(8.0),
            child: const Text(
                'How can we unlock the 90% of our brain that we never use?'),
          )),
          SvgPicture.asset(Random().nextBool() == true
              ? ImageUtils.getImagePath('ic_tick_circle', format: 'svg')
              : ImageUtils.getImagePath('ic_close_circle', format: 'svg'))
        ]),
        children: const [
          Text('Answers:'),
          Text(
              '33/4 ÷ 4 pounds.  \n = (4 × 3 + 3)/4 ÷ 4 pounds.\n = 15/4 ÷ 4 pounds.\n= 15/4 × 1/4 pounds.\n= 15/16 pounds.\nNow we know that, 1 pound = 16 ounces.\nTherefore, 1'),
        ],
      ),
    );
  }
}
