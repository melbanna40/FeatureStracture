import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:byaan/CommonUtils/image_utils.dart';
import 'package:byaan/features/home/data/data.dart';
import 'package:byaan/res/gaps.dart';
import 'package:byaan/res/m_colors.dart';

import '../../../../widgets/custom_image.dart';

class CoursesListItem extends StatelessWidget {
  const CoursesListItem(
      {Key? key, required this.data, this.width = 280, this.onTap})
      : super(key: key);
  final data;
  final double width;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: MColors.shadowColor.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(1, 1), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            SizedBox(
              height: 185,
              child: Stack(
                children: [
                  CustomImage(
                    data["image"],
                    width: double.infinity,
                    height: 160,
                    radius: 15,
                  ),
                  Positioned(
                    right: 8,
                    top: 8,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: const Color(0x339c9c9c),
                            borderRadius: BorderRadius.circular(18)),
                        child: SvgPicture.asset(
                          ImageUtils.getImagePath('ic_bookmark', format: 'svg'),
                          color: Colors.white,
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(45),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x1c969d9e),
                            offset: Offset(0, 4),
                            blurRadius: 33,
                            spreadRadius: 11,
                          ),
                        ],
                      ),
                      child: Text(
                        data["price"],
                        style: const TextStyle(
                          color: Color(0xff0d1731),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 4),
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CustomImage(
                        profile["image"]!,
                        width: 35,
                        height: 35,
                        radius: 30,
                      ),
                      Gaps.hGap8,
                      const Text(
                        'Clarot Yenefar',
                        style: TextStyle(
                          color: Color(0xff0d1731),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Gaps.vGap8,
                  Text(
                    data["name"],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 17,
                        color: MColors.textColor,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      getAttribute(Icons.play_circle_outlined,
                          MColors.labelColor, data["session"]),
                      const SizedBox(
                        width: 12,
                      ),
                      getAttribute(Icons.schedule_rounded, MColors.labelColor,
                          data["duration"]),
                      // const SizedBox(
                      //   width: 12,
                      // ),
                      // getAttribute(
                      //     Icons.star, MColors.yellow, data["review"]),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  getAttribute(IconData icon, Color color, String info) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: color,
        ),
        const SizedBox(
          width: 3,
        ),
        Text(
          info,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: MColors.labelColor, fontSize: 13),
        ),
      ],
    );
  }
}
