import 'package:ecommerce_app/Feature/layout_screen/presentation/manager/product_cubit/product_cubit.dart';
import 'package:ecommerce_app/Feature/layout_screen/presentation/manager/product_cubit/product_state.dart';
import 'package:ecommerce_app/core/Utils/font_manager.dart';
import 'package:ecommerce_app/core/Utils/style_manager.dart';
import 'package:ecommerce_app/core/routes_manager/page_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/Services/shared_preference_services.dart';
import '../../../../../core/Utils/assets_manager.dart';
import '../../../../../core/Utils/colors_manager.dart';
import 'package:badges/badges.dart' as badges;

class HomeAppBar extends AppBar {
  HomeAppBar({super.key, double top = 0, required BuildContext context})
      : super(
            backgroundColor: ColorsManager.whiteColor,
            elevation: 0,
            surfaceTintColor: ColorsManager.whiteColor,
            automaticallyImplyLeading: false,
            flexibleSpace: Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w, top: top),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 12.h,
                  ),
                  SizedBox(
                      height: 22.h,
                      width: 66.w,
                      child: Image.asset(ImageAssets.logoBuy)),
                  BlocBuilder<ProductCubit, ProductState>(
                    builder: (context, state) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(onPressed: () {
                           Navigator.pushNamed(context, PagesRoutes.searchPage);
                          }, icon:const Icon(Icons.search_sharp,
                          size: 30,
                          color:  ColorsManager.primaryColor,)),

                          badges.Badge(
                            position: badges.BadgePosition.topEnd(),
                            badgeAnimation: const badges.BadgeAnimation.scale(
                                animationDuration: Duration(milliseconds: 800)),
                            badgeContent: Text(
                              "${SharedPreferenceServices.getToken("item") ?? 0} ",
                              style: getTextStyle(
                                  FontSize.s14,
                                  FontWeightManager.medium,
                                  ColorsManager.whiteColor),
                            ),
                            child: IconButton(
                              icon: const Icon(
                                Icons.shopping_cart_outlined,
                                color: ColorsManager.primaryColor,
                                size: 30,
                              ),
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, PagesRoutes.cartScreen);
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                ],
              ),
            ),
            toolbarHeight: 124.h);
}
