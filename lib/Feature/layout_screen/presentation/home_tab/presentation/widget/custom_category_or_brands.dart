import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/Feature/layout_screen/domain/entities/category_or_brand_entity.dart';
import 'package:ecommerce_app/core/Utils/colors_manager.dart';
import 'package:ecommerce_app/core/Utils/font_manager.dart';
import 'package:ecommerce_app/core/Utils/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCategoryOrBrands extends StatelessWidget {
  const CustomCategoryOrBrands({super.key, required this.category});

  final CategoryOrBrandEntity category;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CachedNetworkImage(
        height: 100.h,
        width:100.w,
        fit: BoxFit.cover,
        imageUrl: category.image,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(
          color: ColorsManager.primaryColor,
        )),
        errorWidget: (context, url, error) => const Icon(
          Icons.error,
          color: ColorsManager.primaryColor,
        ),
      ),
      SizedBox(
        height: 6.h,
      ),
      Text(
        category.name,
        style: getTextStyle(
            FontSize.s14, FontWeightManager.regular, ColorsManager.primaryColor),
      )
    ]);
  }
}
