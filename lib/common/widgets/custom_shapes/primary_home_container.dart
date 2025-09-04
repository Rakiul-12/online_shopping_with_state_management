import 'package:flutter/material.dart';
import 'package:online_shop/common/widgets/custom_shapes/rounded_edges_container.dart';
import 'package:online_shop/utile/const/sizes.dart';
import 'circuler_container.dart';
import '../../../utile/const/colors.dart';


class MyPrimaryHeaderContainer extends StatelessWidget {
  const MyPrimaryHeaderContainer({
    super.key, required this.child,
    required this.height,
  });

  final Widget child;
  final double height;
  @override
  Widget build(BuildContext context) {
    return MyRoundedEdges(
      child: Container(
        height: height,
        color: Mycolors.primary,
        child: Stack(
          children: [
            Positioned(
              top: -150,
              right: -160,
              child: MyCirculerContainer(
                height: Mysize.homePrimaryHeaderHeight,
                width: Mysize.homePrimaryHeaderHeight,
                backgroundColor: Mycolors.white.withValues(alpha: .1),
              ),
            ),
            Positioned(
                top: 50,
                right: -250,
                child: MyCirculerContainer(
                  height: Mysize.homePrimaryHeaderHeight,
                  width: Mysize.homePrimaryHeaderHeight,
                  backgroundColor: Mycolors.white.withValues(alpha: .1),
                )
            ),
           child,
          ],
        ),
      ),
    );
  }
}
