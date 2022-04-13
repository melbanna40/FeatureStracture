import 'package:byaan/features/solutions/presentation/ui/solutions_screen.dart';
import 'package:byaan/generated/l10n.dart';
import 'package:byaan/res/gaps.dart';
import 'package:byaan/res/m_colors.dart';
import 'package:circular_chart_flutter/circular_chart_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizReportScreen extends StatelessWidget {
  const QuizReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> data = [
      S.current.total_Questions,
      S.current.answered,
      S.current.skip,
      S.current.correct,
      S.current.incorrect,
      S.current.time,
    ];
    List<String> times = [
      '16',
      '14',
      '02',
      '12',
      '04',
      '12 min',
    ];
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Gaps.vGap40,
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
                const Spacer(),
                Text(
                  S.current.quiz_report,
                  style: const TextStyle(
                    color: Color(0xff0d1731),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
              ],
            ),
            Gaps.vGap12,
            AnimatedCircularChart(
              key: GlobalKey<AnimatedCircularChartState>(),
              size: const Size(200.0, 200.0),
              initialChartData: <CircularStackEntry>[
                CircularStackEntry(
                  <CircularSegmentEntry>[
                    CircularSegmentEntry(
                      33.33,
                      const Color(0xffe2e6e9),
                      rankKey: S.current.remaining,
                    ),
                    CircularSegmentEntry(
                      33.33,
                      const Color(0xffd74277),
                      rankKey: S.current.failed,
                    ),
                    CircularSegmentEntry(
                      33.33,
                      const Color(0xff48b7ff),
                      rankKey: S.current.completed,
                    ),
                  ],
                  rankKey: S.current.progress,
                ),
              ],
              chartType: CircularChartType.Radial,
              edgeStyle: SegmentEdgeStyle.round,
              holeRadius: 50,
              percentageValues: true,
              holeLabel: '75%',
            ),
            Gaps.vGap30,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xff48b7ff),
                  ),
                ),
                Gaps.hGap4,
                Text(
                  S.current.correct,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
                Gaps.hGap16,
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffd74277),
                  ),
                ),
                Gaps.hGap4,
                Text(
                  S.current.incorrect,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
                Gaps.hGap16,
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffe2e6e9),
                  ),
                ),
                Gaps.hGap4,
                Text(
                  S.current.skip,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            Gaps.vGap30,
            Container(
              margin: const EdgeInsets.all(20),
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(
                  6,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          data[index],
                          style: const TextStyle(
                            color: Color(0xff0d1731),
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          times[index],
                          style: const TextStyle(
                            color: Color(0xff0d1731),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Gaps.vGap30,
            CupertinoButton(
                minSize: 60,
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.3,
                    vertical: 16),
                color: const Color(0xff5c3e91),
                borderRadius: BorderRadius.circular(18),
                child: Text(
                  S.current.see_the_answer,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onPressed: () {
                  Get.to(() => const SolutionsScreen());
                }),
          ],
        ),
      ),
    );
  }
}
