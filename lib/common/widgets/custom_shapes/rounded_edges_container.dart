import 'package:flutter/material.dart';
import 'package:online_shop/common/widgets/custom_shapes/Clipper.dart';

class MyRoundedEdges extends StatelessWidget {
  const MyRoundedEdges({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyCustomRoundedEdges(),
      child: child,
    );
  }
}
