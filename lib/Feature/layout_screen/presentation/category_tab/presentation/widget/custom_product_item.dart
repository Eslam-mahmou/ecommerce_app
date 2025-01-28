import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/Feature/layout_screen/domain/entities/product_entity.dart';
import 'package:ecommerce_app/Feature/layout_screen/presentation/category_tab/presentation/widget/custom_text_of_product.dart';
import 'package:ecommerce_app/Feature/layout_screen/presentation/manager/product_cubit/product_cubit.dart';
import 'package:ecommerce_app/core/Services/showSnakBar.dart';
import 'package:ecommerce_app/core/Utils/assets_manager.dart';
import 'package:ecommerce_app/core/Utils/colors_manager.dart';
import 'package:ecommerce_app/core/Utils/font_manager.dart';
import 'package:ecommerce_app/core/Utils/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProductItem extends StatelessWidget {
  CustomProductItem({super.key, required this.product});

  ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 191.w,
      height: 237.h,
      decoration: BoxDecoration(
          border: Border.all(color: ColorsManager.greyColor),
          color: ColorsManager.whiteColor,
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topRight,
              children: [
                CachedNetworkImage(
                  height: 128.h,
                  width: 191.w,
                  fit: BoxFit.fill,
                  imageUrl: product.imageCover!,
                  placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(
                    color: ColorsManager.primaryColor,
                  )),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    color: ColorsManager.primaryColor,
                  ),
                ),
                IconButton(
                    onPressed: () async {
                      await ProductCubit.get(context)
                          .addWishlist(product.id.toString());
                      SnackBarService.showSuccessMessage(
                          "Product added successfully to your wishlist ");
                    },
                    icon: Image.asset(IconAssets.iconCategoryFavorite)),
              ]),
          SizedBox(
            height: 8.h,
          ),
          CustomTextOfProduct(
            text: product.title ?? "",
          ),
          CustomTextOfProduct(
            text: product.description ?? "",
          ),
          SizedBox(
            height: 8.h,
          ),
          CustomTextOfProduct(
            text: "EGP ${product.price}",
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Row(
              children: [
                Text(
                  "Review (${product.ratingsAverage})",
                  style: getTextStyle(FontSize.s12.sp,
                      FontWeightManager.regular, ColorsManager.primaryColor),
                ),
                SizedBox(
                  width: 4.w,
                ),
                Image.asset(IconAssets.iconStar),
                Expanded(
                  child: SizedBox(
                    width: 4.w,
                  ),
                ),
                InkWell(
                  onTap: () {
                    ProductCubit.get(context).addCart(product.id.toString());
                    SnackBarService.showSuccessMessage(
                        "Product added successfully to Cart!");
                  },
                  child: const CircleAvatar(
                    backgroundColor: ColorsManager.primaryColor,
                    radius: 15,
                    child: Icon(
                      Icons.add,
                      color: ColorsManager.whiteColor,
                      size: 30,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
