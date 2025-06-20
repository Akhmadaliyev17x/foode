import 'package:flutter/material.dart';

class BackgroundContainer extends StatelessWidget {
  const BackgroundContainer(
      {super.key, required this.child, this.backgroundColor});
  final Widget child;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: backgroundColor ?? Colors.grey.withAlpha(30),
          borderRadius: BorderRadius.circular(8)),
      width: double.maxFinite,
      padding: const EdgeInsets.all(6),
      child: child,
    );
  }
}
