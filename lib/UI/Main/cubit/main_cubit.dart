import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafey/UI/main_screens/home/home_screen.dart';
import 'package:meta/meta.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());

  int currentIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    Container(),
    Container(),
    Container(),
    Container(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(MainBottomNavState());
  }
}
