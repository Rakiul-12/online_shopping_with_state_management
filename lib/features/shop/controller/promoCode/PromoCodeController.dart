import 'package:get/get.dart';
import 'package:online_shop/data/repository/authentication_repo.dart';
import 'package:online_shop/data/repository/promoCode/promoCodeRepository.dart';
import 'package:online_shop/features/shop/models/promoCodeModel.dart';
import 'package:online_shop/utile/const/enums.dart';
import 'package:online_shop/utile/const/text.dart';
import 'package:online_shop/utile/helpers/NetworkManager.dart';
import 'package:online_shop/utile/popup/snackbarHelpers.dart';
import '../../../../utile/helpers/pricingCalculator.dart';
import '../cart/cartController.dart';


class PromoCodeController extends GetxController{
  static PromoCodeController get instance => Get.find();

  RxString promoCode = "".obs;
  RxBool isLoading = false.obs;
  final _repository = Get.put(PromoCodeRepository());
  final cartController = Get.put(CartController());
  Rx<PromoCodeModel> appliedPromoCode = PromoCodeModel.empty().obs;

  // on promo code change
  void onPromoChanged(String value) => promoCode.value = value;

  // function to apply promo code
  Future<void> applyPromoCode ()async{
    try{
      isLoading.value= true;

      bool isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        MySnackBarHelpers.errorSnackBar(title: "No Internet Connection",message: "Please check your internet connection");
        return;
      }

      // get promo code details
      PromoCodeModel promoCode = await _repository.fetchSinglePromoCodes(this.promoCode.value);

      // if promoCode invalid
      if(promoCode.id.isEmpty){
        MySnackBarHelpers.warningSnackBar(title: "Invalid Promo Code",message: "Please enter a valid promo Code");
        return;
      }

      // check promoCode duration
      DateTime now = DateTime.now();
      if(promoCode.endDate!.isBefore(now)){
        MySnackBarHelpers.warningSnackBar(title: "Promo Code Expired",message: "The promo code has been expired");
        return;
      }

      // check if promo code is active
      if(!promoCode.isActive){
        MySnackBarHelpers.warningSnackBar(title: "Promo Code Not Active",message: "The promo is not active");
        return;
      }

      // check order minimum price
      double subTotal = cartController.totalCartPrice.value;
      double total = MyPricingCalculator.calculateTotalPrice(subTotal,"Bangladesh",);
      if(!(total >= promoCode.minOrderPrice)){
        MySnackBarHelpers.warningSnackBar(title: "Promo Code Not Applicable",
            message: "Minimum order must be ${MyText.currency} ${promoCode.minOrderPrice.toStringAsFixed(0)} to use this code");
        return;
      }

      // check available promo code
      if(!(promoCode.noOfPromoCodes > 0)){
        MySnackBarHelpers.warningSnackBar(title: "Promo Code Expired",message: "The promo code has been expired");
        return;
      }

      // user already apply the promo code
      List<String> userIds = promoCode.userIds ?? [];
      String currentUserId = AuthenticationRepository.instance.currentUser!.uid;
      if(userIds.contains(currentUserId)){
        MySnackBarHelpers.warningSnackBar(title: "Already Applied",message: "You have already applied this promo code");
        return;
      }

      // assign to Rx variable
      appliedPromoCode.value = promoCode;

    }catch(e){
      MySnackBarHelpers.errorSnackBar(title: "Promo Code Error",message: e.toString());
    }finally{
      isLoading.value = false;
    }
  }

  // calculate price after promo code applied
  double calculatePriceAfterDiscount (PromoCodeModel promoCode, double totalPrice){

    if(promoCode.id.isNotEmpty){
      if(promoCode.discountType == DiscountType.percentage){
        return MyPricingCalculator.calculatePercentageDiscount(totalPrice, promoCode.discount);
      }else{
        return MyPricingCalculator.calculateFixedDiscount(totalPrice, promoCode.discount);
      }
    }

    return totalPrice;
  }

  // get discount price
  String getDiscountPrice(){
    if(appliedPromoCode.value.id.isEmpty)return "";

    if(appliedPromoCode.value.discountType == DiscountType.percentage){
      return "${appliedPromoCode.value.discount}";
    }else{
      return "${MyText.currency}${appliedPromoCode.value.discount}";
    }
  }

  // function to add the user to applied promo code
  Future<void> decreaseNoOfPromoCode()async{
    try{
      if(appliedPromoCode.value.id.isEmpty) return;
      int noOfPromoCode = appliedPromoCode.value.noOfPromoCodes -1;
      await _repository.updateSingleField(appliedPromoCode.value, "noOfPromoCodes", noOfPromoCode);
    }catch(e){
      MySnackBarHelpers.errorSnackBar(title: "Promo Code Error",message: e.toString());
    }
  }

  // function to add user to applied promo code
  Future<void> addUserToPromoCode()async{
    try{
      if(appliedPromoCode.value.id.isEmpty) return;
      List<String> userIds = appliedPromoCode.value.userIds ?? [];
      userIds.add(AuthenticationRepository.instance.currentUser!.uid);
      await _repository.updateSingleField(appliedPromoCode.value, "userIds", userIds);
    }catch(e){
      MySnackBarHelpers.errorSnackBar(title: "Error",message: e.toString());
    }
  }

}