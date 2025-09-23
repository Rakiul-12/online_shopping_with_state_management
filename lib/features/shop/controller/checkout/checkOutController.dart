import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shop/common/widgets/text/sectionHeading.dart';
import 'package:online_shop/features/shop/models/paymentMethodModel.dart';
import 'package:online_shop/utile/const/image.dart';
import 'package:online_shop/utile/const/sizes.dart';

import '../../screens/checkpOut/widgets/paymentTile.dart';

class CheckOutController extends GetxController{
  static CheckOutController get instance => Get.find();

  Rx<PaymentMethodModel> selectedPaymentMethod = PaymentMethodModel.empty().obs;


  @override
  void onInit() {
    super.onInit();
    selectedPaymentMethod.value = PaymentMethodModel(name: "Cash on delivery", image: MyImage.codIcon);
  }

  Future<void> selectPaymentMethod(BuildContext context) {
    return showModalBottomSheet(context: context, builder: (context) => SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(Mysize.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MySectionHeading(title: "Selected Payment Method",showActionBtn: false,),
            SizedBox(height: Mysize.spaceBtwItems),
            MyPaymentTile(paymentMethod: PaymentMethodModel(name: "Cash on Delivery",image: MyImage.codIcon)),
            SizedBox(height: Mysize.spaceBtwItems / 2,),
            MyPaymentTile(paymentMethod: PaymentMethodModel(name: "Paypal",image: MyImage.paypal)),
            SizedBox(height: Mysize.spaceBtwItems / 2,),
            MyPaymentTile(paymentMethod: PaymentMethodModel(name: "Credit Card",image: MyImage.creditCard)),
            SizedBox(height: Mysize.spaceBtwItems / 2,),
            MyPaymentTile(paymentMethod: PaymentMethodModel(name: "Master Card",image: MyImage.masterCard)),
            SizedBox(height: Mysize.spaceBtwItems / 2,),
          ],
        ),
      ),
    ));
  }
}

