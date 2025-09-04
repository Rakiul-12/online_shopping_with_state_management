import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:online_shop/common/widgets/Button/elevatedButton.dart';
import 'package:online_shop/common/widgets/style/padding.dart';
import 'package:online_shop/utile/const/sizes.dart';
import '../../../../common/widgets/AppBar/CustomAppbar.dart';

class addNewAddress extends StatelessWidget {
  const addNewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(
        showBackArrow: true,
        title: Text("Add new Address",style: Theme.of(context).textTheme.headlineMedium,),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: MyPadding.screenPadding,
          child: Column(
            children: [
              TextFormField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.user),labelText: "Name"),),
              SizedBox(height: Mysize.spaceBtwInputFields,),
              TextFormField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.mobile),labelText: "Phone Number"),),
              SizedBox(height: Mysize.spaceBtwInputFields,),
              Row(
                children: [
                  Expanded(child: TextFormField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.building_31),labelText: "Street"),)),
                  SizedBox(width: Mysize.sm,),
                  Expanded(child: TextFormField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.code),labelText: "Postal Code"),)),
                ],
              ),
              SizedBox(height: Mysize.spaceBtwInputFields,),
              Row(
                children: [
                  Expanded(child: TextFormField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.building),labelText: "City"),)),
                  SizedBox(width: Mysize.sm,),
                  Expanded(child: TextFormField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.activity),labelText: "State"),)),
                ],
              ),
              SizedBox(height: Mysize.spaceBtwInputFields,),
              TextFormField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.global),labelText: "Country"),),
              SizedBox(height: Mysize.spaceBtwSections,),
              MyElevatedButton(onPressed: (){}, child: Text("Save"))
            ],
          ),
        ),
      ),
    );
  }
}
