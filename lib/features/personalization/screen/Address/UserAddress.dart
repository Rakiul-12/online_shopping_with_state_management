import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:online_shop/common/widgets/AppBar/CustomAppbar.dart';
import 'package:online_shop/common/widgets/style/padding.dart';
import 'package:online_shop/features/personalization/controller/addressController.dart';
import 'package:online_shop/features/personalization/models/addressModel.dart';
import 'package:online_shop/features/personalization/screen/Address/AddNewAddress.dart';
import 'package:online_shop/features/personalization/screen/Address/widgets/MySingleAddress.dart';
import 'package:online_shop/utile/const/colors.dart';
import 'package:online_shop/utile/const/sizes.dart';
import 'package:online_shop/utile/helpers/cloudHelperFunction.dart';

class UserAddress extends StatelessWidget {
  const UserAddress ({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
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
        child: Icon(Iconsax.add,color: Mycolors.white,),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: MyPadding.screenPadding,
          child: Obx(
              ()=> FutureBuilder(
                key: Key(controller.refreshData.value.toString()),
                future: controller.getAllAddress(),
                builder: (context, snapshot) {

                  final widget = myCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot);
                  if(widget != null) return widget;

                  List<AddressModel> addresses = snapshot.data!;
                  return ListView.separated(
                      shrinkWrap: true,
                      separatorBuilder: (context, index) => SizedBox(height: Mysize.spaceBtwItems),
                      itemCount: addresses.length,
                      itemBuilder: (context, index) {
                        return MySingleAddress(
                          onTap: () => controller.selectAddress(addresses[index]),
                          address: addresses[index],
                        );
                      },
                  );
                },
            ),
          )
        ),
      ),
    );
  }
}
