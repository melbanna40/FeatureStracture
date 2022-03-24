import 'package:flutter/material.dart';
import 'package:byaan/features/calender/presentation/ui/calender_screen.dart';
import 'package:byaan/features/home/presentation/ui/home_screen.dart';
import 'package:byaan/features/my_courses/presentation/ui/my_courses_screen.dart';
import 'package:byaan/features/profile/presentation/ui/profile_screen.dart';
import 'package:byaan/res/m_colors.dart';
import 'package:byaan/features/home/presentation/widgets/bottombar_item.dart';

class MainScreen extends StatefulWidget {
  final VoidCallback? openDrawer;

  const MainScreen(this.openDrawer, {Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  int activeTab = 0;
  late List barItems;

//====== set animation=====
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void initState() {
    barItems = [
      {
        "icon": "assets/icons/home.svg",
        "active_icon": "assets/icons/home.svg",
        "page": HomeScreen(widget.openDrawer),
      },
      // {
      //   "icon": "assets/icons/search.svg",
      //   "active_icon": "assets/icons/search.svg",
      //   "page": Container(),
      // },
      {
        "icon": "assets/icons/play.svg",
        "active_icon": "assets/icons/play.svg",
        "page": const MyCoursesScreen(),
      },
      {
        "icon": "assets/icons/ic_calendar.svg",
        "active_icon": "assets/icons/ic_calendar.svg",
        "page": const CalenderScreen(),
        // "page": ChatPage(),
      },
      {
        "icon": "assets/icons/profile.svg",
        "active_icon": "assets/icons/profile.svg",
        "page": const ProfileScreen(),
        // "page": AccountPage(),
      },
    ];
    super.initState();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.stop();
    _controller.dispose();
    super.dispose();
  }

  animatedPage(page) {
    return FadeTransition(child: page, opacity: _animation);
  }

  void onPageChanged(int index) {
    _controller.reset();
    setState(() {
      activeTab = index;
    });
    _controller.forward();
  }

//====== end set animation=====

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MColors.appBgColor,
        bottomNavigationBar: getBottomBar(),
        body: getBarPage());
  }

  Widget getBarPage() {
    return IndexedStack(
        index: activeTab,
        children: List.generate(
            barItems.length, (index) => animatedPage(barItems[index]["page"])));
  }

  Widget getBottomBar() {
    return Container(
      height: 75,
      width: double.infinity,
      decoration: BoxDecoration(
          color: MColors.bottomBarColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
          boxShadow: [
            BoxShadow(
              color: MColors.shadowColor.withOpacity(0.1),
              blurRadius: 1,
              spreadRadius: 1,
              offset: const Offset(1, 1),
            )
          ]),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 25,
          right: 25,
          bottom: 15,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            barItems.length,
            (index) => BottomBarItem(
              barItems[index]["icon"],
              isActive: activeTab == index,
              activeColor: MColors.bottomBarActiveColor,
              onTap: () {
                onPageChanged(index);
              },
            ),
          ),
        ),
      ),
    );
  }
}
