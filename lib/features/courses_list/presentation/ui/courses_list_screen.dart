import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:byaan/features/course_details/presentation/ui/course_details_screen.dart';
import 'package:byaan/features/home/data/data.dart';
import 'package:byaan/generated/l10n.dart';
import 'package:byaan/res/gaps.dart';
import 'package:byaan/res/m_colors.dart';
import 'package:byaan/features/courses_list/presentation/widgets/courses_list_item.dart';

class CoursesListScreen extends StatelessWidget {
  const CoursesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(top: 40),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: MColors.appBarColor,
                    border: Border.all(color: Colors.grey.withOpacity(.3)),
                  ),
                  child: const Icon(CupertinoIcons.back),
                ),
              ),
              Text(
                S.current.premium_courses,
                style: const TextStyle(
                  color: Color(0xff0d1731),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox()
            ],
          ),
          Gaps.vGap12,
          Expanded(
            child: ListView.builder(
              itemCount: features.length,
              itemBuilder: (context, index) {
                return CoursesListItem(
                    onTap: () {
                      Get.to(() => CourseDetailsScreen(features[index]));
                    },
                    data: features[index]);
              },
            ),
          ),
        ]),
      ),
    );
  }
}
