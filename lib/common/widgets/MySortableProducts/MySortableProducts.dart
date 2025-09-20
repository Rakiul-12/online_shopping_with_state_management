import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:online_shop/features/shop/models/productModel.dart';
import '../../../features/shop/controller/productController/allProductController.dart';
import '../../../utile/const/sizes.dart';
import '../layouts/grid_layout.dart';
import '../products/cart/product_card/product_cards_vertical.dart';

class MySortableProducts extends StatelessWidget {
  const MySortableProducts({
    super.key,
    required this.product,
  });


  final List<ProductModel> product;
  @override
  Widget build(BuildContext context) {
    final controller = AllProductController.instance;
    controller.assignProducts(product);
    return Column(
      children: [
        DropdownButtonFormField(
          value: controller.selectedSortOption.value,
          decoration: InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          onChanged: (value) => controller.sortProducts(value!),
          items: ["Name", "Lower Price", "Higher Price", "Newest", "Sale"]
              .map((filter) {
            return DropdownMenuItem(
              value: filter,
              child: Text(filter),
            );
          })
              .toList(),
        ),
        SizedBox(height: Mysize.spaceBtwSections,),
        Obx(()=> MyGridLayout(itemCount: controller.products.length, itemBuilder: (context, index) => MyProductCardVertical(product: controller.products[index])))
      ],
    );
  }
}