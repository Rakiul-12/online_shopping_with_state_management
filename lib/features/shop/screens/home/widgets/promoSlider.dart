import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:online_shop/common/widgets/shimmer/shimmerEffets.dart';
import 'package:online_shop/features/shop/controller/banner/bannerController.dart';
import '../../../../../common/widgets/Images/roundedImage.dart';
import '../../../../../utile/const/sizes.dart';
import 'bannerDotNavigation.dart';

class MyPromoSlider extends StatelessWidget {
  const MyPromoSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final bannerController = Get.put(BannerController());

    return Obx(() {
      if (bannerController.isLoadingBanner.value) {
        return MyShimmerEffect(width: double.infinity, height: 190);
      }
      if (bannerController.banners.isEmpty) {
        return Text("No banners found");
      }
      return Column(
        children: [
          CarouselSlider(
            items: bannerController.banners
                .map(
                  (banner) => MyRoundedImge(
                    imageUrl: banner.imageUrl,
                    isNetworkImage: true,
                    onPressed: ()=>Get.toNamed(banner.targetScreen),
                  ),
                )
                .toList(),
            options: CarouselOptions(
              viewportFraction: 1.0,
              onPageChanged: (index, reason) =>
                  bannerController.onPagedChanged(index),
            ),
            carouselController: bannerController.carousalController,
          ),
          SizedBox(height: Mysize.spaceBtwItems),
          BannerDotIndicator(),
        ],
      );
    });
  }
}
