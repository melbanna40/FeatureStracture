import 'package:byaan/res/gaps.dart';
import 'package:byaan/widgets/custom_image.dart';
import 'package:flutter/material.dart';

class MentorItem extends StatelessWidget {
  final data;

  const MentorItem(this.data, {Key? key}) : super(key: key);

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
      child: Row(
        children: [
          CustomImage(
            data["image"],
            width: 60,
            height: 60,
            radius: 12,
          ),
          Gaps.hGap16,
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data["name"]!,
                style: const TextStyle(
                  color: Color(0xff0d1731),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                data["skill"]!,
                style: const TextStyle(
                  color: Color(0xff6e767c),
                  fontSize: 12,
                ),
              ),
            ],
          )),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            color: Color(0xff6e767c),
          )
        ],
      ),
    );
  }
}
