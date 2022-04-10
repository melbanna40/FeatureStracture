import 'package:flutter/widgets.dart';

class SlideIn extends StatefulWidget {
  const SlideIn({
    Key? key,
    required this.child,
    this.duration = const Duration(milliseconds: 1000),
    this.msDelay = 1000,
  }) : super(key: key);

  final Widget child;
  final Duration duration;
  final int msDelay;

  @override
  _SlideInState createState() => _SlideInState();
}

class _SlideInState extends State<SlideIn> with SingleTickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration + Duration(milliseconds: widget.msDelay),
    );
    _animationController?.drive(
      CurveTween(curve: Curves.easeInOut),
    );
    _animationController?.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController!,
      builder: (BuildContext context, Widget? child) {
        final translateY = 1 / 2 * (1 - _animationController!.value);
        return Transform(
          transform: Matrix4.identity()..translate(0.0, translateY),
          child: widget.child,
        );
      },
    );
  }
}
