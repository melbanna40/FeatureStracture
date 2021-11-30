import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meta/meta.dart';
import 'package:cubit_template/CommonUtils/image_utils.dart';

 import 'package:cubit_template/res/m_colors.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());

  // static MainCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> bottomItems = [
    SvgPicture.asset(ImageUtils.getSVGPath('home_icon'),
        color: MColors.colorPrimarySwatch),
    SvgPicture.asset(
      ImageUtils.getSVGPath('notification_icon'),
    ),
    SvgPicture.asset(
      ImageUtils.getSVGPath('setting_icon'),
    ),
  ];

  List<Widget> appBarTitles = [
    Text(
      "الرئيسية",
      style: TextStyle(
          color: MColors.colorPrimarySwatch,
          fontWeight: FontWeight.bold,
          fontSize: 20),
    ),
    Text(
      "الإشعارات",
      style: TextStyle(
          color: MColors.colorPrimarySwatch,
          fontWeight: FontWeight.bold,
          fontSize: 20),
    ),
    Text(
      "الإعدادات",
      style: TextStyle(
          color: MColors.colorPrimarySwatch,
          fontWeight: FontWeight.bold,
          fontSize: 20),
    ),
  ];
  List<Widget> screens = [
    Container(),
    Container(),
    Container(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;

    emit(MainBottomNavState());
  }
}
