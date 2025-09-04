import 'package:flutter/material.dart';


class MySectionHeading extends StatelessWidget {
  const MySectionHeading({
    super.key,
    required this.title,
    this.buttontitle = "View all",
    this.onPressed,
    this.showActionBtn = true,
  });

  final String title,buttontitle;
  final void Function()? onPressed;
  final bool showActionBtn;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
      title,style: Theme.of(context).textTheme.headlineSmall,maxLines: 1,overflow: TextOverflow.ellipsis,),
        if(showActionBtn)
        TextButton(onPressed:onPressed,
            child: Text(buttontitle)),
      ],
    );
  }
}