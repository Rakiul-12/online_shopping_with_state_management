import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:online_shop/data/repository/authentication_repo.dart';
import 'package:online_shop/data/repository/order/OrderRepository.dart';
import 'package:online_shop/features/personalization/controller/addressController.dart';
import 'package:online_shop/features/shop/controller/cart/cartController.dart';
import 'package:online_shop/features/shop/controller/checkout/checkOutController.dart';
import 'package:online_shop/features/shop/models/orderModel.dart';
import 'package:online_shop/utile/const/enums.dart';
import 'package:online_shop/utile/popup/fullScreenLoader.dart';
import 'package:online_shop/utile/popup/snackbarHelpers.dart';
import '../../../../common/widgets/Screens/success_screen.dart';
import '../../../../navigation_menu.dart';
import '../../../../utile/const/image.dart';

class OrderController extends GetxController{
  static OrderController get instance => Get.find();

  final cartController = Get.put(CartController());
  final addressController = Get.put(AddressController());
  final _OrderRepository = Get.put(OrderRepository());


  Future<void> processOrder (double totalAmount)async{
    try{
      MyFullScreenLoader.openLoadingDialog("Processing your order...");

      // check user exist
      String UserId = AuthenticationRepository.instance.currentUser!.uid;
      if(UserId.isEmpty) return;

      // check address is exist
      if(AddressController.instance.selectedAddress.value.id.isEmpty){
        MySnackBarHelpers.warningSnackBar(title: "Address not selected",message: "Please select address");
        return;
      }


      final checkOutController = CheckOutController.instance;

      // create order model
      OrderModel order = OrderModel(
          id: UniqueKey().toString(),
          status: OrderStatus.pending,
          items: cartController.cartItems.toList(),
          totalAmount: totalAmount,
          orderDate: DateTime.now(),
          userId: UserId,
          paymentMethod: checkOutController.selectedPaymentMethod.value.name,
          address: addressController.selectedAddress.value,
          deliveryDate: DateTime.now()
      );
      // save order with order model
      await _OrderRepository.saveOrder(order);

      // clear the cart
      cartController.clearCart();

      // show success screen
      Get.to(
              () => success_screen(
            title: "Payment Success!",
            subtitle: "Your item will be shipped soon!",
            image: MyImage.successfulPaymentIcon,
            onPressed: ()=>Get.offAll(()=>navigationMenuScreen())));
      
    }catch(e){
      MySnackBarHelpers.errorSnackBar(title: "Oder Failed!",message: e.toString());
    }
  }


  Future<List<OrderModel>> fetchUserOrder()async{
    try{
      final order = await _OrderRepository.fetchUserOrder();
      return order;

    }catch(e){
      MySnackBarHelpers.errorSnackBar(title: "Failed!",message: e.toString());
      return [];
    }

  }

}