import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kafey/CommonUtils/image_utils.dart';
import 'package:kafey/CommonUtils/m_svg_icons_icons.dart';
import 'package:kafey/generated/l10n.dart';
import 'package:kafey/res/m_colors.dart';

import 'cubit/main_cubit.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    List<Widget> appBarTitles = [
      Text(
        S.of(context).home,
        style: TextStyle(
            color: MColors.colorPrimarySwatch,
            fontWeight: FontWeight.bold,
            fontSize: 20),
      ),
      Text(
        S.of(context).myTeams,
        style: TextStyle(
            color: MColors.colorPrimarySwatch,
            fontWeight: FontWeight.bold,
            fontSize: 20),
      ),
      Text(
        S.of(context).attendance,
        style: TextStyle(
            color: MColors.colorPrimarySwatch,
            fontWeight: FontWeight.bold,
            fontSize: 20),
      ),
      Text(
        S.of(context).notification,
        style: TextStyle(
            color: MColors.colorPrimarySwatch,
            fontWeight: FontWeight.bold,
            fontSize: 20),
      ),
      Text(
        S.of(context).more,
        style: TextStyle(
            color: MColors.colorPrimarySwatch,
            fontWeight: FontWeight.bold,
            fontSize: 20),
      ),
    ];
    return BlocProvider(
        create: (BuildContext context) => MainCubit(),
        child: BlocConsumer<MainCubit, MainState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = BlocProvider.of<MainCubit>(context);
            return Scaffold(
              key: _scaffoldKey,
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                title: appBarTitles[cubit.currentIndex],
                centerTitle: true,
                leading: SvgPicture.asset(
                  ImageUtils.getSVGPath('ic_logo'),
                  width: 20,
                  height: 20,
                ),
              ),
              bottomNavigationBar: CurvedNavigationBar(
                index: 0,
                height: 60.0,
                items: <Widget>[
                  Container(
                    margin: const EdgeInsets.all(4),
                    child: SvgPicture.asset(
                      ImageUtils.getSVGPath('home_icon'),
                      color: cubit.currentIndex == 0
                          ? Colors.white
                          : MColors.colorPrimarySwatch,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(4),
                    child: Icon(
                      MSvgIcons.users,
                      color: cubit.currentIndex == 1
                          ? Colors.white
                          : MColors.colorPrimarySwatch,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(4),
                    child: Icon(
                      MSvgIcons.clipboard_list,
                      color: cubit.currentIndex == 2
                          ? Colors.white
                          : MColors.colorPrimarySwatch,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(4),
                    child: Icon(
                      MSvgIcons.notifications_active,
                      color: cubit.currentIndex == 3
                          ? Colors.white
                          : MColors.colorPrimarySwatch,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(4),
                    child: Icon(
                      CupertinoIcons.square_list,
                      color: cubit.currentIndex == 4
                          ? Colors.white
                          : MColors.colorPrimarySwatch,
                    ),
                  ),
                ],
                color: Colors.white,
                buttonBackgroundColor: MColors.colorPrimarySwatch,
                backgroundColor: Colors.white,
                animationCurve: Curves.elasticIn,
                animationDuration: const Duration(milliseconds: 200),
                onTap: (index) {
                  cubit.changeBottomNavBar(index);
                },
                letIndexChange: (index) => true,
              ),
              body: cubit.screens[cubit.currentIndex],
            );
          },
        ));
  }
}
