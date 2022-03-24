import 'dart:math';

import 'package:flutter/material.dart';
import 'package:byaan/res/gaps.dart';
import 'package:percent_indicator/percent_indicator.dart';

class MyCoursesItem extends StatelessWidget {
  final data;

  const MyCoursesItem(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xfff4f5f6),
        border: Border.all(
          color: const Color(0xfff0f0f0),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          CircularPercentIndicator(
            radius: 55,
            arcType: ArcType.FULL,
            percent: data['complete_percent'],
            animation: true,
            circularStrokeCap: CircularStrokeCap.round,
            arcBackgroundColor:
                Color(Random().nextInt(0xffffffff)).withOpacity(.3),
            progressColor: Color(Random().nextInt(0xffffffff)),
            center: Text(
              '${data['complete_percent'] * 100} %',
              style: const TextStyle(fontSize: 12),
            ),
          ),
          Gaps.hGap16,
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data['name'],
                style: const TextStyle(
                  color: Color(0xff0d1731),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                data['progress'],
                style: const TextStyle(
                  color: Color(0xff6e767c),
                ),
              ),
            ],
          )),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            color: Color(0xff6e767c),
          )
        ],
      ),
    );
  }
}
