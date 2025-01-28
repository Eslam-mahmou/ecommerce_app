import 'package:ecommerce_app/Feature/cart_screen/presentation/manager/cart_cubit.dart';
import 'package:ecommerce_app/Feature/cart_screen/presentation/manager/cart_state.dart';
import 'package:ecommerce_app/Feature/layout_screen/presentation/manager/product_cubit/product_cubit.dart';
import 'package:ecommerce_app/core/Services/showSnakBar.dart';
import 'package:ecommerce_app/core/Widget/custom_cart_or_favorite_widget.dart';
import 'package:ecommerce_app/core/Widget/custom_diaolg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/Services/servier_locator.dart';
import '../../../../core/Services/shared_preference_services.dart';
import '../../../../core/Utils/assets_manager.dart';
import '../../../../core/Utils/colors_manager.dart';
import '../../../../core/Utils/font_manager.dart';
import '../../../../core/Utils/style_manager.dart';
import 'package:badges/badges.dart' as badges;

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CartCubit viewModel = getIt<CartCubit>();
    return BlocConsumer<CartCubit, CartState>(
      bloc: viewModel..getCart(),
      listener: (context, state) {
        if (state is FailureGetCartState) {
          DialogUtils.showMessage(
            context: context,
            message: state.errMessage,
            title: "Error",
            postActionName: "Ok",
            postAction: () {
              viewModel.getCart();
            },
          );
        }
        if (state is FailureUpdateCartState) {
          DialogUtils.showMessage(
            context: context,
            message: state.errMessage,
            title: "Error",
            postActionName: "Ok",
          );
        }
        if (state is FailureDeleteCartState) {
          DialogUtils.showMessage(
            context: context,
            message: state.errMessage,
            title: "Error",
            postActionName: "Ok",
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: ColorsManager.whiteColor,
            appBar: AppBar(
              backgroundColor: Colors.white,
              foregroundColor: ColorsManager.whiteColor,
              leading: IconButton(
                onPressed: () {
                  ProductCubit.get(context).fetchAllProducts();
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
              ),
              iconTheme: const IconThemeData(
                  color: ColorsManager.primaryColor, size: 20),
              elevation: 0,
              actionsIconTheme:
                  const IconThemeData(color: ColorsManager.primaryColor),
              title: Text(
                "Cart",
                overflow: TextOverflow.ellipsis,
                style: getTextStyle(FontSize.s20, FontWeightManager.medium,
                    ColorsManager.primaryColor),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      size: 30,
                    )),
                badges.Badge(
                    position: badges.BadgePosition.topEnd(top: -2, end: -2),
                    badgeAnimation: const badges.BadgeAnimation.scale(
                        animationDuration: Duration(milliseconds: 800)),
                    badgeContent: Text(
                     "${SharedPreferenceServices.getToken("item") ??0}",
                      style: getTextStyle(FontSize.s14,
                          FontWeightManager.medium, ColorsManager.whiteColor),
                    ),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.shopping_cart_outlined)))
              ],
            ),
            body: state is LoadingGetCartState ||
                    state is LoadingUpdateCartState ||
                    state is LoadingDeleteCartState
                ? const Center(
                    child: CircularProgressIndicator(
                      color: ColorsManager.primaryColor,
                    ),
                  )
                : state is SuccessGetCartState &&
                            viewModel.allCart.isNotEmpty ||
                        state is SuccessUpdateCartState ||
                        state is SuccessDeleteCartState
                    ? Column(
                        children: [
                          Expanded(
                            child: ListView.separated(
                              clipBehavior: Clip.none,
                              physics: const ClampingScrollPhysics(),
                              itemCount: viewModel.allCart.length,
                              itemBuilder: (context, index) {
                                return CustomCartOrFavoriteWidget(
                                    cart: viewModel.allCart[index],
                                    onPressed: () {
                                      viewModel.deleteFromCart(
                                        viewModel.allCart[index].product!.id ??
                                            "",
                                      );
                                      SnackBarService.showSuccessMessage(
                                          "Product deleted successfully from cart");
                                    },
                                    icon: const Icon(Icons.delete),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            viewModel.decrementCartNumber(
                                                viewModel.allCart[index]
                                                    .product!.id ??
                                                    "",
                                                viewModel.allCart[index]
                                                    .count ??
                                                    0);
                                          },
                                          child: Image.asset(
                                                  IconAssets.iconSubtractCircle,scale: 1.5,),
                                        ),
                                        Text(
                                          "${viewModel.allCart[index].count}",
                                          style: getTextStyle(
                                              FontSize.s18.sp,
                                              FontWeightManager.medium,
                                              ColorsManager.whiteColor),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            viewModel.incrementCartNumber(
                                                viewModel.allCart[index]
                                                        .product!.id ??
                                                    "",
                                                viewModel
                                                        .allCart[index].count ??
                                                    0);
                                          },
                                          child: Image.asset(
                                              IconAssets.iconPlusCircle,scale: 1.5,),
                                        ),
                                      ],
                                    ));
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
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text("Total price",
                                        style: getTextStyle(
                                          FontSize.s18,
                                          FontWeightManager.medium,
                                          ColorsManager.secondaryColor,
                                        )),
                                    Text(
                                        "${viewModel.cart?.data?.totalCartPrice}",
                                        style: getTextStyle(
                                          FontSize.s18,
                                          FontWeightManager.medium,
                                          ColorsManager.primaryColor,
                                        )),
                                  ],
                                ),
                                Container(
                                  height: 48.h,
                                  width: 270.w,
                                  decoration: BoxDecoration(
                                      color: ColorsManager.primaryColor,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "Check Out",
                                        style: getTextStyle(
                                            FontSize.s20,
                                            FontWeightManager.medium,
                                            ColorsManager.whiteColor),
                                      ),
                                      const Icon(
                                        Icons.arrow_right_alt_outlined,
                                        color: ColorsManager.whiteColor,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 16.h,
                          )
                        ],
                      )
                    : Center(
                        child: Text(
                          "Cart is empty",
                          style: getTextStyle(
                              FontSize.s20.sp,
                              FontWeightManager.semiBold,
                              ColorsManager.blackColor),
                        ),
                      ));
      },
    );
  }
}
