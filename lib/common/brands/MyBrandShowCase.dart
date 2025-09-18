import 'package:flutter/material.dart';
import 'package:online_shop/features/shop/models/brandModel.dart';
import 'package:online_shop/utile/helpers/helper_functions.dart';
import '../../utile/const/colors.dart';
import '../../utile/const/sizes.dart';
import '../widgets/custom_shapes/rounded_container.dart';
import 'brandCards.dart';

class MyBrandShowcase extends StatelessWidget {
  const MyBrandShowcase({super.key, required this.image});

  final List<String> image;

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunction.isDarkMode(context);
    return MyRoundedContainer(
      showBorder: true,
      borderColor: Mycolors.darkGrey,
      backgroundColor: Colors.transparent,
      padding: EdgeInsets.all(Mysize.md),
      margin: EdgeInsets.only(bottom: Mysize.spaceBtwItems),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyBrandCard(showBorder: false,brand: BrandModel.empty(),),
          Row(
            children: image
                .map((image) => buildBrandImage(dark, image))
                .toList(),
          ),
        ],
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
        child: Image(image: AssetImage(image), fit: BoxFit.contain),
      ),
    );
  }
}
