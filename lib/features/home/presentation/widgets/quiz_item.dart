import 'package:flutter/material.dart';
import 'package:byaan/features/quiz/data/models/quiz_question.dart';
import 'package:byaan/res/gaps.dart';

class QuizItem extends StatefulWidget {
  final QuizQuestion quizQuestion;

  const QuizItem(this.quizQuestion, {Key? key}) : super(key: key);

  @override
  State<QuizItem> createState() => _QuizItemState();
}

class _QuizItemState extends State<QuizItem> {
   bool isSuffixIcon = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Text(
          widget.quizQuestion.questionContent!,
          style: const TextStyle(
            color: Color(0xff0d1731),
            fontSize: 16,
            
          ),
        ),
        Gaps.vGap30,
        getAnswerTypeView(
            widget.quizQuestion.type!, widget.quizQuestion.questionOptions!)
      ],
    );
  }

  Widget getAnswerTypeView(String type, List<String> options) {
    switch (type) {
      case 'multi_choice':
        return ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(options.length, (index) {
            int value = 0;
            int groupVal = 1;

            return Container(
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x1e818d93),
                    offset: Offset(0, 30),
                    blurRadius: 39,
                    spreadRadius: 8,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Radio(
                      value: value,
                      groupValue: groupVal,
                      activeColor: Colors.black,
                      onChanged: (val) {
                        groupVal = val as int;
                        setState(() {});
                      }),
                  Expanded(child: Text(options[index])),
                ],
              ),
            );
          }),
        );
      case 'true_false':
        int value = 0;
        int groupVal1 = 1;

        return ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(2, (index) {
            return Container(
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xfff4f5f6),
                border: Border.all(
                  color: const Color(0xfff0f0f0),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Radio(
                      value: value,
                      groupValue: groupVal1,
                      activeColor: Colors.black,
                      onChanged: (val) {
                        groupVal1 = val as int;
                        setState(() {});
                      }),
                  Expanded(child: Text(index == 0 ? 'True' : 'False')),
                ],
              ),
            );
          }),
        );
      case 'long_answer':
        return Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.withOpacity(0.2), width: 1),
              color: Colors.white,
              borderRadius: BorderRadius.circular(16)),
          padding: const EdgeInsets.all(6),
          child: const TextField(
            minLines: 6,
            maxLines: 6,
            // controller: TextEditingController(),
            decoration: InputDecoration(
              label: Text('Long Answer'),
              focusedBorder: InputBorder.none,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
            ),
          ),
        );
      case 'short_answer':
        return Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.withOpacity(0.2), width: 1),
              color: Colors.white,
              borderRadius: BorderRadius.circular(16)),
          padding: const EdgeInsets.all(6),
          child: const TextField(
            minLines: 2,
            maxLines: 2,
            // controller: TextEditingController(),
            decoration: InputDecoration(
              label: Text('Short Answer'),
              focusedBorder: InputBorder.none,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
            ),
          ),
        );
      default:
        return Container();
    }
  }
}
