import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:online_shop/common/widgets/text/sectionHeading.dart';
import 'package:online_shop/features/shop/screens/shop/widgets/catagoryTabs.dart';
import 'package:online_shop/features/shop/screens/shop/widgets/store_primary_header.dart';
import 'package:online_shop/utile/const/sizes.dart';
import '../../../../common/brands/brandCards.dart';
import '../../../../common/widgets/TabBar/TabBar.dart';
import '../Brands/AllBrands.dart';

class shop_screen extends StatelessWidget {
  const shop_screen({super.key});

  @override
  Widget build(BuildContext context) {
    // final dark = MyHeplerFunction.isDarkMode(context);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                expandedHeight: 340,
                pinned: true,
                floating: false,
                flexibleSpace: SingleChildScrollView(
                  child: Column(
                    children: [
                      MyStorePrimaryHeader(),
                      SizedBox(height: Mysize.spaceBtwItems),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Mysize.defaultSpace,
                        ),
                        child: Column(
                          children: [
                            MySectionHeading(title: "Brands", onPressed: ()=>Get.to(()=>Allbrands())),

                            SizedBox(
                              height: Mysize.brandCardHeight,
                              child: ListView.separated(
                                separatorBuilder: (context, index) =>
                                    SizedBox(width: Mysize.spaceBtwItems),
                                itemCount: 10,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return SizedBox(
                                    width: Mysize.brandCardWidth,
                                    child: MyBrandCard(),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                bottom: MyCustonTabBar(
                  tabs: [
                    Tab(child: Text("Sports")),
                    Tab(child: Text("Furniture")),
                    Tab(child: Text("Electronics")),
                    Tab(child: Text("Cloths")),
                    Tab(child: Text("Cosmetics")),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              MyCatagoryTab(),
              MyCatagoryTab(),
              MyCatagoryTab(),
              MyCatagoryTab(),
              MyCatagoryTab(),
            ],
          ),
        ),
      ),
    );
  }
}
