import 'package:ecommerce_app/Feature/layout_screen/presentation/manager/product_specific_cubit/product_specific_cubit.dart';
import 'package:ecommerce_app/core/Services/servier_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/Utils/assets_manager.dart';
import '../../../../../../core/Utils/colors_manager.dart';
import '../../../../../../core/Utils/font_manager.dart';
import '../../../../../../core/Utils/style_manager.dart';

class CustomRatingRow extends StatelessWidget {
   CustomRatingRow({super.key,required this.counter});
num counter;
  @override
  Widget build(BuildContext context) {
    ProductSpecificCubit product = getIt<ProductSpecificCubit>();
    return Row(
      children: [
        Container(
          height: 34.h,
          width: 102.w,
          decoration: BoxDecoration(
              color: ColorsManager.whiteColor,
              border: Border.all(color: ColorsManager.primaryColor),
              borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: Text(
              "${product.product?.sold} sold",
              style: getTextStyle(FontSize.s14.sp, FontWeightManager.medium,
                  ColorsManager.primaryColor),
            ),
          ),
        ),
        SizedBox(
          width: 16.w,
        ),
        Image.asset(IconAssets.iconStar),
        SizedBox(
          width: 8.w,
        ),
        Text(
            "${product.product?.ratingsAverage} (${product.product?.quantity})",
            style: getTextStyle(FontSize.s14.sp, FontWeightManager.medium,
                ColorsManager.primaryColor)),
        const Expanded(
          child: SizedBox(),
        ),
        Container(
          height: 42.h,
          width: 130.w,
          decoration: BoxDecoration(
              color: ColorsManager.primaryColor,
              border: Border.all(color: ColorsManager.primaryColor),
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    product.decrementCounter(product.product!.id.toString());
                  },
                  icon: Image.asset(IconAssets.iconSubtractCircle)),
              Text(
                "$counter",
                style: getTextStyle(FontSize.s18.sp, FontWeightManager.medium,
                    ColorsManager.whiteColor),
              ),
              IconButton(
                  onPressed: () {
                    product.incrementCounter(product.product!.id.toString());
                  },
                  icon: Image.asset(IconAssets.iconPlusCircle)),
            ],
          ),
        )
      ],
    );
  }
}
