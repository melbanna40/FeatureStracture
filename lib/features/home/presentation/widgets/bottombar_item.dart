import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:byaan/res/m_colors.dart';

class BottomBarItem extends StatelessWidget {
  const BottomBarItem(this.icon,
      {Key? key,
      this.onTap,
      this.color = Colors.grey,
      this.activeColor = MColors.colorPrimary,
      this.isActive = false,
      this.isNotified = false})
      : super(key: key);
  final String icon;
  final Color color;
  final Color activeColor;
  final bool isNotified;
  final bool isActive;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn,
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: MColors.bottomBarColor,
          boxShadow: [
            if (isActive)
              BoxShadow(
                color: MColors.shadowColor.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 2,
                offset: const Offset(0, 0), // changes position of shadow
              ),
          ],
        ),
        child: SvgPicture.asset(
          icon,
          color: isActive ? activeColor : color,
          width: 23,
          height: 23,
        ),
      ),
    );
  }
}
