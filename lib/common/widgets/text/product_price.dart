import 'package:flutter/material.dart';

class MyProductPriceText extends StatelessWidget {
  const MyProductPriceText({
    super.key,
    this.currencySign = "\$",
    required this.price,
    this.maxLines = 1,
    this.isLarge = false,
    this.lineThrough = false,
  });

  final int maxLines;
  final String currencySign, price;
  final bool isLarge, lineThrough;

  @override
  Widget build(BuildContext context) {
    return Text(
      currencySign + price,
      style: isLarge
          ? Theme.of(context).textTheme.headlineMedium!.apply(
              decoration: lineThrough ? TextDecoration.lineThrough : null,
            )
          : Theme.of(context).textTheme.titleLarge!.apply(
              decoration: lineThrough ? TextDecoration.lineThrough : null,
            ),
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}
