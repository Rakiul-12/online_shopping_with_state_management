import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:online_shop/features/shop/controller/promoCode/PromoCodeController.dart';
import '../../../utile/const/colors.dart';
import '../../../utile/const/sizes.dart';
import '../../../utile/helpers/helper_functions.dart';
import '../custom_shapes/rounded_container.dart';

class MyPromoCodeFiled extends StatelessWidget {
  const MyPromoCodeFiled({super.key});

  @override
  Widget build(BuildContext context) {
    MyHelperFunction.isDarkMode(context);
    final controller = PromoCodeController.instance;
    return MyRoundedContainer(
      showBorder: true,
      backgroundColor: Colors.transparent,
      padding: EdgeInsets.only(
        left: Mysize.md,
        right: Mysize.sm,
        top: Mysize.sm,
        bottom: Mysize.sm,
      ),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              // onChanged: controller.onPromoChanged,
              decoration: InputDecoration(
                hintText: "Have a promo code? Enter here",
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            width: 80,
            child: Obx(
              () => ElevatedButton(
                onPressed: controller.appliedPromoCode.value.id.isNotEmpty
                    ? null
                    : controller.promoCode.isEmpty
                    ? null
                    : controller.applyPromoCode,
                style: ElevatedButton.styleFrom(
                  side: BorderSide(color: Mycolors.grey.withValues(alpha: .1)),
                ),
                child: controller.isLoading.value
                    ? SizedBox(
                        width: Mysize.lg,
                        height: Mysize.lg,
                        child: CircularProgressIndicator(color: Mycolors.white))
                    :  Text(controller.appliedPromoCode.value.id.isEmpty ? "Apply" : "Applied"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
