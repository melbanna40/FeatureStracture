import 'package:byaan/CommonUtils/image_utils.dart';
import 'package:byaan/features/home/data/data.dart';
import 'package:byaan/generated/l10n.dart';
import 'package:byaan/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'drawer_items.dart';

class DrawerWidget extends StatefulWidget {
  final VoidCallback closeDrawer;

  const DrawerWidget({Key? key, required this.closeDrawer}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget>
    with SingleTickerProviderStateMixin {
  final double runAnim = 0.4;

  @override
  Widget build(BuildContext context) {
    var he = MediaQuery.of(context).size.height;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          _buildButton(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomImage(
                profile["image"]!,
                width: 120,
                height: 120,
                radius: 60,
              ),
              const Spacer(),
            ],
          ),
          SizedBox(
            height: he * 0.02,
          ),
          _buildText(context),
          SizedBox(
            height: he * 0.02,
          ),
          buildDrawerItem(context),
          const Spacer(),
          Align(
              alignment: Alignment.centerLeft,
              child: ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 1),
                leading: SvgPicture.asset(
                  ImageUtils.getImagePath('logout', format: 'svg'),
                  color: Colors.white,
                ),
                title: Text(
                  S.current.logOut,
                  style: const TextStyle(color: Colors.white),
                ),
              )),
          const Spacer(),
          const Spacer(),
        ],
      ),
    );
  }

  Widget buildDrawerItem(BuildContext context) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: DrawerItems.all
              .map(
                (item) => ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 1),
                  leading: item.icon,
                  title: Text(
                    item.title,
                    style: const TextStyle(color: Colors.white),
                  ),
                  onTap: () {},
                ),
              )
              .toList(),
        ),
      );

  Widget _buildButton() {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.only(top: he * 0.09, left: we * 0.15, right: 24),
      width: 50,
      height: 50,
      alignment: Alignment.center,
      decoration:
          const BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
      child: Container(
          width: 47,
          height: 47,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF04123F),
          ),
          child: IconButton(
              onPressed: widget.closeDrawer,
              icon: const Icon(
                Icons.arrow_back_ios_outlined,
                color: Colors.white,
                size: 20,
              ))),
    );
  }

  Widget _buildText(context) {
    var we = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(right: we * 0.4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Ahmed Jad",
            style: TextStyle(
                fontSize: 40,
                letterSpacing: 2,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
