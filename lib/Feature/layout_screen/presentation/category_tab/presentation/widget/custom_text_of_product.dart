import 'package:ecommerce_app/core/Utils/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/Utils/colors_manager.dart';
import '../../../../../../core/Utils/font_manager.dart';

class CustomTextOfProduct extends StatelessWidget {
  const CustomTextOfProduct({super.key,required this.text});
final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 8.w),
      child: Text(
        text,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: getTextStyle(FontSize.s14.sp, FontWeightManager.regular,
            ColorsManager.primaryColor),
      ),
    );
  }
}
