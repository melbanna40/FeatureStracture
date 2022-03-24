import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:byaan/features/course_details/presentation/ui/course_details_screen.dart';
import 'package:byaan/features/home/data/data.dart';
import 'package:byaan/features/my_courses/presentation/widgets/my_courses_item.dart';
import 'package:byaan/generated/l10n.dart';
import 'package:byaan/res/m_colors.dart';

class MyCoursesScreen extends StatelessWidget {
  const MyCoursesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MColors.appBgColor,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: MColors.appBarColor,
              pinned: true,
              snap: true,
              floating: true,
              centerTitle: false,
              title: Center(
                child: Text(
                  S.of(context).my_courses,
                  style: const TextStyle(
                    color: Color(0xff0d1731),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => buildBody(),
                childCount: 1,
              ),
            )
          ],
        ));
  }

  Widget buildBody() {
    return Container(
      padding: const EdgeInsets.all(12),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: myProgressCourses.length,
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () {
                Get.to(() => CourseDetailsScreen(myProgressCourses[index]));
              },
              child: MyCoursesItem(myProgressCourses[index]));
        },
      ),
    );
  }
}
