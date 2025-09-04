import 'package:flutter/material.dart';
import '../../../utile/const/sizes.dart';

class MyGridLayout extends StatelessWidget {
  const MyGridLayout({
    super.key,
    required this.itemCount,
    this.mainAxisExtent = 288,
    required this.itemBuilder,
  });

  final int itemCount;
  final double? mainAxisExtent;
  final Widget Function(BuildContext context,int index)itemBuilder;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: mainAxisExtent,
          mainAxisSpacing: Mysize.gridViewSpacing,
          crossAxisSpacing: Mysize.gridViewSpacing
      ),
      itemBuilder: itemBuilder
    );
  }
}