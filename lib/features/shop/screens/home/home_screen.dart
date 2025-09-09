import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:online_shop/features/shop/controller/home/home_controller.dart';
import 'package:online_shop/features/shop/screens/home/widgets/HomeCategory.dart';
import 'package:online_shop/features/shop/screens/home/widgets/homeAppBar.dart';
import 'package:online_shop/common/widgets/custom_shapes/primary_home_container.dart';
import 'package:online_shop/features/shop/screens/home/widgets/promoSlider.dart';
import 'package:online_shop/utile/const/image.dart';
import 'package:online_shop/utile/const/sizes.dart';
import 'package:online_shop/utile/const/text.dart';
import 'package:online_shop/utile/helpers/helper_functions.dart';
import '../../../../common/widgets/SearchBar/SearchBar.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/cart/product_card/product_cards_vertical.dart';
import '../../../../common/widgets/text/sectionHeading.dart';
import '../all_Products/AllProducts.dart';

class home_screen extends StatelessWidget {
  const home_screen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    bool dark = MyHeplerFunction.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [


            // Herader section
            Stack(
              children: [
                SizedBox(height: Mysize.homePrimaryHeaderHeight + 10),
        
                MyPrimaryHeaderContainer(
                  height: Mysize.homePrimaryHeaderHeight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyHomeAppBar(dark: dark),
        
                      SizedBox(height: Mysize.spaceBtwSections),
        
                      MyHomeCategory(),
                    ],
                  ),
                ),
        
                MySearchBar(),
              ],
            ),
        
            // Body Section
            Padding(
              padding: const EdgeInsets.all(Mysize.defaultSpace),
              child: Column(
                children: [
                  MyPromoSlider(
                    banners: [
                      MyImage.banner_1,
                      MyImage.banner_2,
                      MyImage.banner_3,
                      MyImage.banner_4,
                      MyImage.banner_5,
                    ],
                  ),
                   SizedBox(height: Mysize.md,),
                   MySectionHeading(
                     title: MyText.HomeScreenPopularProduct,
                     onPressed: ()=> Get.to(()=>AllProdcuts()),
                   ),
                  SizedBox(height: Mysize.spaceBtwItems,),

                  // Products Cards
                  MyGridLayout(
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return MyProductCardVertical();
                    },
                  )
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}









