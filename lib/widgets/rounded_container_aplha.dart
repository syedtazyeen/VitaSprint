import 'package:flutter/material.dart';

class RoundedContainerAlpha extends StatelessWidget {
  final Widget child;
  const RoundedContainerAlpha({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(.035),
          borderRadius: BorderRadius.circular(24)),
      child: child,
    );
  }
}
