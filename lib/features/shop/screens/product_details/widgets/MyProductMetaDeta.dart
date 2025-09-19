import 'package:flutter/material.dart';
import 'package:online_shop/features/shop/controller/productController/productController.dart';
import 'package:online_shop/features/shop/models/productModel.dart';
import 'package:online_shop/utile/const/enums.dart';
import 'package:online_shop/utile/const/keys.dart';
import 'package:online_shop/utile/const/text.dart';
import '../../../../../common/widgets/Images/circular_imae.dart';
import '../../../../../common/widgets/custom_shapes/rounded_container.dart';
import '../../../../../common/widgets/text/brandTitleWithVerifyIcon.dart';
import '../../../../../common/widgets/text/productText.dart';
import '../../../../../common/widgets/text/product_price.dart';
import '../../../../../utile/const/colors.dart';
import '../../../../../utile/const/image.dart';
import '../../../../../utile/const/sizes.dart';

class MyProductMetaDeta extends StatelessWidget {
  const MyProductMetaDeta({
    super.key, required this.product,
  });


  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = productController.instance;
    String? salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if(salePercentage != null)...[
              MyRoundedContainer(
                radius: Mysize.sm,
                backgroundColor: Mycolors.yellow.withValues(alpha: .8),
                padding: EdgeInsets.symmetric(
                  horizontal: Mysize.sm,
                  vertical: Mysize.xs,
                ),
                child: Text(
                  "$salePercentage%",
                  style: Theme.of(
                    context,
                  ).textTheme.labelLarge!.apply(color: Mycolors.black),
                ),
              ),
              SizedBox(width: Mysize.spaceBtwItems,),
            ],

            // sale price
            
            if(product.productType == ProductType.single.toString() && product.salePrice > 0)...[
              Text("${MyText.currency}${product.price.toStringAsFixed(0)}",style: Theme.of(context).textTheme.titleSmall!.apply(
                  decoration: TextDecoration.lineThrough
              ),),
              SizedBox(width: Mysize.spaceBtwItems,),
            ],

            // sale price
            MyProductPriceText(price: controller.getProductPrice(product),isLarge: true,),
            Spacer(),
            IconButton(onPressed: (){}, icon: Icon(Icons.share))
          ],
        ),
        SizedBox(height: Mysize.spaceBtwItems / 1.5,),
        MyProducttitleText(title: product.title),
        SizedBox(height: Mysize.spaceBtwItems /2,),
        Row(
          children: [
            MyProducttitleText(title: "Status"),
            SizedBox(width: Mysize.spaceBtwItems,),
            Text(controller.getProductStockStatus(product.stock),style: Theme.of(context).textTheme.titleMedium,)
          ],
        ),
        SizedBox(height: Mysize.spaceBtwItems /1.5,),
        Row(
          children: [
            MyCirculerImage(
              padding: 0,
              isNetworkImage: true,
              image: product.brand != null ? product.brand!.image : "",height: 32,width: 32,),
            SizedBox(width: Mysize.spaceBtwItems,),
            MyBrandTittleWithVerifyIcon(title: product.brand != null ? product.brand!.name : "")
          ],
        )
      ],
    );
  }
}