import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/Utils/colors_manager.dart';
import '../../../../../../../core/Utils/constant_manager.dart';
import '../../../../../../../core/Utils/font_manager.dart';
import '../../../../../../../core/Utils/style_manager.dart';

class CustomRowHome extends StatelessWidget {
  const CustomRowHome({super.key,required this.text});
final String text;
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: getTextStyle(FontSize.s18.sp,
              FontWeightManager.medium,
              ColorsManager.primaryColor),
        ),
        Text(
          AppConstants.viewAll,
          style: getTextStyle(FontSize.s12.sp,
              FontWeightManager.regular,
              ColorsManager.primaryColor),
        )
      ],
    );
  }
}
