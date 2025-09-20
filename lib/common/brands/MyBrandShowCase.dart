import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:online_shop/common/widgets/shimmer/shimmerEffets.dart';
import 'package:online_shop/features/shop/models/brandModel.dart';
import 'package:online_shop/features/shop/screens/Brands/BrandProducts.dart';
import 'package:online_shop/utile/helpers/helper_functions.dart';
import '../../utile/const/colors.dart';
import '../../utile/const/sizes.dart';
import '../widgets/custom_shapes/rounded_container.dart';
import 'brandCards.dart';

class MyBrandShowcase extends StatelessWidget {
  const MyBrandShowcase({super.key, required this.image, required this.brand});

  final List<String> image;
  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunction.isDarkMode(context);
    return InkWell(
      onTap: () => Get.to(()=>brandProdcuts(title: brand.name, brand: brand)),
      child: MyRoundedContainer(
        showBorder: true,
        borderColor: Mycolors.darkGrey,
        backgroundColor: Colors.transparent,
        padding: EdgeInsets.all(Mysize.md),
        margin: EdgeInsets.only(bottom: Mysize.spaceBtwItems),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyBrandCard(showBorder: false, brand: brand,),
            Row(
              children: image
                  .map((image) => buildBrandImage(dark, image))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Expanded buildBrandImage(bool dark, String image) {
    return Expanded(
      child: MyRoundedContainer(
          height: 100,
          margin: EdgeInsets.only(right: Mysize.sm),
          padding: EdgeInsets.all(Mysize.md),
          backgroundColor: dark ? Mycolors.darkGrey : Mycolors.light,
          child: CachedNetworkImage(imageUrl: image,
            errorWidget: (context, url, error) => Icon(Icons.error),
            fit: BoxFit.contain,
            progressIndicatorBuilder: (context, url, progress) =>
                MyShimmerEffect(width: 100, height: 100),)),
    );
  }
}
