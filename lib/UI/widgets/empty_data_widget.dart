import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kafey/CommonUtils/image_utils.dart';
import 'package:kafey/generated/l10n.dart';
import 'package:kafey/res/gaps.dart';
import 'package:kafey/res/m_colors.dart';

class EmptyDataWidget extends StatefulWidget {
  Function? onRefreshClicked;

  EmptyDataWidget({Key? key, this.onRefreshClicked}) : super(key: key);

  @override
  _EmptyDataWidgetState createState() => _EmptyDataWidgetState();
}

class _EmptyDataWidgetState extends State<EmptyDataWidget>
    with TickerProviderStateMixin {
  // late final AnimationController _controller = AnimationController(
  //   duration: const Duration(milliseconds: 800),
  //   vsync: this,
  // )..repeat(reverse: true);
  // late final Animation<double> _animation = CurvedAnimation(
  //   parent: _controller,
  //   curve: Curves.easeIn,
  // );

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            ImageUtils.getSVGPath('ic_kafey_logo'),
            width: 100,
            height: 100,
            color: Colors.grey,
          ),
          Gaps.vGap16,
          Text(S.of(context).empty_data),
          Gaps.vGap16,
          Container(
            width: 200,
            decoration: BoxDecoration(
                color: MColors.colorPrimarySwatch,
                borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(8), right: Radius.circular(8))),
            child: MaterialButton(
                child: Text(
                  S.of(context).refresh,
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  widget.onRefreshClicked?.call();
                }),
          ),
        ],
      ),
    );
  }
}
