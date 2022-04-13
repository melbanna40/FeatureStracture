import 'package:flutter/material.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';
import 'package:intl/intl.dart';
import 'package:byaan/generated/l10n.dart';
import 'package:byaan/res/gaps.dart';

class CalenderScreen extends StatelessWidget {
  const CalenderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<NeatCleanCalendarEvent> _eventList = [
      NeatCleanCalendarEvent('MultiDay Event A',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 10, 0),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 12, 0),
          color: Colors.orange,
          isMultiDay: true),
      NeatCleanCalendarEvent('Allday Event B',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day - 2, 14, 30),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 2, 17, 0),
          color: Colors.pink,
          isAllDay: true),
      NeatCleanCalendarEvent('Normal Event D',
          startTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 14, 30),
          endTime: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, 17, 0),
          color: Colors.indigo),
    ];
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(top: 40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Text(
                  S.of(context).semester_calendar,
                  style: const TextStyle(
                    color: Color(0xff0d1731),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Gaps.vGap12,
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Calendar(
                  weekDays: [
                    S.current.Monday,
                    S.current.Tuesday,
                    S.current.Wednesday,
                    S.current.Thursday,
                    S.current.Friday,
                    S.current.Saturday,
                    S.current.Sunday,
                  ],
                  eventsList: _eventList,
                  isExpandable: true,
                  eventDoneColor: Colors.green,
                  selectedColor: Colors.pink,
                  todayColor: Colors.blue,
                  eventColor: null,
                  locale: Intl.getCurrentLocale(),
                  todayButtonText: S.current.todayCourses,
                  allDayEventText: '',
                  multiDayEndText: S.current.multiDayEnd,
                  isExpanded: true,
                  expandableDateFormat: 'EEEE, dd. MMMM yyyy',
                  datePickerType: DatePickerType.date,
                  dayOfWeekStyle: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                      fontSize: 14),
                  onEventSelected: (NeatCleanCalendarEvent event) {
                    // Log.e(event.summary);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
