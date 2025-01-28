import 'package:ecommerce_app/core/Utils/colors_manager.dart';
import 'package:ecommerce_app/core/Utils/font_manager.dart';
import 'package:ecommerce_app/core/Utils/style_manager.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {super.key,
      required this.keyboardType,
      this.obscureText = false,
      this.controller,
      required this.text,
      this.suffixIcon,
       this.validate,
      this.initialValue});

  TextInputType keyboardType;
  bool obscureText;
  TextEditingController? controller;
  String text;
  Widget? suffixIcon;
  String? Function(String?)? validate;
  String? initialValue;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: ColorsManager.blackColor,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validate,
      controller: controller,
      initialValue:initialValue,
      style: getTextStyle(
          FontSize.s18, FontWeightManager.medium, ColorsManager.blackColor),
      decoration: InputDecoration(
          border: getOutlineBorder(width: 1.2),
          focusedBorder: getOutlineBorder(width: 2),
          enabledBorder: getOutlineBorder(),
          errorBorder: getOutlineBorder(),
          hintText: text,
          suffixIcon: suffixIcon,
          hintStyle: getTextStyle(FontSize.s18, FontWeightManager.medium,
              ColorsManager.primaryColor)),
    );
  }

  OutlineInputBorder getOutlineBorder({double width = 1.3}) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide:
            BorderSide(width: width, color: ColorsManager.primaryColor));
  }
}
