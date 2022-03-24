import 'package:flutter/material.dart';
import 'package:byaan/res/m_colors.dart';
import 'package:byaan/widgets/custom_image.dart';

class RecommendItem extends StatelessWidget {
  const RecommendItem({Key? key, required this.data, this.onTap})
      : super(key: key);
  final data;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          margin: const EdgeInsets.only(right: 10),
          padding: const EdgeInsets.all(10),
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(1, 1), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            children: [
              CustomImage(
                data["image"],
                radius: 15,
                height: 80,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data["name"],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: MColors.textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.schedule_rounded,
                          color: MColors.labelColor,
                          size: 14,
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Text(
                          data["duration"],
                          style: const TextStyle(
                              fontSize: 12, color: MColors.labelColor),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: MColors.orange,
                          size: 14,
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Text(
                          data["review"],
                          style: const TextStyle(
                              fontSize: 12, color: MColors.labelColor),
                        ),
                        const Spacer(),
                        Text(
                          data["price"],
                          style: const TextStyle(
                              fontSize: 14, color: MColors.textColor),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
