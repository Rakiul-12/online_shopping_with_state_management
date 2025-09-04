import 'package:flutter/material.dart';
import 'package:online_shop/common/widgets/AppBar/CustomAppbar.dart';
import 'package:online_shop/common/widgets/Button/elevatedButton.dart';
import 'package:online_shop/common/widgets/style/padding.dart';
import 'package:online_shop/common/widgets/text/product_price.dart';
import 'package:online_shop/utile/const/sizes.dart';
import '../../../../common/widgets/products/cart/MyProductQuantityAddAndRemove.dart';
import '../../../../common/widgets/products/cart/cartItem.dart';

class cartScreen extends StatelessWidget {
  const cartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(
        showBackArrow: true,
        title: Text("Cart",style: Theme.of(context).textTheme.headlineMedium,),
      ),
      body: Padding(
        padding: MyPadding.screenPadding,
        child: ListView.separated(
          itemCount: 3,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  MyCardItem(),

                  // price and counter item
                  SizedBox(height: Mysize.spaceBtwItems,),
                  Row(
                    children: [
                      SizedBox(width: 70,),
                      MyProductQuantityAddAndRemove(),
                      Spacer(),
                      MyProductPriceText(price: "2000")
                    ],
                  )
                ],
              );
            }, separatorBuilder: (context, index) =>SizedBox(height: Mysize.spaceBtwSections,),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(Mysize.defaultSpace),
        child: MyElevatedButton(onPressed: (){}, child: Text("Checkout \$6000")),
      ),
    );
  }
}




