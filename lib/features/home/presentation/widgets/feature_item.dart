import 'package:flutter/material.dart';
import 'package:byaan/res/m_colors.dart';

import '../../../../widgets/custom_image.dart';

class FeatureItem extends StatelessWidget {
  const FeatureItem(
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
            CustomImage(
              data["image"],
              width: double.infinity,
              height: MediaQuery.of(context).size.height*0.30,
              radius: 15,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 4),
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        data["name"],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 17,
                            color: MColors.textColor,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        data["price"],
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500),
                      ),
                    ],
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
