import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/widgets/AppBar/CustomAppbar.dart';
import '../../../../../common/widgets/Images/roundedImage.dart';
import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../utile/const/colors.dart';
import '../../../../../utile/const/image.dart';
import '../../../../../utile/const/sizes.dart';
import '../../../../../utile/helpers/helper_functions.dart';

class MyProductThumbnailSlider extends StatelessWidget {
  const MyProductThumbnailSlider({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = MyHeplerFunction.isDarkMode(context);
    return Container(
      color: dark ? Mycolors.darkerGrey : Mycolors.light,
      child: Stack(
        children: [
          SizedBox(
            height: 400,
            child: Padding(
              padding: const EdgeInsets.all(
                Mysize.productImageRadius * 2,
              ),
              child: Center(
                child: Image(image: AssetImage(MyImage.productImage4a)),
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
                itemBuilder: (context, index) => MyRoundedImge(
                  width: 80,
                  backgroundColor: dark
                      ? Mycolors.dark
                      : Mycolors.white,
                  padding: EdgeInsets.all(Mysize.sm),
                  border: Border.all(color: Mycolors.primary),
                  imageUrl: MyImage.productImage3,
                ),
                separatorBuilder: (context, index) =>
                    SizedBox(width: Mysize.spaceBtwItems),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 5,
              ),
            ),
          ),
          MyAppbar(
            showBackArrow: true,
            actions: [
              MyCircularIcon(icon: Iconsax.heart5, color: Colors.red),
            ],
          ),
        ],
      ),
    );
  }
}