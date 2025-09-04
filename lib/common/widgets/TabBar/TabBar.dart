import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utile/const/colors.dart';
import '../../../utile/helpers/device_helper.dart';
import '../../../utile/helpers/helper_functions.dart';

class MyCustonTabBar extends StatelessWidget implements PreferredSizeWidget {
  const MyCustonTabBar({
    super.key,
    required this.tabs,
  });

  final List<Widget> tabs;
  @override
  Widget build(BuildContext context) {
    final dark = MyHeplerFunction.isDarkMode(context);
    return Material(
      color: dark ? Mycolors.black :  Mycolors.white,

      child: TabBar(
          labelColor: dark ? Mycolors.white : Mycolors.primary,
          unselectedLabelColor: Mycolors.darkGrey,
          indicatorColor: Mycolors.primary,
          isScrollable: true,
          tabs: tabs
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(MyDeviceHelper.getAppBarHeight());
}