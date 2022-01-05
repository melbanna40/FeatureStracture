import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kafey/UI/main_screens/attendance/widget/time_updated_dialog.dart';
import 'package:kafey/generated/l10n.dart';
import 'package:kafey/res/gaps.dart';
import 'package:kafey/res/m_colors.dart';

class ClockOutDialog extends StatefulWidget {
  final Function(Map<String, dynamic>)? onCreateClickedCallBack;

  const ClockOutDialog({
    Key? key,
    this.onCreateClickedCallBack,
  }) : super(key: key);

  @override
  _ClockOutDialogState createState() => _ClockOutDialogState();
}

class _ClockOutDialogState extends State<ClockOutDialog> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.14, horizontal: 40),
      child: Material(
        borderRadius: BorderRadius.circular(4),
        child: Form(
          child: Container(
            padding: const EdgeInsets.all(8),
            child: ListView(
              padding: const EdgeInsets.all(8),
              children: [
                Row(
                  children: [
                    Icon(
                      CupertinoIcons.clock,
                      color: MColors.colorPrimarySwatch,
                    ),
                    Gaps.hGap8,
                    Text(
                      "تعديل الوقت",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Container(
                  height: 150,
                  child: CupertinoTimerPicker(
                      mode: CupertinoTimerPickerMode.hm,
                      onTimerDurationChanged: (val) {}),
                ),
                Divider(),
                Text(
                  "قائد الفريق",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  "أحمد حسن",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Gaps.vGap15,
                Text(
                  "تعليق",
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
                Container(
                  height: 100,
                  child: TextFormField(
                    maxLines: 5,
                  ),
                ),
                Gaps.vGap30,
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: MColors.colorPrimarySwatch,
                      borderRadius: const BorderRadius.horizontal(
                          left: Radius.circular(8), right: Radius.circular(8))),
                  child: MaterialButton(
                      child: Text(
                        S.of(context).submit,
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        Navigator.pop(context);
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return TimeUpdatedDialog();
                            });

                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
