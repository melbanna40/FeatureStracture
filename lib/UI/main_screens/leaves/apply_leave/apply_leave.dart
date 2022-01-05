import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kafey/generated/l10n.dart';
import 'package:kafey/res/gaps.dart';
import 'package:kafey/res/m_colors.dart';

class ApplyLeaveScreen extends StatefulWidget {
  const ApplyLeaveScreen({Key? key}) : super(key: key);

  @override
  _ApplyLeaveScreenState createState() => _ApplyLeaveScreenState();
}

class _ApplyLeaveScreenState extends State<ApplyLeaveScreen> {
  final _dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("اختار التاريخ"),
              InkWell(
                onTap: () async {
                  final picked = await showDateRangePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2030),
                  );
                  if (picked != null && picked != null) {
                    print(picked);
                    var start= DateFormat.Md().format(picked.start);
                    var end= DateFormat.Md().format(picked.end);
                    print("  من  "+ start +" إلى  "+ end);
                    _dateController.text= "   من  "+ start +"  إلى   "+ end;
                    setState(() {

                    });
                  }
                },
                child: TextFormField(
                  controller: _dateController,
                  enabled: false,
                ),
              ),
              Gaps.vGap15,
              Text("اختار نوع الأجازة"),
              TextFormField(),
              Gaps.vGap15,
              Text("السبب"),
              Container(
                height: 200,
                child: TextFormField(
                  maxLines: 5,
                ),
              ),
              Gaps.vGap15,
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
                    onPressed: () {}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
