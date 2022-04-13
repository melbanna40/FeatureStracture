import 'package:byaan/features/auth/login/ui/login_screen.dart';
import 'package:byaan/features/auth/signup/ui/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:byaan/res/gaps.dart';

import '../../../widgets/hex_color.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  String? selectedDate;
  bool obscure = true;

  TabController? _cardController;

  @override
  void initState() {
    _cardController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#f9fafa"),
      body: Container(
        padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
        child: Column(
          children: [
            Container(
              height: 60,
              decoration: const BoxDecoration(
                color: Color(0xfff2f2f3),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: TabBar(
                isScrollable: false,
                labelStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                onTap: (int index) {},
                indicatorColor: const Color(0xfff2f2f3),
                indicatorSize: TabBarIndicatorSize.tab,
                padding: const EdgeInsets.symmetric(horizontal: 7),
                indicator: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),

                // UnderlineTabIndicator(
                //
                //     borderSide:
                //         BorderSide(color: Colors.white, width: 30),),
                labelColor: Colors.blue,
                indicatorPadding: const EdgeInsets.symmetric(vertical: 4),
                unselectedLabelColor: Colors.black87,
                controller: _cardController,
                tabs: List.generate(
                  getTaps(context).length,
                  (index) => getTaps(context)[index],
                ),
              ),
            ),
            Gaps.vGap12,
            Expanded(
              child: TabBarView(
                controller: _cardController,
                children: List.generate(2, (index) {
                  if (index == 0) {
                    return const LoginScreen();
                  } else if (index == 1) {
                    return const SignupScreen();
                  } else {
                    return const SizedBox();
                  }
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => false;

  getTaps(BuildContext context) {
    return [
      const Text(
        "Sign In",
        style: TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        textAlign: TextAlign.center,
      ),
      const Text(
        "Sign Up",
        style: TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        textAlign: TextAlign.center,
      ),
    ];
  }
}
