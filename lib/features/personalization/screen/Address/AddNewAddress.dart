import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:online_shop/common/widgets/Button/elevatedButton.dart';
import 'package:online_shop/common/widgets/style/padding.dart';
import 'package:online_shop/features/personalization/controller/addressController.dart';
import 'package:online_shop/utile/const/sizes.dart';
import 'package:online_shop/utile/validators/validations.dart';
import '../../../../common/widgets/AppBar/CustomAppbar.dart';

class addNewAddress extends StatelessWidget {
  const addNewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    return Scaffold(
      appBar: MyAppbar(
        showBackArrow: true,
        title: Text(
          "Add new Address",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: MyPadding.screenPadding,
          child: Form(
            key: controller.addressFormKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.name,
                  validator: (value) => MyValidator.validateEmptyText("Name", value),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: "Name",
                  ),
                ),
                SizedBox(height: Mysize.spaceBtwInputFields),
                TextFormField(
                  controller: controller.phoneNumber,
                  validator: (value) => MyValidator.validateEmptyText("Phone Number", value),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.mobile),
                    labelText: "Phone Number",
                  ),
                ),
                SizedBox(height: Mysize.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.street,
                        validator: (value) => MyValidator.validateEmptyText("Street", value),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Iconsax.building_31),
                          labelText: "Street",
                        ),
                      ),
                    ),
                    SizedBox(width: Mysize.sm),
                    Expanded(
                      child: TextFormField(
                        controller: controller.postalCode,
                        validator: (value) => MyValidator.validateEmptyText("Postal Code", value),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Iconsax.code),
                          labelText: "Postal Code",
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Mysize.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.city,
                        validator: (value) => MyValidator.validateEmptyText("City", value),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Iconsax.building),
                          labelText: "City",
                        ),
                      ),
                    ),
                    SizedBox(width: Mysize.sm),
                    Expanded(
                      child: TextFormField(
                        controller: controller.state,
                        validator: (value) => MyValidator.validateEmptyText("State", value),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Iconsax.activity),
                          labelText: "State",
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Mysize.spaceBtwInputFields),
                TextFormField(
                  controller: controller.country,
                  validator: (value) => MyValidator.validateEmptyText("Country", value),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.global),
                    labelText: "Country",
                  ),
                ),
                SizedBox(height: Mysize.spaceBtwSections),
                MyElevatedButton(onPressed: controller.addNewAddress, child: Text("Save")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
