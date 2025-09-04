import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:online_shop/features/shop/controller/home/home_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerDotIndicator extends StatelessWidget {
  const BannerDotIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = HomeController.instance;
    return Obx(()=> SmoothPageIndicator(
        count: 5,
        effect: ExpandingDotsEffect(
            dotHeight: 6.0
        ), controller: PageController(initialPage: controller.currentIndex.value),
      ),
    );
  }
}