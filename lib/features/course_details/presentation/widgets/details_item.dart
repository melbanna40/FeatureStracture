import 'package:byaan/CommonUtils/image_utils.dart';
import 'package:byaan/res/gaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsItem extends StatelessWidget {
  final String description;

  const DetailsItem(this.description, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true,
      children: [
        Gaps.vGap12,
        Text(description),
        Gaps.vGap12,
        Row(
          children: [
            SvgPicture.asset(
                ImageUtils.getImagePath('ic_eye_show', format: 'svg')),
            Gaps.hGap4,
            const Text(
              '338 live class',
              style: TextStyle(
                color: Color(0xff0d1731),
              ),
            ),
          ],
        ),
        Gaps.vGap12,
        Row(
          children: const [
            Icon(Icons.schedule_rounded,size: 18,),
            Gaps.hGap4,
            Text(
              '1 hour per class',
              style: TextStyle(
                color: Color(0xff0d1731),
              ),
            ),
          ],
        ),
        Gaps.vGap12,
        Row(
          children: [
            SvgPicture.asset(
                ImageUtils.getImagePath('profile', format: 'svg'),width: 18,height: 18,color: const Color(0xff0d1731),),
            Gaps.hGap4,
            const Text(
              'Expert mentors',
              style: TextStyle(
                color: Color(0xff0d1731),
              ),
            ),
          ],
        ),
        Gaps.vGap12,
        Row(
          children: [
            SvgPicture.asset(
                ImageUtils.getImagePath('ic_faq_circle', format: 'svg')),
            Gaps.hGap4,
            const Text(
              'Tests & practises',
              style: TextStyle(
                color: Color(0xff0d1731),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
