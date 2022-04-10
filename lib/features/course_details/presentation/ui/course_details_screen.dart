import 'package:byaan/CommonUtils/image_utils.dart';
import 'package:byaan/features/course_details/presentation/widgets/course_details_banner_view.dart';
import 'package:byaan/features/course_details/presentation/widgets/details_item.dart';
import 'package:byaan/features/course_details/presentation/widgets/mentor_item.dart';
import 'package:byaan/features/course_details/presentation/widgets/subject_item.dart';
import 'package:byaan/features/home/data/data.dart';
import 'package:byaan/generated/l10n.dart';
import 'package:byaan/res/gaps.dart';
import 'package:byaan/res/m_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CourseDetailsScreen extends StatefulWidget {
  final data;

  const CourseDetailsScreen(this.data, {Key? key}) : super(key: key);

  @override
  State<CourseDetailsScreen> createState() => _CourseDetailsScreenState();
}

TabController? _cardController;

class _CourseDetailsScreenState extends State<CourseDetailsScreen>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    _cardController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(top: 40),
        child: Column(
          children: [
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
                  widget.data['name'],
                  style: const TextStyle(
                    color: Color(0xff0d1731),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SvgPicture.asset(
                  ImageUtils.getImagePath(
                      widget.data['is_favorited']
                          ? 'ic_bookmarked'
                          : 'ic_bookmark',
                      format: 'svg'),
                  color: const Color(0xff0d1731),
                  width: 24,
                  height: 24,
                ),
              ],
            ),
            Gaps.vGap12,
            CourseDetailsBannerView(data: widget.data),
            Gaps.vGap12,
            Text(
              widget.data['description'],
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xff0d1731),
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            Gaps.vGap12,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                getAttribute(Icons.play_circle_outlined, MColors.labelColor,
                    widget.data['session']),
                const SizedBox(
                  width: 12,
                ),
                getAttribute(Icons.schedule_rounded, MColors.labelColor,
                    widget.data['duration']),
              ],
            ),
            Gaps.vGap12,
            Container(
              height: 40,
              decoration: const BoxDecoration(
                color: Color(0xfff2f2f3),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: TabBar(
                isScrollable: false,
                labelStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                onTap: (int index) {},
                indicatorColor: const Color(0xfff2f2f3),
                indicatorSize: TabBarIndicatorSize.tab,
                padding: const EdgeInsets.symmetric(horizontal: 7),
                indicator: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),

                // UnderlineTabIndicator(
                //
                //     borderSide:
                //         BorderSide(color: Colors.white, width: 30),),
                labelColor: Colors.blue,
                indicatorPadding: const EdgeInsets.symmetric(vertical: 4),
                unselectedLabelColor: Colors.black87,
                controller: _cardController,
                tabs: List.generate(
                  getTaps(context).length,
                  (index) => getTaps(context)[index],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _cardController,
                children: List.generate(3, (index) {
                  if (index == 0) {
                    return DetailsItem(widget.data['description']);
                  } else if (index == 1) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: chats.length,
                      itemBuilder: (context, index) {
                        return MentorItem(chats[index]);
                      },
                    );
                  } else if (index == 2) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: lessons.length,
                      itemBuilder: (context, index) {
                        return SubjectItem(lessons[index]);
                      },
                    );
                  } else {
                    return const SizedBox();
                  }
                }),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x1c767b83),
                    offset: Offset(0, -1),
                    blurRadius: 42,
                    spreadRadius: 10,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.current.price,
                        style: const TextStyle(
                          color: Color(0xff6e767c),
                        ),
                      ),
                      Text(
                        '${765.00} ${S.current.currency}',
                        style: const TextStyle(
                          color: Color(0xff0d1731),
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  CupertinoButton(
                      minSize: 60,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 16),
                      color: const Color(0xff5c3e91),
                      borderRadius: BorderRadius.circular(18),
                      child: Text(
                        S.current.get_now,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onPressed: () {})
                ],
              ),
            ),
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

  @override
  bool get wantKeepAlive => false;

  getTaps(BuildContext context) {
    return [
      Text(
        S.current.details,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        textAlign: TextAlign.center,
      ),
      Text(
        S.current.mentors,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        textAlign: TextAlign.center,
      ),
      Text(
        S.current.subject,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        textAlign: TextAlign.center,
      ),
    ];
  }



}
