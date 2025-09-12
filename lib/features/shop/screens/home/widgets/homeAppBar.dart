import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:online_shop/common/widgets/shimmer/shimmerEffets.dart';
import 'package:online_shop/features/personalization/controller/userController.dart';
import 'package:online_shop/utile/helpers/helper_functions.dart';
import '../../../../../common/widgets/AppBar/CustomAppbar.dart';
import '../../../../../common/widgets/products/cart/cartCounterIcon.dart';
import '../../../../../utile/const/colors.dart';
import '../../../../../utile/const/text.dart';

class MyHomeAppBar extends StatelessWidget {
  const MyHomeAppBar({super.key, required this.dark});

  final bool dark;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(userController());
    return MyAppbar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            MyHelperFunction.getGreetingMessage(),
            style: Theme.of(
              context,
            ).textTheme.titleMedium!.apply(color: Mycolors.grey),
          ),
          Obx(
            (){
              if(controller.profileLoading.value){
                return MyShimmerEffect(width: 80, height: 15);
              }
              return Text(
                controller.user.value.fullName,
                style: Theme.of(
                  context,
                ).textTheme.headlineSmall!.apply(color: Mycolors.grey),
              );
            }
          ),
        ],
      ),
      actions: [MyCardCounterIcon(dark: dark)],
    );
  }
}
