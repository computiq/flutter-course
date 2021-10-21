import 'package:flutter/material.dart';

class GradientContainerWidget extends StatelessWidget {
  const GradientContainerWidget(
      {Key? key, required this.color, required this.child})
      : super(key: key);

  final Widget child;
  final MaterialColor color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: const [0, 1.0],
          colors: [
            color.shade800,
            color.shade400,
          ],
        ),
      ),
      child: child,
    );
  }
}
