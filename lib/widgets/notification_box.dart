import 'package:byaan/res/m_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationBox extends StatelessWidget {
  const NotificationBox(
      {Key? key, this.onTap, this.size = 5, this.notifiedNumber = 0})
      : super(key: key);
  final GestureTapCallback? onTap;
  final int notifiedNumber;
  final double size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.all(size),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: MColors.appBarColor,
            border: Border.all(color: Colors.grey.withOpacity(.3)),
          ),
          child: SvgPicture.asset("assets/icons/bell.svg")),
    );
  }
}
