import 'package:byaan/features/home/data/data.dart';
import 'package:byaan/features/home/presentation/widgets/quiz_item.dart';
import 'package:byaan/features/quiz/data/models/quiz_question.dart';
import 'package:byaan/features/quiz_report/presentation/ui/quiz_report_screen.dart';
import 'package:byaan/generated/l10n.dart';
import 'package:byaan/res/gaps.dart';
import 'package:byaan/res/m_colors.dart';
import 'package:byaan/widgets/custom_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:get/get.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  CarouselController mCarouselController = CarouselController();
  int index = 1;

  List<QuizQuestion> questionsList = [
    QuizQuestion(
      'What is the part of the animal cell that is labelled by A?',
      'multi_choice',
      [
        'Cell membrane',
        'Chloroplast',
        'Nucleus',
        'Nucleus',
      ],
    ),
    QuizQuestion(
      'Is the part of the animal cell that is Cell membrane?',
      'true_false',
      [],
    ),
    QuizQuestion(
      'Explain the part of the animal cell.',
      'long_answer',
      [],
    ),
    QuizQuestion(
      'Explain in brief the part of the animal cell.',
      'short_answer',
      [],
    ),
  ];

  @override
  Widget build(BuildContext context) {
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
                const Text(
                  'Biology',
                  style: TextStyle(
                    color: Color(0xff0d1731),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TimerCountdown(
                  enableDescriptions: false,
                  format: CountDownTimerFormat.hoursMinutesSeconds,
                  endTime: DateTime.now().add(
                    const Duration(
                      hours: 1,
                      minutes: 30,
                      seconds: 00,
                    ),
                  ),
                  onEnd: () {
                    if (kDebugMode) {
                      print("Timer finished");
                    }
                  },
                )
              ],
            ),
            Gaps.vGap30,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '${S.current.question} $index/${questionsList.length}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Expanded(
              child: CarouselSlider(
                carouselController: mCarouselController,
                options: CarouselOptions(
                    height: MediaQuery.of(context).size.height,
                    viewportFraction: 1.0,
                    enlargeCenterPage: false,
                    autoPlay: false,
                    disableCenter: true,
                    onPageChanged:
                        (int sliderIndex, CarouselPageChangedReason reason) {
                      setState(() {
                        index = sliderIndex + 1;
                      });
                    },
                    scrollPhysics: const NeverScrollableScrollPhysics(),
                    enableInfiniteScroll: false),
                items: List.generate(
                  questionsList.length,
                  (index) => QuizItem(questionsList[index]),
                ),
              ),
            ),
            CupertinoButton(
                minSize: 60,
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.3,
                    vertical: 16),
                color: const Color(0xff5c3e91),
                borderRadius: BorderRadius.circular(18),
                child: Text(
                  S.current.next,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onPressed: () {
                  if (index != questionsList.length) {
                    mCarouselController.nextPage();
                  }
                  showSubmitBottomSheet();
                }),
            Gaps.vGap16,
            InkWell(
              onTap: () {
                if (index != questionsList.length) {
                  mCarouselController.nextPage();
                }
                showSubmitBottomSheet();
              },
              child: Text(
                S.current.skip,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Gaps.vGap30,
          ],
        ),
      ),
    );
  }

  void showSubmitBottomSheet() {
    if (index == questionsList.length) {
      showModalBottomSheet<void>(
        context: context,
        useRootNavigator: false,
        elevation: 16,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
          ),
        ),
        backgroundColor: Colors.white,
        builder: (BuildContext context) {
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Gaps.vGap30,
                CustomImage(
                  profile["image"]!,
                  width: 80,
                  height: 80,
                  radius: 40,
                ),
                Gaps.vGap30,
                Text(
                  S.current.submitExam,
                  style: const TextStyle(
                    color: Color(0xff0d1731),
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Gaps.vGap30,
                Center(
                  child: Text(
                    S.current.sure_submit,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xff6e767c),
                      fontSize: 18,
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
                      S.current.yes,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onPressed: () {
                      Get.back();
                      Get.to(() => const QuizReportScreen());
                    }),
              ],
            ),
          );
        },
      );
    }
  }
}
