import 'package:flutter/material.dart';
import 'package:online_shop/utile/const/image.dart';
import '../../../../../common/widgets/Image_text/imge_text.dart';
import '../../../../../utile/const/colors.dart';
import '../../../../../utile/const/sizes.dart';
import '../../../../../utile/const/text.dart';

class MyHomeCategory extends StatelessWidget {
  const MyHomeCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: Mysize.spaceBtwSections),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            MyText.HomeScreenPopularCategory,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall!.apply(color: Mycolors.white),
          ),
          SizedBox(height: Mysize.spaceBtwSections),
          SizedBox(
            height: 80,
            child: ListView.separated(
              separatorBuilder: (context, index) =>
                  SizedBox(width: Mysize.spaceBtwItems),
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return MyVerticaLImageText(
                  title: "Sport Categories",
                  image: MyImage.bagsIcon,
                  textColor: Mycolors.white,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
