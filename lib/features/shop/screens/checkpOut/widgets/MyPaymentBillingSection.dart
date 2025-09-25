import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:online_shop/common/widgets/custom_shapes/rounded_container.dart';
import 'package:online_shop/common/widgets/text/sectionHeading.dart';
import 'package:online_shop/features/shop/controller/checkout/checkOutController.dart';
import 'package:online_shop/utile/const/colors.dart';
import 'package:online_shop/utile/const/sizes.dart';
import 'package:online_shop/utile/helpers/helper_functions.dart';

class MyPaymentBillingSection extends StatelessWidget {
  const MyPaymentBillingSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MyHelperFunction.isDarkMode(context);
    final controller = CheckOutController.instance;
    return Column(
      children: [
        MySectionHeading(
          title: "Payment Method",
          buttontitle: "Change",
          onPressed: () => controller.selectPaymentMethod(context)
        ),
        SizedBox(height: Mysize.spaceBtwItems / 2,),
        Obx(
          ()=> Row(
            children: [
              MyRoundedContainer(
                width: 60,
                height: 35,
                backgroundColor: dark ? Mycolors.light : Mycolors.white,
                padding: EdgeInsets.all(Mysize.sm),
                child: Image(image: AssetImage(controller.selectedPaymentMethod.value.image),fit: BoxFit.contain,),
              ),
              SizedBox(width: Mysize.spaceBtwItems / 2),
              Text(controller.selectedPaymentMethod.value.name,style: Theme.of(context).textTheme.bodyLarge)
            ],
          ),
        )
      ],
    );
  }
}
