import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:online_shop/features/shop/controller/checkout/checkOutController.dart';

import '../../../../../common/widgets/custom_shapes/rounded_container.dart';
import '../../../../../utile/const/colors.dart';
import '../../../../../utile/const/sizes.dart';
import '../../../../../utile/helpers/helper_functions.dart';
import '../../../models/paymentMethodModel.dart';

class MyPaymentTile extends StatelessWidget{
  const MyPaymentTile({super.key, required this.paymentMethod});

  final PaymentMethodModel paymentMethod;

  @override
  Widget build(BuildContext context) {
    final controller = CheckOutController.instance;
    return ListTile(
      onTap: (){
        controller.selectedPaymentMethod.value = paymentMethod;
        Get.back();
      },
      contentPadding: EdgeInsets.zero,
      leading: MyRoundedContainer(
        width: 60,
        height: 40,
        backgroundColor: MyHelperFunction.isDarkMode(context) ? Mycolors.light : Mycolors.white,
        padding: EdgeInsets.all(Mysize.sm),
        child: Image(image: AssetImage(paymentMethod.image),fit: BoxFit.contain),
      ),
      title: Text(paymentMethod.name),
      trailing: Icon(Iconsax.arrow_right_34),
    );
  }

}