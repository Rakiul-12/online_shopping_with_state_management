import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:online_shop/features/authentication/screens/forgetPass/forgotPassword.dart';
import 'package:online_shop/features/authentication/screens/signUp/signUpScreen.dart';
import '../../../../../common/widgets/Button/elevatedButton.dart';
import '../../../../../utile/const/sizes.dart';
import '../../../../../utile/const/text.dart';

class form_filed extends StatelessWidget {
  const form_filed({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            prefixIcon: Icon(Iconsax.direct_right),
            labelText: MyText.onLogInScreenEmail,
          ),
        ),
        SizedBox(height: Mysize.spaceBtwInputFields),
        TextFormField(
          decoration: InputDecoration(
            prefixIcon: Icon(Iconsax.password_check),
            labelText: MyText.onLogInScreenPassword,
            suffixIcon: Icon(Iconsax.eye),
          ),
        ),
        SizedBox(height: Mysize.spaceBtwInputFields / 2),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Checkbox(value: true, onChanged: (value) {}),
                Text(MyText.onLogInScreenRemember),
              ],
            ),
            TextButton(
              onPressed: () {
                Get.off(()=>forgotPass());
              },
              child: Text(MyText.onLogInScreenForgetPass),
            ),
          ],
        ),

        SizedBox(height: Mysize.spaceBtwInputFields),

        MyElevatedButton(onPressed: () {}, child: Text(MyText.SignIn)),
        SizedBox(height: Mysize.spaceBtwItems),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: ()=> Get.to(()=> signUpScreen()),
            child: Text(MyText.CreateAc),
          ),
        ),
      ],
    );
  }
}