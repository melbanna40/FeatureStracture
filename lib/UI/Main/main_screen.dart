import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cubit_template/CommonUtils/image_utils.dart';
import 'package:cubit_template/generated/l10n.dart';
import 'package:cubit_template/res/m_colors.dart';

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
        S.of(context).orders,
        style: TextStyle(
            color: MColors.colorPrimarySwatch,
            fontWeight: FontWeight.bold,
            fontSize: 20),
      ),
      Text(
        // S.of(context).addNewProduct,
        "",
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
        S.of(context).chat,
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
                leading: InkWell(
                  onTap: () {
                    _scaffoldKey.currentState!.openDrawer();
                  },
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Icon(
                          CupertinoIcons.text_aligncenter,
                          color: MColors.colorPrimarySwatch,
                        )),
                  ),
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
                    child: SvgPicture.asset(
                      ImageUtils.getSVGPath('notification_icon'),
                      color: cubit.currentIndex == 1
                          ? Colors.white
                          : MColors.colorPrimarySwatch,
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.all(4),
                      child: Icon(
                        CupertinoIcons.chat_bubble_2_fill,
                        color: cubit.currentIndex == 2
                            ? Colors.white
                            : MColors.colorPrimarySwatch,
                      )

                      // SvgPicture.asset(
                      //   ImageUtils.getSVGPath('setting_icon'),
                      //   color: cubit.currentIndex == 4
                      //       ? Colors.white
                      //       : MColors.colorPrimarySwatch,
                      // ),
                      ),
                ],
                color: Colors.white,
                buttonBackgroundColor: MColors.colorPrimarySwatch,
                backgroundColor: Colors.white,
                animationCurve: Curves.easeInOut,
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
