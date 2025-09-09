import 'package:flutter/material.dart';
import 'package:online_shop/common/widgets/AppBar/CustomAppbar.dart';
import 'package:online_shop/common/widgets/style/padding.dart';
import 'package:online_shop/common/widgets/text/sectionHeading.dart';
import 'package:online_shop/utile/const/sizes.dart';
import '../../../../common/widgets/products/cart/product_card/ProductCartHorizontal.dart';

class subCatagory extends StatelessWidget {
  const subCatagory({super.key});

  @override
  Widget build(BuildContext context) {
    // final dark = MyHeplerFunction.isDarkMode(context);
    return Scaffold(
      appBar: MyAppbar(
        showBackArrow: true,
        title: Text(
          "Sports",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: MyPadding.screenPadding,
          child: Column(
            children: [
              MySectionHeading(title: "Mobile Phone", onPressed: () {}),
              SizedBox(height: Mysize.spaceBtwItems / 2),
              SizedBox(
                height: 120,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return NewCartProductHorizontal();
                  },
                  itemCount: 10,
                  separatorBuilder: (context,index) =>SizedBox(width: Mysize.spaceBtwItems/2,),
                ),
              ),
              MySectionHeading(title: "Mobile Phone", onPressed: () {}),
              SizedBox(height: Mysize.spaceBtwItems / 2),
              SizedBox(
                height: 120,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return NewCartProductHorizontal();
                  },
                  itemCount: 10,
                  separatorBuilder: (context,index) =>SizedBox(width: Mysize.spaceBtwItems/2,),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
