import 'package:flutter/material.dart';
import '../../../utile/const/colors.dart';
import '../../../utile/const/sizes.dart';
import '../../../utile/helpers/helper_functions.dart';
import '../custom_shapes/rounded_container.dart';

class MyPromoCodeFiled extends StatelessWidget {
  const MyPromoCodeFiled({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MyHeplerFunction.isDarkMode(context);
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
            child: ElevatedButton(
              onPressed: null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Mycolors.grey.withValues(alpha: .2),
                foregroundColor: dark
                    ? Mycolors.white.withValues(alpha: .5)
                    : Mycolors.dark.withValues(alpha: .5),
                side: BorderSide(color: Mycolors.grey.withValues(alpha: .1)),
              ),
              child: Text("Apply"),
            ),
          ),
        ],
      ),
    );
  }
}
