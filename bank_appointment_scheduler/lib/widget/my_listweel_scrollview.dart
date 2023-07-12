import 'package:flutter/material.dart';

class MyListWheelScrollView extends StatelessWidget {
  final double itemExtent = 40;
  final double diameterRatio = 1.5;
  final double perspective = 0.002;
  final double magnification = 1.3;
  final double overAndUnderCenterOpacity = 0.5;
  final bool useMagnifier = true;
  final ScrollPhysics physics = const FixedExtentScrollPhysics();
  final ValueChanged<int> onSelectedItemChanged;
  final List<Widget> children;

  const MyListWheelScrollView({
    super.key,
    required this.onSelectedItemChanged,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return ListWheelScrollView(
      itemExtent: itemExtent,
      diameterRatio: diameterRatio,
      perspective: perspective,
      magnification: magnification,
      overAndUnderCenterOpacity: overAndUnderCenterOpacity,
      useMagnifier: useMagnifier,
      physics: physics,
      onSelectedItemChanged: onSelectedItemChanged,
      children: children,
    );
  }
}
