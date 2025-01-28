import 'package:ecommerce_app/Feature/layout_screen/domain/entities/sub_category_entity.dart';
import 'package:ecommerce_app/core/Utils/assets_manager.dart';
import 'package:ecommerce_app/core/Utils/colors_manager.dart';
import 'package:ecommerce_app/core/Utils/font_manager.dart';
import 'package:ecommerce_app/core/Utils/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubCategoryItem extends StatelessWidget {
  SubCategoryItem({super.key, required this.subCategory,required this.onTap});

  SubCategoryEntity subCategory;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap ,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 8.h),
            width: 70.w,
            height: 70.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: ColorsManager.blueColor, width: .5),
                image: const DecorationImage(
                    image: AssetImage(ImageAssets.logoBuy), fit: BoxFit.cover)),
          ),
          Text(
            subCategory.name,
            overflow: TextOverflow.ellipsis,
            style: getTextStyle(FontSize.s14.sp, FontWeightManager.regular,
                ColorsManager.blueColor),
          ),
        ],
      ),
    );
  }
}
