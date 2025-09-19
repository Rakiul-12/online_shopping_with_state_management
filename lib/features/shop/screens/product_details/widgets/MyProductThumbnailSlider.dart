import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:online_shop/features/shop/controller/productController/imageController.dart';
import 'package:online_shop/features/shop/models/productModel.dart';
import '../../../../../common/widgets/AppBar/CustomAppbar.dart';
import '../../../../../common/widgets/Images/roundedImage.dart';
import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../utile/const/colors.dart';
import '../../../../../utile/const/image.dart';
import '../../../../../utile/const/sizes.dart';
import '../../../../../utile/helpers/helper_functions.dart';

class MyProductThumbnailSlider extends StatelessWidget {
  const MyProductThumbnailSlider({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunction.isDarkMode(context);
    final controller = Get.put(imageController());
    List<String> images = controller.getAllProductImage(product);
    return Container(
      color: dark ? Mycolors.darkerGrey : Mycolors.light,
      child: Stack(
        children: [
          SizedBox(
            height: 400,
            child: Padding(
              padding: const EdgeInsets.all(Mysize.productImageRadius * 2),
              child: Center(
                child: Obx(
                  (){
                    final image = controller.selectedProductImage.value;
                    return GestureDetector(
                      onTap: ()=> controller.showEnlargeImage(image),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        progressIndicatorBuilder: (context, url, progress) => CircularProgressIndicator(color: Mycolors.primary,value: progress.progress),
                      ),
                    );
                  } 
                ),
              ),
            ),
          ),
          Positioned(
            left: Mysize.defaultSpace,
            right: 0,
            bottom: 20,
            child: SizedBox(
              height: 80,
              child: ListView.separated(
                itemBuilder: (context, index) => Obx(
                  (){
                    bool isSelected = controller.selectedProductImage.value == images[index];
                    return MyRoundedImge(
                      width: 80,
                      backgroundColor: dark ? Mycolors.dark : Mycolors.white,
                      padding: EdgeInsets.all(Mysize.sm),
                      border: Border.all(color: isSelected ? Mycolors.primary : Colors.transparent),
                      imageUrl: images[index],
                      isNetworkImage: true,
                      onPressed: () => controller.selectedProductImage.value = images[index],
                    );
                  }
                ),
                separatorBuilder: (context, index) =>
                    SizedBox(width: Mysize.spaceBtwItems),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
              ),
            ),
          ),
          MyAppbar(
            showBackArrow: true,
            actions: [MyCircularIcon(icon: Iconsax.heart5, color: Colors.red)],
          ),
        ],
      ),
    );
  }
}
