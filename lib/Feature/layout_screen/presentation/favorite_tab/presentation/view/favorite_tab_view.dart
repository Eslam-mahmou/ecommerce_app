import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/Feature/layout_screen/presentation/manager/Favorite_tab_cubit/wishlist_cubit.dart';
import 'package:ecommerce_app/Feature/layout_screen/presentation/manager/Favorite_tab_cubit/wishlist_state.dart';
import 'package:ecommerce_app/Feature/layout_screen/presentation/manager/product_cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/Services/servier_locator.dart';
import '../../../../../../core/Services/showSnakBar.dart';
import '../../../../../../core/Utils/assets_manager.dart';
import '../../../../../../core/Utils/colors_manager.dart';
import '../../../../../../core/Utils/font_manager.dart';
import '../../../../../../core/Utils/style_manager.dart';
import '../../../../../../core/Widget/custom_cart_or_favorite_widget.dart';
import '../../../../../../core/Widget/custom_diaolg.dart';

class FavoriteTabView extends StatelessWidget {
  const FavoriteTabView({super.key});

  @override
  Widget build(BuildContext context) {
    WishlistCubit viewModel = getIt<WishlistCubit>();
    return BlocConsumer<WishlistCubit, WishlistState>(
      bloc: viewModel..fetchWishlist(),
      listener: (context, state) {
        if (state is FailureWishlistState) {
          DialogUtils.showMessage(
            context: context,
            message: state.errMessage,
            title: "Error",
            postActionName: "Ok",
            negativeActionName: "Cancel",
            postAction: () {
              viewModel.fetchWishlist();
            },
          );
        }
        if (state is FailureDeleteWishlistState) {
          DialogUtils.showMessage(
            context: context,
            message: state.errMessage,
            title: "Error",
            postActionName: "Ok",
            negativeActionName: "Cancel",
            postAction: () {
              viewModel.fetchWishlist();
            },
          );
        }
      },
      builder: (context, state) {
        return state is LoadingWishlistState || state is LoadingDeleteWishlistState
            ? const Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.primaryColor,
                ),
              )
            : state is SuccessWishlistState && viewModel.wishlist.isNotEmpty ||
                  state is  SuccessDeleteWishlistState
                ? Column(children: [
                    Expanded(
                      child: ListView.separated(
                        clipBehavior: Clip.none,
                        physics: const ClampingScrollPhysics(),
                        itemCount: viewModel.wishlist.length,
                        itemBuilder: (context, index) {
                          return CustomCartOrFavoriteWidget(
                            wishlist: viewModel.wishlist[index],
                            onPressed: () {
                              viewModel.deleteWishlist(
                              viewModel.wishlist[index].id ??
                              "",);
                              SnackBarService.showSuccessMessage("Product deleted from wishlist");
                            },
                            icon: Image.asset(IconAssets.iconSelectedFavorite),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  ProductCubit.get(context).addCart(viewModel.wishlist[index].id??"");
                                  SnackBarService.showSuccessMessage("Product added to cart");
                                },
                                child: InkWell(
                                  onTap: () {
                                    ProductCubit.get(context).addCart(viewModel.wishlist[index].id ??"");
                                    SnackBarService.showSuccessMessage("Product added to cart");
                                  },
                                  child: Text(
                                    "Add to Cart",
                                    style: getTextStyle(
                                        FontSize.s14.sp,
                                        FontWeightManager.medium,
                                        ColorsManager.whiteColor),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 16.h,
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    )
                  ])
                : Center(
                    child: Text(
                      "Wishlist is empty",
                      style: getTextStyle(FontSize.s20.sp,
                          FontWeightManager.semiBold, ColorsManager.blackColor),
                    ),
                  );
      },
    );
  }
}
