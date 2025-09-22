import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/products/cart/MyProductQuantityAddAndRemove.dart';
import '../../../../../common/widgets/products/cart/cartItem.dart';
import '../../../../../common/widgets/text/product_price.dart';
import '../../../../../utile/const/sizes.dart';
import '../../../controller/cart/cartController.dart';

class MyCardItems extends StatelessWidget {
  const MyCardItems({super.key, this.showAddRemoveBtn = true});

  final bool showAddRemoveBtn;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: controller.cartItems.length,
      itemBuilder: (context, index) {
        return Obx(
            (){
              final cartItem = controller.cartItems[index];
              return Column(
                children: [
                  MyCardItem(cartItem: cartItem,),

                  // price and counter item
                  if (showAddRemoveBtn) SizedBox(height: Mysize.spaceBtwItems),
                  if (showAddRemoveBtn)
                    Row(
                      children: [
                        SizedBox(width: 70),
                        MyProductQuantityAddAndRemove(
                          quantity: cartItem.quantity,
                          add: ()=>controller.addOneItemToCart(cartItem),
                          remove: ()=>controller.removeOneItemToCart(cartItem),
                        ),
                        Spacer(),
                        MyProductPriceText(price:( cartItem.price * cartItem.quantity).toStringAsFixed(0)),
                      ],
                    ),
                ],
              );
            }
        );
      },
      separatorBuilder: (context, index) =>
          SizedBox(height: Mysize.spaceBtwSections),
    );
  }
}
