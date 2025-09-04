import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:online_shop/common/widgets/AppBar/CustomAppbar.dart';
import 'package:online_shop/common/widgets/style/padding.dart';
import 'package:online_shop/features/personalization/screen/Address/AddNewAddress.dart';
import 'package:online_shop/features/personalization/screen/Address/widgets/MySingleAddress.dart';
import 'package:online_shop/utile/const/colors.dart';
import 'package:online_shop/utile/const/sizes.dart';

class UserAddress extends StatelessWidget {
  const UserAddress ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(
        showBackArrow: true,
        title: Text("Addresses",style: Theme.of(context).textTheme.headlineMedium,),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Get.to(()=>addNewAddress());
          },
        backgroundColor: Mycolors.primary.withValues(alpha: .5) ,
        child: Icon(Iconsax.add),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: MyPadding.screenPadding,
          child: Column(
            children: [
              MySingleAddress(isSelected: true,),
              SizedBox(height: Mysize.spaceBtwItems,),
              MySingleAddress(isSelected: false,),
            ],
          ),
        ),
      ),
    );
  }
}
