import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/Feature/layout_screen/domain/entities/product_entity.dart';
import 'package:ecommerce_app/Feature/layout_screen/presentation/category_tab/presentation/widget/custom_product_image.dart';
import 'package:ecommerce_app/Feature/layout_screen/presentation/category_tab/presentation/widget/custom_rating_row.dart';
import 'package:ecommerce_app/Feature/layout_screen/presentation/manager/Favorite_tab_cubit/wishlist_cubit.dart';
import 'package:ecommerce_app/Feature/layout_screen/presentation/manager/product_specific_cubit/product_specific_cubit.dart';
import 'package:ecommerce_app/Feature/layout_screen/presentation/manager/product_specific_cubit/product_specific_state.dart';
import 'package:ecommerce_app/core/Services/servier_locator.dart';
import 'package:ecommerce_app/core/Services/showSnakBar.dart';
import 'package:ecommerce_app/core/Utils/assets_manager.dart';
import 'package:ecommerce_app/core/Utils/colors_manager.dart';
import 'package:ecommerce_app/core/Utils/font_manager.dart';
import 'package:ecommerce_app/core/Utils/style_manager.dart';
import 'package:ecommerce_app/core/Widget/custom_diaolg.dart';
import 'package:ecommerce_app/core/routes_manager/page_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

import '../../../manager/product_cubit/product_cubit.dart';

class ProductScreenDetails extends StatelessWidget {
  const ProductScreenDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ProductSpecificCubit product = getIt<ProductSpecificCubit>();
    var args = ModalRoute.of(context)?.settings.arguments as ProductEntity;
    return BlocConsumer<ProductSpecificCubit, ProductSpecificState>(
      bloc: product..fetchProduct(args.id??""),
      listener: (context, state) {
        if (state is FailureProductSpecificState) {
          DialogUtils.showMessage(
            context: context,
            message: state.errMessage,
            postActionName: "Ok",
            postAction: () {
              product.fetchProduct(args.id??"");
            },
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: ColorsManager.whiteColor,
            appBar: AppBar(
              backgroundColor: ColorsManager.whiteColor,
              foregroundColor: ColorsManager.primaryColor,
              elevation: 0,
              actionsIconTheme:
                  const IconThemeData(color: ColorsManager.primaryColor),
              title: Text(
                product.product?.title ?? "",
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
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, PagesRoutes.cartScreen);
                    },
                    icon: const Icon(Icons.shopping_cart_outlined))
              ],
            ),
            body: state is LoadingProductSpecificState
                ? const Center(
                    child: CircularProgressIndicator(
                      color: ColorsManager.primaryColor,
                    ),
                  ):
            Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Stack(alignment: Alignment.topRight, children: [
                            const CustomProductImage(),
                            IconButton(
                                onPressed: () {
                                  ProductCubit.get(context).addWishlist(args.id ??"");
                                  SnackBarService.showSuccessMessage("Product added successfully to wishlist");
                                },
                                icon: Image.asset(
                                    IconAssets.iconCategoryFavorite)),
                          ]),
                          SizedBox(
                            height: 16.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 280.w,
                                child: Text(
                                  product.product?.title ?? "",
                                  overflow: TextOverflow.ellipsis,
                                  style: getTextStyle(
                                      FontSize.s18,
                                      FontWeightManager.medium,
                                      ColorsManager.primaryColor),
                                ),
                              ),
                              Text(
                                "EGP ${product.product!.price}",
                                style: getTextStyle(
                                    FontSize.s18,
                                    FontWeightManager.medium,
                                    ColorsManager.primaryColor),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                           CustomRatingRow(counter: product.counter),
                          SizedBox(
                            height: 16.h,
                          ),
                          Text("Description",
                              style: getTextStyle(
                                FontSize.s18.sp,
                                FontWeightManager.medium,
                                ColorsManager.primaryColor,
                              )),
                          SizedBox(
                            height: 8.h,
                          ),
                          ReadMoreText(
                            product.product?.description ?? "",
                            trimMode: TrimMode.Line,
                            trimLines: 6,
                            colorClickableText: ColorsManager.primaryColor,
                            trimCollapsedText: 'Read more',
                            trimExpandedText: '...read less',
                            moreStyle: getTextStyle(
                              FontSize.s16.sp,
                              FontWeightManager.regular,
                              ColorsManager.primaryColor,
                            ),
                          ),
                          const Expanded(
                            child: SizedBox(),
                          ),
                          Row(
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
                                  Text("${product.product!.price!*product.counter}",
                                      style: getTextStyle(
                                        FontSize.s18,
                                        FontWeightManager.medium,
                                        ColorsManager.primaryColor,
                                      )),
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  ProductCubit.get(context).addCart(product.product!.id.toString());
                                  SnackBarService.showSuccessMessage("product added successfully");
                                },
                                child: Container(
                                  height: 48.h,
                                  width: 270.w,
                                  decoration: BoxDecoration(
                                      color: ColorsManager.primaryColor,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const Icon(
                                        Icons.add_shopping_cart,
                                        color: ColorsManager.whiteColor,
                                      ),
                                      Text(
                                        "Add to cart",
                                        style: getTextStyle(
                                            FontSize.s20,
                                            FontWeightManager.medium,
                                            ColorsManager.whiteColor),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 30.h,
                          )
                        ]),
                  ))
        ;
      },
    );
  }
}
