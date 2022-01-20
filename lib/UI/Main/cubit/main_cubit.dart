import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafey/UI/main_screens/attendance/attendance_screen.dart';
import 'package:kafey/UI/main_screens/home/home_screen.dart';
import 'package:kafey/UI/main_screens/leaves/leaves_screen.dart';
import 'package:kafey/UI/main_screens/notifications/notification_screen.dart';
import 'package:meta/meta.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());

  int currentIndex = 2;
  List<Widget> screens = [
    Container(),
    NotificationsScreen(),
    HomeScreen(),
    LeavesScreen(),
    AttendanceScreen(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(MainBottomNavState());
  }
}
