import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NeuBox extends StatelessWidget {
  final Widget? child;

  const NeuBox({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          // darker shadow on bottom right
          BoxShadow(
            color: Colors.grey.shade500,
            blurRadius: 15,
            offset: const Offset(4, 4),
          ), // BoxShadow

          // lighter shadow on top left
          BoxShadow(
            color: Colors.white,
            blurRadius: 15,
            offset: const Offset(-4, -4),
          ), // BoxShadow
        ], // boxShadow
      ), // BoxDecoration
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        child: child,
      ),
    ); // Container
  }
}
