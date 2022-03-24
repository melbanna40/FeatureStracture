import 'package:byaan/CommonUtils/image_utils.dart';
import 'package:byaan/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DrawerItem {
  String title;
  SvgPicture icon;

  DrawerItem({required this.title, required this.icon});
}

class DrawerItems {
  static final List<DrawerItem> all = [
    DrawerItem(
      title: S.current.bookmark,
      icon: SvgPicture.asset(
        ImageUtils.getImagePath('ic_bookmark', format: 'svg'),
        color: Colors.white,
        width: 24,
        height: 24,
      ),
    ),
    DrawerItem(
      title: S.current.notification,
      icon: SvgPicture.asset(
        ImageUtils.getImagePath('ic_notification', format: 'svg'),
        color: Colors.white,
        width: 24,
        height: 24,
      ),
    ),
    DrawerItem(
      title: S.current.live_courses,
      icon: SvgPicture.asset(
        ImageUtils.getImagePath('ic_eye_show', format: 'svg'),
        color: Colors.white,
        width: 24,
        height: 24,
      ),
    ),
    DrawerItem(
      title: S.current.setting,
      icon: SvgPicture.asset(
        ImageUtils.getImagePath('ic_setting', format: 'svg'),
        color: Colors.white,
        width: 24,
        height: 24,
      ),
    ),
    DrawerItem(
      title: S.current.help,
      icon: SvgPicture.asset(
        ImageUtils.getImagePath('ic_information_circle', format: 'svg'),
        color: Colors.white,
        width: 24,
        height: 24,
      ),
    ),
  ];
}
