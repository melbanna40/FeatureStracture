import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:byaan/CommonUtils/image_utils.dart';
import 'package:byaan/features/bookmarked_courses/presentation/ui/bookmarked_courses_screen.dart';
import 'package:byaan/features/edit_profile/presentation/ui/edit_profile_screen.dart';
import 'package:byaan/features/home/data/data.dart';
import 'package:byaan/features/profile/presentation/widgets/setting_box.dart';
import 'package:byaan/features/profile/presentation/widgets/setting_item.dart';
import 'package:byaan/generated/l10n.dart';
import 'package:byaan/res/gaps.dart';
import 'package:byaan/res/m_colors.dart';
import 'package:byaan/widgets/custom_image.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: MColors.appBgColor,
          pinned: true,
          snap: true,
          floating: true,
          title: Center(
            child: Text(
              S.current.profile,
              style: const TextStyle(
                color: Color(0xff0d1731),
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(child: getBody())
      ],
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          Column(
            children: [
              CustomImage(
                profile["image"]!,
                width: 70,
                height: 70,
                radius: 20,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                profile["name"]!,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: SettingBox(
                title: S.current.course(12),
                icon: ImageUtils.getImagePath('work', format: 'svg'),
              )),
              Gaps.hGap12,
              Expanded(
                  child: SettingBox(
                title: S.current.hours(102),
                icon: ImageUtils.getImagePath('time', format: 'svg'),
              )),
              Gaps.hGap12,
              Expanded(
                  child: SettingBox(
                title: "4.8",
                icon: ImageUtils.getImagePath('star', format: 'svg'),
              )),
            ],
          ),
          Gaps.vGap12,
          Container(
            padding: const EdgeInsets.only(left: 15, right: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: MColors.cardColor,
              boxShadow: [
                BoxShadow(
                  color: MColors.shadowColor.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: Column(children: [
              SettingItem(
                title: S.current.setting,
                leadingIcon: "assets/icons/setting.svg",
                bgIconColor: MColors.blue,
                onTap: () {
                  Get.to(
                    () => const EditProfileScreen(),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 45),
                child: Divider(
                  height: 0,
                  color: Colors.grey.withOpacity(0.8),
                ),
              ),
              SettingItem(
                title: S.current.payment,
                leadingIcon: "assets/icons/wallet.svg",
                bgIconColor: MColors.green,
                onTap: () {},
              ),
              Padding(
                padding: const EdgeInsets.only(left: 45),
                child: Divider(
                  height: 0,
                  color: Colors.grey.withOpacity(0.8),
                ),
              ),
              SettingItem(
                title: S.current.bookmark,
                leadingIcon: "assets/icons/bookmark.svg",
                bgIconColor: MColors.colorPrimary,
                onTap: () {
                  Get.to(() => const BookmarkedCoursesScreen());
                },
              ),
            ]),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.only(left: 15, right: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: MColors.cardColor,
              boxShadow: [
                BoxShadow(
                  color: MColors.shadowColor.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: Column(children: [
              SettingItem(
                title: S.current.notification,
                leadingIcon: "assets/icons/bell.svg",
                bgIconColor: MColors.purple,
                onTap: () {},
              ),
              Padding(
                padding: const EdgeInsets.only(left: 45),
                child: Divider(
                  height: 0,
                  color: Colors.grey.withOpacity(0.8),
                ),
              ),
              SettingItem(
                title: S.current.privacy,
                leadingIcon: "assets/icons/shield.svg",
                bgIconColor: MColors.orange,
                onTap: () {},
              ),
            ]),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.only(left: 15, right: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: MColors.cardColor,
              boxShadow: [
                BoxShadow(
                  color: MColors.shadowColor.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: Column(children: [
              SettingItem(
                title: S.current.logOut,
                leadingIcon: "assets/icons/logout.svg",
                bgIconColor: MColors.darker,
                onTap: () {},
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
