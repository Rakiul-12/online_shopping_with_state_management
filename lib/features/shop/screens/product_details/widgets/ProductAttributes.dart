import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:online_shop/common/widgets/custom_shapes/rounded_container.dart';
import 'package:online_shop/common/widgets/text/productText.dart';
import 'package:online_shop/common/widgets/text/product_price.dart';
import 'package:online_shop/common/widgets/text/sectionHeading.dart';
import 'package:online_shop/features/shop/controller/productController/variationController.dart';
import 'package:online_shop/features/shop/models/productModel.dart';
import 'package:online_shop/utile/const/colors.dart';
import 'package:online_shop/utile/const/sizes.dart';
import '../../../../../common/widgets/Chips/choicheChips.dart';
import '../../../../../utile/helpers/helper_functions.dart';

class productAttributes extends StatelessWidget {
  const productAttributes({super.key, required this.product});


  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunction.isDarkMode(context);
    final controller = Get.put(variationController());
    return Column(
      children: [
        MyRoundedContainer(
          padding: EdgeInsets.all(Mysize.md),
          backgroundColor: dark ? Mycolors.darkerGrey : Mycolors.grey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  MySectionHeading(title: "Variation",showActionBtn: false,),
                  SizedBox(width: Mysize.spaceBtwItems,),
                  Column(
                    children: [
                      Row(
                        children: [
                          MyProducttitleText(title: "Price: ", smallSize: true,),
                          Text(" \$250",style: Theme.of(context).textTheme.titleSmall!.apply(
                              decoration:TextDecoration.lineThrough
                          ),),
                          SizedBox(width: Mysize.spaceBtwItems,),
                          MyProductPriceText(price: "2000")
                        ],
                      ),
                      Row(
                        children: [
                          MyProducttitleText(title: "Stock: ", smallSize: true,),
                          Text(" In Stock",style: Theme.of(context).textTheme.titleMedium,)
                        ],
                      )
                    ],
                  )
                ],
              ),
              MyProducttitleText(title: "This is a product of iPhone 11 with 512 GB",smallSize: true,maxLines: 1,)
            ],
          ),
        ),
        SizedBox(height: Mysize.spaceBtwItems,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: product.productAttributes!.map((attribute) {
           return Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               MySectionHeading(title: attribute.name ?? "",showActionBtn: false,),
               SizedBox(height: Mysize.spaceBtwItems / 2,),
               Wrap(
                 spacing: Mysize.sm,
                 children: attribute.values!.map((attributeValue) {
                   bool isSelected = controller.selectedAttributes[attribute.name] == attributeValue;
                   return MyChoiceChip(
                       text: attributeValue,
                       selected: isSelected,
                       onSelected: (value){}
                   );
                 },).toList()
               )
             ],
           );
          }).toList()
        ),
        SizedBox(height: Mysize.spaceBtwItems,),
        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     MySectionHeading(title: "Sizes",showActionBtn: false,),
        //     SizedBox(height: Mysize.spaceBtwItems / 2,),
        //     Wrap(
        //       spacing: Mysize.sm,
        //       children: [
        //         MyChoiceChip(
        //             text: "Small",
        //             selected: false,
        //             onSelected: (value){}
        //         ),
        //         MyChoiceChip(
        //             text: "Medium",
        //             selected: false,
        //             onSelected: (value){}
        //         ),
        //         MyChoiceChip(
        //             text: "Large",
        //             selected: false,
        //             onSelected: (value){}
        //         ),
        //       ],
        //     )
        //   ],
        // )
      ],
    );
  }
}


