import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:online_shop/features/shop/controller/home/home_controller.dart';
import '../../../../../common/widgets/Images/roundedImage.dart';
import '../../../../../utile/const/sizes.dart';
import 'bannerDotNavigation.dart';

class MyPromoSlider extends StatelessWidget {
  const MyPromoSlider({
    super.key, required this.banners,
  });

  final List<String> banners;
  @override
  Widget build(BuildContext context) {

    final controller = HomeController.instance;

    return Column(
      children: [
        CarouselSlider(
          items: banners.map((banner)=>MyRoundedImge(imageUrl: banner)).toList(),
          options: CarouselOptions(viewportFraction: 1.0,onPageChanged: (index, reason) => controller.onPagedChanged(index),),
          carouselController: controller.carousalController,

        ),
        SizedBox(height: Mysize.spaceBtwItems,),
        BannerDotIndicator()
      ],
    );
  }
}