import 'package:byaan/CommonUtils/image_utils.dart';
import 'package:byaan/features/course_details/presentation/ui/course_details_screen.dart';
import 'package:byaan/features/courses_list/presentation/ui/courses_list_screen.dart';
import 'package:byaan/features/home/data/data.dart';
import 'package:byaan/features/home/presentation/widgets/category_box.dart';
import 'package:byaan/features/home/presentation/widgets/feature_item.dart';
import 'package:byaan/features/home/presentation/widgets/home_test_exam.dart';
import 'package:byaan/features/home/presentation/widgets/recommend_item.dart';
import 'package:byaan/features/quiz/presentation/ui/quiz_screen.dart';
import 'package:byaan/generated/l10n.dart';
import 'package:byaan/res/gaps.dart';
import 'package:byaan/res/m_colors.dart';
import 'package:byaan/widgets/custom_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback? openDrawer;

  const HomeScreen(this.openDrawer, {Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              title: getAppBar(),
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

  Widget getAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).welcome,
              style: const TextStyle(
                color: MColors.labelColor,
                fontSize: 16,
              ),
            ),
            const Text("Ahmed",
                style: TextStyle(
                  color: MColors.textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                )),
          ],
        )),
        GestureDetector(
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: MColors.appBarColor,
              border: Border.all(color: Colors.grey.withOpacity(.3)),
            ),
            child: SvgPicture.asset(
              ImageUtils.getImagePath('search', format: 'svg'),
              width: 20,
              height: 20,
            ),
          ),
        ),
        Gaps.hGap8,
        InkWell(
          onTap: () {
            widget.openDrawer!.call();
          },
          child: CustomImage(
            profile["image"]!,
            width: 35,
            height: 35,
            radius: 30,
          ),
        ),
        // NotificationBox(
        //   notifiedNumber: 1,
        //   onTap: () {},
        // )
      ],
    );
  }

  buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            margin: const EdgeInsets.fromLTRB(15, 0, 15, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.of(context).premium_courses,
                  style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: MColors.textColor),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const CoursesListScreen());
                  },
                  child: const Icon(CupertinoIcons.forward),
                ),
              ],
            ),
          ),
          getRecommend(),

          getCategories(),

          // getCategories(),
          const SizedBox(
            height: 15,
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(15, 0, 15, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.of(context).live_courses,
                  style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: MColors.textColor),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const CoursesListScreen());
                  },
                  child: const Icon(CupertinoIcons.forward),
                ),
              ],
            ),
          ),
          getFeature(),
          GestureDetector(
              onTap: () {
                Get.to(() => const QuizScreen());
              },
              child: const HomeTestExamWidget()),
          Container(
            margin: const EdgeInsets.fromLTRB(15, 0, 15, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  S.of(context).free_courses,
                  style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: MColors.textColor),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const CoursesListScreen());
                  },
                  child: const Icon(CupertinoIcons.forward),
                ),
              ],
            ),
          ),
          getFree(),
        ]),
      ),
    );
  }

  int selectedCollection = 0;

  getCategories() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(15, 10, 0, 10),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          categories.length,
          (index) => Padding(
            padding: const EdgeInsets.only(right: 15),
            child: CategoryBox(
              selectedColor: Colors.white,
              data: categories[index],
              onTap: () {
                setState(() {
                  selectedCollection = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  getFeature() {
    return CarouselSlider(
      options: CarouselOptions(
          enlargeCenterPage: true,
          disableCenter: true,
          viewportFraction: .75,
          aspectRatio: context.isTablet ? 1.9 : 1.1),
      items: List.generate(
        features.length,
        (index) => FeatureItem(
            onTap: () {
              Get.to(() => CourseDetailsScreen(features[index]));
            },
            data: features[index]),
      ),
    );
  }

  getFree() {
    return CarouselSlider(
      options: CarouselOptions(
          enlargeCenterPage: true,
          disableCenter: true,
          viewportFraction: .75,
          aspectRatio: context.isTablet ? 1.9 : 1.1),
      items: List.generate(
        myCompleteCourses.length,
        (index) => FeatureItem(
            onTap: () {
              Get.to(() => CourseDetailsScreen(myCompleteCourses[index]));
            },
            data: myCompleteCourses[index]),
      ),
    );
  }

  getRecommend() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(15, 5, 0, 5),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          recommends.length,
          (index) => Padding(
            padding: const EdgeInsets.only(right: 10),
            child: RecommendItem(
              data: recommends[index],
              onTap: () {
                Get.to(() => CourseDetailsScreen(recommends[index]));
              },
            ),
          ),
        ),
      ),
    );
  }
}
