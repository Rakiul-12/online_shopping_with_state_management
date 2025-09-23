import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:online_shop/common/widgets/text/sectionHeading.dart';
import 'package:online_shop/features/personalization/controller/addressController.dart';
import 'package:online_shop/utile/const/colors.dart';
import 'package:online_shop/utile/const/sizes.dart';

class MyBillingAddressSection extends StatelessWidget {
  const MyBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    controller.getAllAddress();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MySectionHeading(title: "Shipping Address",buttontitle: "Change",onPressed: ()=> controller.selectNewAddressBottomSheet(context)),
        Obx((){

          final address = controller.selectedAddress.value;
          if(address.id.isEmpty){
            return Text("Select Address");
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(address.name,style: Theme.of(context).textTheme.titleLarge,),
              Row(
                children: [
                  Icon(Iconsax.call,size: Mysize.iconSm,color: Mycolors.darkerGrey,),
                  SizedBox(width: Mysize.spaceBtwItems/2),
                  Text(address.phoneNumber),
                ],
              ),
              SizedBox(height: Mysize.spaceBtwItems/2),
              Row(
                children: [
                  Icon(Iconsax.user,size: Mysize.iconSm,color: Mycolors.darkerGrey,),
                  SizedBox(width: Mysize.spaceBtwItems/2),
                  Expanded(child: Text(address.toString(),softWrap: true,)),
                ],
              ),
            ],
          );
        })
      ],
    );
  }
}
