import 'package:flutter/material.dart';
import 'package:byaan/res/gaps.dart';
import 'package:byaan/widgets/custom_image.dart';

class SubjectItem extends StatelessWidget {
  final data;

  const SubjectItem(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color(0xfff0f0f0),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ExpansionTile(
        title: Row(
          children: [
            CustomImage(
              data["image"],
              width: 60,
              height: 60,
              radius: 12,
            ),
            Gaps.hGap8,
            Text(
              data["name"],
              style: const TextStyle(
                color: Color(0xff0d1731),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        children: List.generate(4, (index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Gaps.hGap16,
                Text(
                  'Chapter ${index + 1} :',
                  style: const TextStyle(
                    color: Color(0xff6e767c),
                    fontSize: 12,
                  ),
                ),
                Gaps.hGap16,
                  Text(
                  data['duration'],
                  style:const TextStyle(
                    color: Color(0xff0d1731),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer()
              ],
            ),
          );
        }),
      ),
    );
  }
}
