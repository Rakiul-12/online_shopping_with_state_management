import 'package:flutter/material.dart';


class MyFormDivider extends StatelessWidget {
  const MyFormDivider({
    super.key, required this.title,
  });

  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(endIndent: 5,indent: 60,thickness: 1.5,)),
        Text(title,style: Theme.of(context).textTheme.labelMedium,),
        Expanded(child: Divider(endIndent: 60,indent: 5,thickness: 1.5,)),
      ],
    );
  }
}