import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:online_shop/common/widgets/AppBar/CustomAppbar.dart';
import 'package:online_shop/common/widgets/Button/elevatedButton.dart';
import 'package:online_shop/common/widgets/style/padding.dart';
import 'package:online_shop/features/personalization/controller/changeNameController.dart';
import 'package:online_shop/utile/const/sizes.dart';
import 'package:online_shop/utile/const/text.dart';
import '../../../../utile/validators/validations.dart';

class changeUserNameScreen extends StatelessWidget {
  const changeUserNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChangeNameController());
    return Scaffold(
      appBar: MyAppbar(
        showBackArrow: true,
        title: Text("Update Name",style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: MyPadding.screenPadding,
          child: Column(
            children: [
              Text("Update your name to keep your profile accurate and personalized",style: Theme.of(context).textTheme.labelMedium),
              SizedBox(height: Mysize.spaceBtwSections),
              Form(
                key: controller.updateUserFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.firstName,
                      validator: (value)=> MyValidator.validateEmptyText("First Name", value),
                      decoration: InputDecoration(
                        labelText: "First Name",
                        prefixIcon: Icon(Iconsax.user)
                      ),
                    ),
                    SizedBox(height: Mysize.spaceBtwItems),
                    TextFormField(
                      controller: controller.lastName,
                      validator: (value)=> MyValidator.validateEmptyText("Last Name", value),
                      decoration: InputDecoration(
                          labelText: "Last Name",
                          prefixIcon: Icon(Iconsax.user)
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: Mysize.spaceBtwItems),
              MyElevatedButton(onPressed: controller.updateUserName
              , child: Text("Save"))
            ],
          ),
        ),
      ),
    );
  }
}
