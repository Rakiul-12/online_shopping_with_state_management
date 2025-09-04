import 'package:flutter/material.dart';
import 'package:online_shop/common/widgets/custom_shapes/circuler_container.dart';
import 'package:online_shop/utile/helpers/helper_functions.dart';
import '../../../utile/const/colors.dart';

class MyChoiceChip extends StatelessWidget {
  const MyChoiceChip({super.key,
    required this.text,
    required this.selected,
    required this.onSelected
  });

  final String text;
  final bool selected;
  final Function(bool?) onSelected;
  @override
  Widget build(BuildContext context) {
    bool isColor = MyHeplerFunction.getColor(text) != null;
    return ChoiceChip(
      label: isColor ? SizedBox() : Text(text),
      selected: selected,
      onSelected: onSelected,
      labelStyle: TextStyle(color: selected ? Mycolors.white : null),
      shape:  isColor ? CircleBorder() : null,
      padding: isColor ? EdgeInsets.zero : null,
      labelPadding: isColor ? EdgeInsets.zero : null,
      avatar:  isColor ? MyCirculerContainer(width: 50,height: 50,backgroundColor: MyHeplerFunction.getColor(text)!,) : null,
      backgroundColor: isColor ? MyHeplerFunction.getColor(text) : null,
    );
  }
}
