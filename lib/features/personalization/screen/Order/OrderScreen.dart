import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:online_shop/common/widgets/AppBar/CustomAppbar.dart';
import 'package:online_shop/common/widgets/custom_shapes/rounded_container.dart';
import 'package:online_shop/common/widgets/style/padding.dart';
import 'package:online_shop/utile/const/colors.dart';

class orderScreen extends StatelessWidget {
  const orderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(
        showBackArrow: true,
        title: Text("My Orders",style: Theme.of(context).textTheme.headlineMedium,),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: MyPadding.screenPadding,
          child: Column(
            children: [
              MyRoundedContainer(
                showBorder: true,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Iconsax.shopping_bag),
                        Column(
                          children: [
                            Text("Processing",style: Theme.of(context).textTheme.titleLarge!.apply(
                              color: Mycolors.primary
                            ),),
                            Text("01 Jan 2025",style: Theme.of(context).textTheme.titleLarge,)
                          ],
                        ),
                        IconButton(onPressed: (){}, icon: Icon(Iconsax.arrow_right_34))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
