import 'package:flutter/cupertino.dart';
import '../../../utile/const/colors.dart';

class MyShadow{
  MyShadow._();

  static List<BoxShadow> searchBarShadow = [
      BoxShadow(
          color: Mycolors.black.withValues(alpha: .1),
          spreadRadius: 2.0,
          blurRadius: 4.0
      )
  ];

  static List<BoxShadow> verticalProductShadow = [BoxShadow(
  color: Mycolors.darkGrey.withValues(alpha: .1),
  blurRadius: 50,
  spreadRadius: 7,
  offset: Offset(0, 2)
  )];

}