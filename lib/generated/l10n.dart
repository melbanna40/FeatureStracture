// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Byaan`
  String get appName {
    return Intl.message(
      'Byaan',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome {
    return Intl.message(
      'Welcome',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Oops!! There is No Data`
  String get empty_data {
    return Intl.message(
      'Oops!! There is No Data',
      name: 'empty_data',
      desc: '',
      args: [],
    );
  }

  /// `Refresh`
  String get refresh {
    return Intl.message(
      'Refresh',
      name: 'refresh',
      desc: '',
      args: [],
    );
  }

  /// `Premium Courses`
  String get premium_courses {
    return Intl.message(
      'Premium Courses',
      name: 'premium_courses',
      desc: '',
      args: [],
    );
  }

  /// `Live Courses`
  String get live_courses {
    return Intl.message(
      'Live Courses',
      name: 'live_courses',
      desc: '',
      args: [],
    );
  }

  /// `Free Courses`
  String get free_courses {
    return Intl.message(
      'Free Courses',
      name: 'free_courses',
      desc: '',
      args: [],
    );
  }

  /// `My Courses`
  String get my_courses {
    return Intl.message(
      'My Courses',
      name: 'my_courses',
      desc: '',
      args: [],
    );
  }

  /// `Semester Calendar`
  String get semester_calendar {
    return Intl.message(
      'Semester Calendar',
      name: 'semester_calendar',
      desc: '',
      args: [],
    );
  }

  /// `Monday`
  String get Monday {
    return Intl.message(
      'Monday',
      name: 'Monday',
      desc: '',
      args: [],
    );
  }

  /// `Tuesday`
  String get Tuesday {
    return Intl.message(
      'Tuesday',
      name: 'Tuesday',
      desc: '',
      args: [],
    );
  }

  /// `Wednesday`
  String get Wednesday {
    return Intl.message(
      'Wednesday',
      name: 'Wednesday',
      desc: '',
      args: [],
    );
  }

  /// `Thursday`
  String get Thursday {
    return Intl.message(
      'Thursday',
      name: 'Thursday',
      desc: '',
      args: [],
    );
  }

  /// `Friday`
  String get Friday {
    return Intl.message(
      'Friday',
      name: 'Friday',
      desc: '',
      args: [],
    );
  }

  /// `Saturday`
  String get Saturday {
    return Intl.message(
      'Saturday',
      name: 'Saturday',
      desc: '',
      args: [],
    );
  }

  /// `Sunday`
  String get Sunday {
    return Intl.message(
      'Sunday',
      name: 'Sunday',
      desc: '',
      args: [],
    );
  }

  /// `Today Courses`
  String get todayCourses {
    return Intl.message(
      'Today Courses',
      name: 'todayCourses',
      desc: '',
      args: [],
    );
  }

  /// `All Day Event`
  String get allDayEvent {
    return Intl.message(
      'All Day Event',
      name: 'allDayEvent',
      desc: '',
      args: [],
    );
  }

  /// `Multi Day End`
  String get multiDayEnd {
    return Intl.message(
      'Multi Day End',
      name: 'multiDayEnd',
      desc: '',
      args: [],
    );
  }

  /// `Show Quiz`
  String get showQuiz {
    return Intl.message(
      'Show Quiz',
      name: 'showQuiz',
      desc: '',
      args: [],
    );
  }

  /// `Question `
  String get question {
    return Intl.message(
      'Question ',
      name: 'question',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Quiz Report`
  String get quiz_report {
    return Intl.message(
      'Quiz Report',
      name: 'quiz_report',
      desc: '',
      args: [],
    );
  }

  /// `Remaining`
  String get remaining {
    return Intl.message(
      'Remaining',
      name: 'remaining',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get completed {
    return Intl.message(
      'Completed',
      name: 'completed',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `Progress`
  String get progress {
    return Intl.message(
      'Progress',
      name: 'progress',
      desc: '',
      args: [],
    );
  }

  /// `Failed`
  String get failed {
    return Intl.message(
      'Failed',
      name: 'failed',
      desc: '',
      args: [],
    );
  }

  /// `Correct`
  String get correct {
    return Intl.message(
      'Correct',
      name: 'correct',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect`
  String get incorrect {
    return Intl.message(
      'Incorrect',
      name: 'incorrect',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Submit Exam`
  String get submitExam {
    return Intl.message(
      'Submit Exam',
      name: 'submitExam',
      desc: '',
      args: [],
    );
  }

  /// `Hey, Are you sure want to submit this exam`
  String get sure_submit {
    return Intl.message(
      'Hey, Are you sure want to submit this exam',
      name: 'sure_submit',
      desc: '',
      args: [],
    );
  }

  /// `Let’s Check Your Preparation`
  String get checkYourPreparation {
    return Intl.message(
      'Let’s Check Your Preparation',
      name: 'checkYourPreparation',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get edit_profile {
    return Intl.message(
      'Edit Profile',
      name: 'edit_profile',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile Image`
  String get edit_image_profile {
    return Intl.message(
      'Edit Profile Image',
      name: 'edit_image_profile',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total_Questions {
    return Intl.message(
      'Total',
      name: 'total_Questions',
      desc: '',
      args: [],
    );
  }

  /// `Answered`
  String get answered {
    return Intl.message(
      'Answered',
      name: 'answered',
      desc: '',
      args: [],
    );
  }

  /// `See The Answer`
  String get see_the_answer {
    return Intl.message(
      'See The Answer',
      name: 'see_the_answer',
      desc: '',
      args: [],
    );
  }

  /// `Skipped`
  String get skipped {
    return Intl.message(
      'Skipped',
      name: 'skipped',
      desc: '',
      args: [],
    );
  }

  /// `Time`
  String get time {
    return Intl.message(
      'Time',
      name: 'time',
      desc: '',
      args: [],
    );
  }

  /// `Solutions`
  String get solutions {
    return Intl.message(
      'Solutions',
      name: 'solutions',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get details {
    return Intl.message(
      'Details',
      name: 'details',
      desc: '',
      args: [],
    );
  }

  /// `Mentors`
  String get mentors {
    return Intl.message(
      'Mentors',
      name: 'mentors',
      desc: '',
      args: [],
    );
  }

  /// `Subject`
  String get subject {
    return Intl.message(
      'Subject',
      name: 'subject',
      desc: '',
      args: [],
    );
  }

  /// `Preview`
  String get preview {
    return Intl.message(
      'Preview',
      name: 'preview',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Get Now`
  String get get_now {
    return Intl.message(
      'Get Now',
      name: 'get_now',
      desc: '',
      args: [],
    );
  }

  /// `SAR`
  String get currency {
    return Intl.message(
      'SAR',
      name: 'currency',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Date of birth`
  String get date_of_birth {
    return Intl.message(
      'Date of birth',
      name: 'date_of_birth',
      desc: '',
      args: [],
    );
  }

  /// `{number_of_courses} Course`
  String course(Object number_of_courses) {
    return Intl.message(
      '$number_of_courses Course',
      name: 'course',
      desc: '',
      args: [number_of_courses],
    );
  }

  /// `{number_of_hours} Hour`
  String hours(Object number_of_hours) {
    return Intl.message(
      '$number_of_hours Hour',
      name: 'hours',
      desc: '',
      args: [number_of_hours],
    );
  }

  /// `{number_of_lessons} Lesson`
  String lessons(Object number_of_lessons) {
    return Intl.message(
      '$number_of_lessons Lesson',
      name: 'lessons',
      desc: '',
      args: [number_of_lessons],
    );
  }

  /// `Setting`
  String get setting {
    return Intl.message(
      'Setting',
      name: 'setting',
      desc: '',
      args: [],
    );
  }

  /// `Payment`
  String get payment {
    return Intl.message(
      'Payment',
      name: 'payment',
      desc: '',
      args: [],
    );
  }

  /// `Bookmark`
  String get bookmark {
    return Intl.message(
      'Bookmark',
      name: 'bookmark',
      desc: '',
      args: [],
    );
  }

  /// `Notification`
  String get notification {
    return Intl.message(
      'Notification',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Privacy`
  String get privacy {
    return Intl.message(
      'Privacy',
      name: 'privacy',
      desc: '',
      args: [],
    );
  }

  /// `Help`
  String get help {
    return Intl.message(
      'Help',
      name: 'help',
      desc: '',
      args: [],
    );
  }

  /// `LogOut`
  String get logOut {
    return Intl.message(
      'LogOut',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }

  /// `Hello there`
  String get hello {
    return Intl.message(
      'Hello there',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `We are excited to see you here`
  String get exicited {
    return Intl.message(
      'We are excited to see you here',
      name: 'exicited',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
