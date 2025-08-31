import 'package:flutter/material.dart';
import '../../../../../utile/const/sizes.dart' show Mysize;
import '../../../../../utile/const/text.dart';

class MylogInHeader extends StatelessWidget {
  const MylogInHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(MyText.onLogInScreenTitle,style: Theme.of(context).textTheme.headlineMedium,),
        SizedBox(height: Mysize.sm,),
        Text(MyText.onLogInScreensubTitle,style: Theme.of(context).textTheme.bodyMedium,),
      ],
    );
  }
}