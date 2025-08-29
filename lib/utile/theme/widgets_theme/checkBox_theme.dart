import 'package:flutter/material.dart';
import 'package:online_shop/utile/const/colors.dart';
import 'package:online_shop/utile/const/sizes.dart';

class MyCheckboxTheme{
  MyCheckboxTheme._();

  static CheckboxThemeData lightCheckBoxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Mysize.xs)),
    checkColor: WidgetStateProperty.resolveWith((states){
      if(states.contains(WidgetState.selected)){
        return Mycolors.white;
      }else{
        return Mycolors.black;
      }
    }),
    fillColor: WidgetStateProperty.resolveWith((states){
      if(states.contains(WidgetState.selected)){
        return Mycolors.primary;
      }else{
        return Colors.transparent;
      }
    }),
  );


  static CheckboxThemeData darkCheckBoxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Mysize.xs)),
    checkColor: WidgetStateProperty.resolveWith((states){
      if(states.contains(WidgetState.selected)){
        return Mycolors.white;
      }else{
        return Mycolors.black;
      }
    }),
    fillColor: WidgetStateProperty.resolveWith((states){
      if(states.contains(WidgetState.selected)){
        return Mycolors.primary;
      }else{
        return Colors.transparent;
      }
    }),
  );
}