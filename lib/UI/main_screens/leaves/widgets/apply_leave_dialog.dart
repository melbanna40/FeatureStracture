import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kafey/CommonUtils/common_utils.dart';
import 'package:kafey/generated/l10n.dart';
import 'package:kafey/network/api/ApiResponse/my_leaves_types_response.dart';
import 'package:kafey/res/gaps.dart';
import 'package:kafey/res/m_colors.dart';
import 'package:kafey/res/styles.dart';

class ApplyLeaveDialog extends StatefulWidget {
  List<MyLeavesTypesData>? mMyLeavesTypesDataList;
  final Function(Map<String, dynamic>)? onCreateClickedCallBack;

  ApplyLeaveDialog(this.mMyLeavesTypesDataList, {this.onCreateClickedCallBack});

  @override
  _ApplyLeaveDialogState createState() => _ApplyLeaveDialogState();
}

class _ApplyLeaveDialogState extends State<ApplyLeaveDialog> {
  final _dateController = TextEditingController();
  final _reasonController = TextEditingController();
  var start;
  var end;
  MyLeavesTypesData? selectedLeaveType;

  @override
  void initState() {
    selectedLeaveType = widget.mMyLeavesTypesDataList![0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "طلب أجازة",
          style: TextStyle(color: MColors.colorPrimarySwatch, fontSize: 26),
        ),
        leading: BackButton(
          color: MColors.colorPrimarySwatch,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("اختار تاريخ الأجازة",style: KStyles.textStyle16),
              InkWell(
                onTap: () async {
                  final picked = await showDateRangePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2030),
                  );
                  if (picked != null) {
                    print(picked);
                    start = DateFormat('yyyy-MM-dd', 'en').format(picked.start);
                    end = DateFormat('yyyy-MM-dd', 'en').format(picked.end);

                    _dateController.text = "   من   " + start + "  إلى    " + end;
                    setState(() {});
                  }
                },
                child: TextFormField(
                  controller: _dateController,
                  enabled: false,
                  style:KStyles.textStyle16,

                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                        borderSide: const BorderSide(color: MColors.colorPrimarySwatch, width: 1.0),),

                    suffixIcon: Icon(CupertinoIcons.calendar,  color: MColors.colorPrimarySwatch,)

                  ),
                ),
              ),
              Gaps.vGap15,
              Text("اختار نوع الأجازة",style: KStyles.textStyle16),
              DropdownButtonHideUnderline(

                child: DropdownButton<MyLeavesTypesData>(
                  isExpanded: true,


                  icon: Container(
                      padding: const EdgeInsets.all(4),
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          // color: MColors.colorPrimary,
                          borderRadius: BorderRadius.circular(4)),
                      child: const Icon(
                        CupertinoIcons.chevron_up_chevron_down,
                        color: MColors.colorPrimarySwatch,
                      )),
                  items: widget.mMyLeavesTypesDataList!
                      .map((MyLeavesTypesData item) =>
                          DropdownMenuItem<MyLeavesTypesData>(
                              child: Container(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  child: Text(item.leaveType!.name!)),
                              value: item))
                      .toList(),
                  onChanged: (MyLeavesTypesData? val) {
                    setState(() {
                      selectedLeaveType = val!;
                    });
                  },
                  value: selectedLeaveType,
                ),
              ),
              Gaps.vGap15,
              Text("السبب",style: KStyles.textStyle16),
              Container(
                height: 200,
                child: TextFormField(
                  maxLines: 5,
                  controller: _reasonController,
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
                    onPressed: () {
                      if (start == null || end == null) {
                        CommonUtils.showToastMessage(
                            'من فضلك قم باختيار فترة الطلب');
                      } else {
                        widget.onCreateClickedCallBack!.call({
                          'from': start,
                          'to': end,
                          'reason': _reasonController.text,
                          'leave_type_id': selectedLeaveType!.leaveType!.id!
                        });
                        Navigator.pop(context);
                      }

                      // Log.e(selectedLeaveType!.id.toString());
                      // Log.e(start);
                      // Log.e(end);
                      // Log.e(_reasonController.text);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
