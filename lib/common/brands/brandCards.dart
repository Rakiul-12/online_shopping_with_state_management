import 'package:flutter/material.dart';
import '../../features/shop/models/brandModel.dart';
import '../../utile/const/enums.dart';
import '../../utile/const/sizes.dart';
import '../widgets/Images/roundedImage.dart';
import '../widgets/custom_shapes/rounded_container.dart';
import '../widgets/text/brandTitleWithVerifyIcon.dart';

class MyBrandCard extends StatelessWidget {
  const MyBrandCard({
    super.key,
    this.showBorder = true,
    this.onTap,
    required this.brand,
  });

  final bool showBorder;
  final VoidCallback? onTap;
  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: MyRoundedContainer(
        height: Mysize.brandCardHeight,
        showBorder: showBorder,
        padding: EdgeInsets.all(Mysize.sm),
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            Flexible(child: MyRoundedImge(
              imageUrl: brand.image,
              isNetworkImage: true,
              backgroundColor: Colors.transparent,
            )),

            SizedBox(width: Mysize.spaceBtwItems /2,),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  MyBrandTittleWithVerifyIcon(title: brand.name,brandTextSize: TextSize.large,),
                  Text("${brand.productsCount} products",style: Theme.of(context).textTheme.labelMedium,overflow: TextOverflow.ellipsis,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}