import 'package:flutter/material.dart';
import 'package:online_shop/utile/const/colors.dart';
import 'package:online_shop/utile/const/sizes.dart';

class MyCircularLoader extends StatelessWidget {
  const MyCircularLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(Mysize.lg),
        decoration: const BoxDecoration(
            color: Mycolors.primary,
            shape: BoxShape.circle
        ),
        child: const CircularProgressIndicator(color: Mycolors.white,)
    );
  }
}
