import 'package:flutter/material.dart';

class Gaps {
  //Horizontal
  static const Widget hGap4 = SizedBox(width: 4.0);
  static const Widget hGap5 = SizedBox(width: 5);
  static const Widget hGap8 = SizedBox(width: 8.0);
  static const Widget hGap10 = SizedBox(width: 10);
  static const Widget hGap12 = SizedBox(width: 12.0);
  static const Widget hGap15 = SizedBox(width: 15);
  static const Widget hGap16 = SizedBox(width: 16);
  static const Widget hGap20 = SizedBox(width: 20);
  static const Widget hGap30 = SizedBox(width: 30);

//Vertical
  static const Widget vGap4 = SizedBox(height: 4.0);
  static const Widget vGap5 = SizedBox(height: 5);
  static const Widget vGap8 = SizedBox(height: 8.0);
  static const Widget vGap10 = SizedBox(height: 10);
  static const Widget vGap12 = SizedBox(height: 12.0);
  static const Widget vGap15 = SizedBox(height: 15);
  static const Widget vGap16 = SizedBox(height: 16);
  static const Widget vGap50 = SizedBox(height: 50);
  static const Widget vGap100 = SizedBox(height: 100);
  static const Widget vGap30 = SizedBox(height: 30);
  static const Widget vGap40 = SizedBox(height: 40);

  static Widget line = const SizedBox(
    height: 0.6,
    width: double.infinity,
    child: DecoratedBox(decoration: BoxDecoration(color: Colors.grey)),
  );

  static const Widget empty = SizedBox();
}
