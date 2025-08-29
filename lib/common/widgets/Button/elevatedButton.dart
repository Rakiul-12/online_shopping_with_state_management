import 'package:flutter/material.dart';
import 'package:online_shop/utile/helpers/device_helper.dart';


class MyElevatedButton extends StatelessWidget {
  const MyElevatedButton({
    super.key, required this.onPressed, required this.child,
  });

  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MyDeviceHelper.getScreenWidth(context),
        child: ElevatedButton(onPressed: onPressed, child: child));

  }
}