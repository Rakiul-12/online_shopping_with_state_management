import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:online_shop/features/authentication/screens/signUp/verifyScreen/verifyScreen.dart';
import 'package:online_shop/utile/helpers/helper_functions.dart';
import '../../../../common/widgets/Button/elevatedButton.dart';
import '../../../../utile/const/colors.dart';
import '../../../../utile/const/sizes.dart';
import '../../../../utile/const/text.dart';

class signUpForm extends StatelessWidget {
  const signUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = MyHeplerFunction.isDarkMode(context);
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: TextFormField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.user),
                  labelText: MyText.SignUpFormFiled1
              ),
            )),
            SizedBox(width: Mysize.sm,),
            Expanded(child: TextFormField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.user),
                  labelText: MyText.SignUpFormFiled2
              ),
            )),
          ],
        ),
        SizedBox(height: Mysize.spaceBtwInputFields),
        TextFormField(
          decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.direct_right),
              labelText: MyText.onLogInScreenEmail
          ),
        ),
        SizedBox(height: Mysize.spaceBtwInputFields),
        TextFormField(
          decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.call),
              labelText: MyText.SignUpFormFiled3
          ),
        ),
        SizedBox(height: Mysize.spaceBtwInputFields),
        TextFormField(
          decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye),
              labelText: MyText.onLogInScreenPassword
          ),
        ),
        SizedBox(height: Mysize.spaceBtwInputFields /2),
        Row(
          children: [
            Checkbox(
                value: true,
                onChanged: (value){ }
            ),
            RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.bodyMedium,
                    children: [
                      TextSpan(text: MyText.SignUpagreeAgree ),
                      TextSpan(text: MyText.SignUpagreePrivacy,style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                           color: dark ? Mycolors.white : Mycolors.primary,
                          decoration: TextDecoration.underline,
                          decorationColor: dark ? Mycolors.white : Mycolors.primary
                      )),
                      TextSpan(text: MyText.SignUpagreeAnd),
                      TextSpan(text: MyText.SignUpagreeTerm,style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: dark ? Mycolors.white : Mycolors.primary,
                          decoration: TextDecoration.underline,
                          decorationColor:  dark ? Mycolors.white : Mycolors.primary
                      )),
                    ]
                )
            )
          ],
        ),
        SizedBox(height: Mysize.spaceBtwItems,),
        MyElevatedButton(onPressed: (){
          Get.off(()=>verifyScrreen());
        }, child: Text(MyText.SignUpCreateAc)),
      ],
    );
  }
}