import 'package:ecommerce_app/core/Utils/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextStyle getTextStyle(double fontSize,FontWeight fontWeight,Color color,){
  return TextStyle(
    fontSize: fontSize.sp,
    fontWeight: fontWeight,
    color: color,
    fontFamily: FontFamily.fontFamily
  );
}