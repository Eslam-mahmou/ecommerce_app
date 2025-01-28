import 'package:ecommerce_app/Feature/cart_screen/domain/entities/get_cart_response_entity.dart';
import 'package:ecommerce_app/Feature/layout_screen/domain/entities/get_wishlist_response_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Utils/colors_manager.dart';
import '../Utils/font_manager.dart';
import '../Utils/style_manager.dart';

class CustomCartOrFavoriteWidget extends StatelessWidget {
  CustomCartOrFavoriteWidget({
    super.key,
    this.cart,
     this.onPressed,
     this.icon,
    this.wishlist,
     this.child,
  });

  GetProductsCartEntity? cart;
  GetDataWishlistEntity? wishlist;
  void Function()? onPressed;
  Widget? icon;
  Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      height: 113.h,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: ColorsManager.greyColor)),
      child: Row(
        children: [
          Container(
            width: 122.w,
            height: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: ColorsManager.greyColor),
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage(
                    cart?.product?.imageCover ?? wishlist?.imageCover ?? ""),
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 130.w,
                child: Text(
                  cart?.product?.title ??wishlist?.title?? "",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: getTextStyle(FontSize.s18.sp, FontWeightManager.medium,
                      ColorsManager.primaryColor),
                ),
              ),
              Text(
                "EGP ${cart?.price??wishlist?.price}",
                style: getTextStyle(FontSize.s18.sp, FontWeightManager.medium,
                    ColorsManager.primaryColor),
              )
            ],
          ),
          SizedBox(width: 6.w),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(onPressed: onPressed, icon: icon!),
                Container(
                  width: 120.w,
                  height: 29.h,
                  decoration: BoxDecoration(
                      color: ColorsManager.primaryColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: child,
                ),
                SizedBox(
                  height: 4.h,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
