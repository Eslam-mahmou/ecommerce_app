import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/Feature/layout_screen/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/Utils/colors_manager.dart';
import '../../../../../../core/Utils/font_manager.dart';
import '../../../../../../core/Utils/style_manager.dart';

class CustomSearchItem extends StatelessWidget {
  CustomSearchItem({super.key, required this.product});

  ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.h),
      padding: EdgeInsets.symmetric(horizontal: 6.w,vertical: 4.h),
      height: 150.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorsManager.whiteColor,
        border: Border.all(color: ColorsManager.greyColor, width: 1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          CachedNetworkImage(
            height: 140.h,
            width: 120.w,
            fit: BoxFit.fill,
            imageUrl: product.imageCover??"",
            imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
              image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                  colorFilter: const ColorFilter.mode(
                      Colors.transparent, BlendMode.colorBurn)),
            )),
            placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(
              color: ColorsManager.primaryColor,
            )),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          SizedBox(
            width: 4.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  product.title??"",
                  overflow: TextOverflow.clip,
                  maxLines: 1,
                  style: getTextStyle(FontSize.s16.sp, FontWeightManager.medium,
                      ColorsManager.blackColor),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  product.description??"",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: getTextStyle(FontSize.s16.sp, FontWeightManager.medium,
                      ColorsManager.blackColor),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  "${product.price} EGP",
                  style: getTextStyle(FontSize.s16.sp, FontWeightManager.medium,
                      ColorsManager.blackColor),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
