import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shop/common/widgets/text/sectionHeading.dart';
import 'package:online_shop/data/service/stripeServices.dart';
import 'package:online_shop/features/shop/controller/order/orderController.dart';
import 'package:online_shop/features/shop/models/paymentMethodModel.dart';
import 'package:online_shop/utile/const/enums.dart';
import 'package:online_shop/utile/const/image.dart';
import 'package:online_shop/utile/const/sizes.dart';
import 'package:online_shop/utile/popup/snackbarHelpers.dart';

import '../../screens/checkpOut/widgets/paymentTile.dart';

class CheckOutController extends GetxController{
  static CheckOutController get instance => Get.find();

  Rx<PaymentMethodModel> selectedPaymentMethod = PaymentMethodModel.empty().obs;
  final _orderController = Get.put(OrderController());
  final _striperService = Get.put(StripeService());
  RxBool isPaymentProcessing = false.obs;

  @override
  void onInit() {
    super.onInit();
    selectedPaymentMethod.value = PaymentMethodModel(name: "Cash on delivery", image: MyImage.codIcon,paymentMethod: PaymentMethods.cashOnDelivery);
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
            MyPaymentTile(paymentMethod: PaymentMethodModel(name: "Cash on Delivery",image: MyImage.codIcon,paymentMethod: PaymentMethods.cashOnDelivery)),
            SizedBox(height: Mysize.spaceBtwItems / 2,),
            MyPaymentTile(paymentMethod: PaymentMethodModel(name: "Paypal",image: MyImage.paypal,paymentMethod: PaymentMethods.paypal)),
            SizedBox(height: Mysize.spaceBtwItems / 2,),
            MyPaymentTile(paymentMethod: PaymentMethodModel(name: "Credit/Debit Card",image: MyImage.creditCard,paymentMethod: PaymentMethods.creditCard)),
            // SizedBox(height: Mysize.spaceBtwItems / 2,),
            // MyPaymentTile(paymentMethod: PaymentMethodModel(name: "Master Card",image: MyImage.masterCard,paymentMethod: PaymentMethods.masterCard)),
            SizedBox(height: Mysize.spaceBtwItems / 2,),
          ],
        ),
      ),
    ));
  }


  Future<void> checkOut (double totalAmount)async{
    try{
      isPaymentProcessing.value = true;
      PaymentMethods paymentMethods = selectedPaymentMethod.value.paymentMethod;

      switch(paymentMethods){
        case PaymentMethods.creditCard :
          await _striperService.initPaymentSheet("USD", totalAmount.toInt());
          await _striperService.showPaymentSheet();
        case PaymentMethods.cashOnDelivery :
          break;
        default :
          throw "Payment method is not supported";
      }
      isPaymentProcessing.value=false;

      await _orderController.processOrder(totalAmount);



    }catch(e){
      isPaymentProcessing.value=false;
      MySnackBarHelpers.errorSnackBar(title: "Failed!",message: e.toString());
    }


  }

}

