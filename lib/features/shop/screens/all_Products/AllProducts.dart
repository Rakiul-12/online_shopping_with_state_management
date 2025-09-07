import 'package:flutter/material.dart';
import 'package:online_shop/common/widgets/AppBar/CustomAppbar.dart';
import 'package:online_shop/common/widgets/style/padding.dart';


import '../../../../common/widgets/MySortableProducts/MySortableProducts.dart';

class AllProdcuts extends StatelessWidget {
  const AllProdcuts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(
        showBackArrow: true,
        title: Text(
          "Popular Products",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: MyPadding.screenPadding,
          child: MySortableProducts(),
        ),
      ),
    );
  }
}

