import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:online_shop/common/widgets/custom_shapes/rounded_container.dart';
import 'package:online_shop/common/widgets/loader/MyAnimationLoader.dart';
import 'package:online_shop/features/shop/controller/order/orderController.dart';
import 'package:online_shop/features/shop/models/orderModel.dart';
import 'package:online_shop/navigation_menu.dart';
import 'package:online_shop/utile/const/colors.dart';
import 'package:online_shop/utile/const/image.dart';
import 'package:online_shop/utile/const/sizes.dart';
import 'package:online_shop/utile/helpers/cloudHelperFunction.dart';
import 'package:online_shop/utile/helpers/helper_functions.dart';

class order_list extends StatelessWidget {
  const order_list({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunction.isDarkMode(context);
    final controller = Get.put(OrderController());
    return FutureBuilder(
        future: controller.fetchUserOrder(),
        builder: (context, snapshot) {

          // handle error and loading and empty state
          final nothingFound = MyAnimationLoader(
            text: "No order yet!",
            showActionButton: true,
            animation: MyImage.pencilAnimation,
            actionText: "Let's fill it",
            onActionPressed: ()=> Get.offAll(()=> navigationMenuScreen()),
          );
          final widget = myCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,nothingFound: nothingFound);
          if(widget != null) return widget;

          List<OrderModel> orders = snapshot.data!;
          return ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                OrderModel order = orders[index];
                return MyRoundedContainer(
                  showBorder: true,
                  backgroundColor: dark ? Mycolors.dark : Mycolors.light,
                  padding: EdgeInsets.all(Mysize.md),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Icon(Iconsax.ship),
                          SizedBox(width: Mysize.spaceBtwItems),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  order.orderStatusText,
                                  style: Theme.of(context).textTheme.bodyLarge!
                                      .apply(
                                    color: Mycolors.primary,
                                    fontWeightDelta: 1,
                                  ),
                                ),
                                Text(order.formattedOrderDate),
                              ],
                            ),
                          ),
                          Icon(
                            Iconsax.arrow_right_34,
                            color: Mycolors.darkGrey,
                            size: Mysize.iconSm,
                          ),
                        ],
                      ),
                      SizedBox(height: Mysize.spaceBtwItems / 1),
                      Row(
                        children: [
                          Icon(Iconsax.tag),
                          SizedBox(width: Mysize.spaceBtwItems),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Order",
                                  style: Theme.of(context).textTheme.labelMedium!
                                      .apply(
                                    color: Mycolors.darkGrey,
                                    fontWeightDelta: 1,
                                  ),
                                ),
                                Text(
                                  order.id,
                                  style: Theme.of(context).textTheme.titleMedium,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Iconsax.calendar_1),
                              SizedBox(width: Mysize.spaceBtwItems),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Order",
                                    style: Theme.of(context).textTheme.bodyLarge!
                                        .apply(
                                      color: Mycolors.darkGrey,
                                      fontWeightDelta: 1,
                                    ),
                                  ),
                                  Text(
                                    order.formattedDeliveryDate,
                                    style: Theme.of(context).textTheme.titleMedium,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: Mysize.spaceBtwItems,),
              itemCount: orders.length
          );
        },
    );
  }
}
