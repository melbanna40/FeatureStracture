import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kafey/generated/l10n.dart';
import 'package:kafey/res/gaps.dart';
import 'package:kafey/res/m_colors.dart';

class TimeUpdatedDialog extends StatefulWidget {
  final Function(Map<String, dynamic>)? onCreateClickedCallBack;

  const TimeUpdatedDialog({
    Key? key,
    this.onCreateClickedCallBack,
  }) : super(key: key);

  @override
  _TimeUpdatedDialogState createState() => _TimeUpdatedDialogState();
}

class _TimeUpdatedDialogState extends State<TimeUpdatedDialog> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2))
        .then((value) => Navigator.pop(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.3, horizontal: 40),
      child: Material(
        borderRadius: BorderRadius.circular(4),
        child: Form(
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Center(
              child: ListView(

                padding: const EdgeInsets.all(15),
                children: [
                  Gaps.vGap50,
                 Icon(CupertinoIcons.clock,size: 80,),
                  Center(
                    child: Text("Time Update Request Sent",style: TextStyle(
                      fontSize: 20
                    ),),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
