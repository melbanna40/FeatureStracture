import 'package:byaan/CommonUtils/image_utils.dart';
import 'package:byaan/generated/l10n.dart';
import 'package:byaan/res/gaps.dart';
import 'package:byaan/res/m_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../widgets/custom_image.dart';

class CourseDetailsBannerView extends StatelessWidget {
  const CourseDetailsBannerView(
      {Key? key, required this.data, this.height = 280, this.onTap})
      : super(key: key);
  final data;
  final double height;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 5, top: 5),
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
            CustomImage(
              data["image"],
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.35,
              radius: 15,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
              margin: const EdgeInsets.only(top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Text(
                  //       data["name"],
                  //       maxLines: 1,
                  //       overflow: TextOverflow.ellipsis,
                  //       style: const TextStyle(
                  //           fontSize: 17,
                  //           color: MColors.textColor,
                  //           fontWeight: FontWeight.w600),
                  //     ),
                  //     Text(
                  //       data["price"],
                  //       style: const TextStyle(
                  //           color: Colors.black,
                  //           fontWeight: FontWeight.w500),
                  //     ),
                  //   ],
                  // ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  Container(
                    margin: const EdgeInsets.all(14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                            ImageUtils.getImagePath('play', format: 'svg')),
                        Gaps.hGap8,
                        Text(
                          S.current.preview,
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        const Spacer(),

                        SvgPicture.asset(ImageUtils.getImagePath(
                            'ic_volume_off',
                            format: 'svg')),
                        Gaps.hGap8,
                        SvgPicture.asset(ImageUtils.getImagePath(
                            'ic_full_screen',
                            format: 'svg')),

                        // const SizedBox(
                        //   width: 12,
                        // ),
                        // getAttribute(
                        //     Icons.star, MColors.yellow, data["review"]),
                      ],
                    ),
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
          size: 30,
          color: color,
        ),
        const SizedBox(
          width: 3,
        ),
        Text(
          info,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.black, fontSize: 13),
        ),
      ],
    );
  }
}
