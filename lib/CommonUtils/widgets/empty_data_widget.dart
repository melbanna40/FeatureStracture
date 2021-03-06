import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:byaan/CommonUtils/image_utils.dart';
import 'package:byaan/generated/l10n.dart';
import 'package:byaan/res/gaps.dart';
import 'package:byaan/res/m_colors.dart';

class EmptyDataWidget extends StatefulWidget {
  final String? message;
  final Function? onRefreshClicked;

  const EmptyDataWidget({Key? key, this.onRefreshClicked, this.message}) : super(key: key);

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
            ImageUtils.getImagePath('ic_kafey_logo', format: 'svg'),
            width: 100,
            height: 100,
            color: Colors.grey,
          ),
          Gaps.vGap16,
          Text(widget.message??S.of(context).empty_data),
          Gaps.vGap16,
          Container(
            width: 200,
            decoration: const BoxDecoration(
                color: MColors.colorPrimarySwatch,
                borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(8), right: Radius.circular(8))),
            child: MaterialButton(
                child: Text(
                  S.of(context).refresh,
                  style: const TextStyle(color: Colors.white),
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
