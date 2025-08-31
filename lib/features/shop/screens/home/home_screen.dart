import 'package:flutter/material.dart';
import 'package:online_shop/features/shop/screens/home/widgets/homeAppBar.dart';
import 'package:online_shop/features/shop/screens/home/widgets/primary_home_container.dart';
import 'package:online_shop/utile/const/sizes.dart';
import 'package:online_shop/utile/helpers/helper_functions.dart';
import '../../../../common/widgets/SearchBar/SearchBar.dart';


class home_screen extends StatelessWidget {
  const home_screen({super.key});

  @override
  Widget build(BuildContext context) {
    bool dark = MyHeplerFunction.isDarkMode(context);
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(height: Mysize.homePrimaryHeaderHeight + 10,),

          MyPrimaryHeaderContainer(
            child: Column(
              children: [
                MyHomeAppBar(dark: dark),
              ],
            ),
          ),

          MySearchBar()
        ],
      )
    );
  }
}





