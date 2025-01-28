import 'package:ecommerce_app/core/Utils/colors_manager.dart';
import 'package:ecommerce_app/core/Utils/font_manager.dart';
import 'package:ecommerce_app/core/Utils/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../domain/entities/category_or_brand_entity.dart';

class CustomCategoryItem extends StatelessWidget {
  CustomCategoryItem(
      {super.key, required this.category,this.onTap,required this.isSelected});
  CategoryOrBrandEntity category;
  void Function()? onTap;
  bool isSelected=false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 85.h,
        width: 137.w,
        decoration:  BoxDecoration(
            color:isSelected?ColorsManager.whiteColor : ColorsManager.greyColor,
            borderRadius:const BorderRadius.only(topLeft: Radius.circular(10))),
        child:isSelected ?
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 5.w),
              width: 7.w,
              height: 72.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ColorsManager.primaryColor
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            Text(
              category.name,
              textAlign: TextAlign.center,
              style: getTextStyle(FontSize.s14.sp, FontWeightManager.medium,
                  ColorsManager.primaryColor),
            ),
          ],
        )

        :Center(
          child: Text(
            category.name,
            style: getTextStyle(FontSize.s14.sp, FontWeightManager.medium,
                ColorsManager.primaryColor),
          ),
        ),
      ),
    );
  }
}
