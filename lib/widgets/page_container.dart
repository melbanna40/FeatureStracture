import 'package:flutter/material.dart';

import '../res/m_colors.dart';

class PageContainer extends StatelessWidget {
  final Widget child;
  const PageContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: MColors.mainColor,
        child: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            child: child,
          ),
        ));
  }
}
