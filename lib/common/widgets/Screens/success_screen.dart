import 'package:flutter/material.dart';
import '../../../utile/const/sizes.dart';
import '../../../utile/const/text.dart';
import '../Button/elevatedButton.dart';
import '../style/padding.dart';

class success_screen extends StatelessWidget {
  const success_screen({super.key, required this.title, required this.subtitle, required this.image, required this.onPressed});

  final String title,subtitle,image;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body:
      Padding(
        padding: MyPadding.screenPadding,
        child: Column(
          children: [
            Image.asset(image),
            Text(title,style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
            SizedBox(height: Mysize.sm,),
            Text(subtitle,textAlign: TextAlign.center,style: Theme.of(context).textTheme.bodySmall,),
            SizedBox(height: Mysize.spaceBtwSections,),
            MyElevatedButton(onPressed: onPressed, child: Text(MyText.verifyScreenResendBtn))
          ],
        ),
      )
      ,
    );
  }
}
