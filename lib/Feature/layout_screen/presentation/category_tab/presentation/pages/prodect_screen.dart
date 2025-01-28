import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/Feature/layout_screen/presentation/category_tab/presentation/widget/custom_product_item.dart';
import 'package:ecommerce_app/Feature/layout_screen/presentation/manager/product_cubit/product_cubit.dart';
import 'package:ecommerce_app/Feature/layout_screen/presentation/manager/product_cubit/product_state.dart';
import 'package:ecommerce_app/core/Services/servier_locator.dart';
import 'package:ecommerce_app/core/Utils/colors_manager.dart';
import 'package:ecommerce_app/core/routes_manager/page_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/Widget/custom_diaolg.dart';

class ProductTabView extends StatelessWidget {
  const ProductTabView({super.key});

  @override
  Widget build(BuildContext context) {
    ProductCubit viewModel = getIt<ProductCubit>();
    return BlocConsumer<ProductCubit, ProductState>(
      bloc: viewModel..fetchAllProducts(),
      listener: (context, state) {
        if (state is FailureProductState) {
          DialogUtils.showMessage(
            context: context,
            title: "Error",
            message: state.errMessage,
            postActionName: "Ok",
            postAction: () => viewModel..fetchAllProducts(),
          );
        } else if (state is FailureAddCartState) {
          DialogUtils.showMessage(
            context: context,
            title: "Error",
            message: state.errMessage,
              postActionName: "Ok",
          );
        } else if (state is FailureAddWishlistState) {
          DialogUtils.showMessage(
            context: context,
            title: "Error",
            message: state.errMessage,
            postActionName: "Ok",
          );
        }
      },
      builder: (context, state) {
        return state is LoadingProductState
            ? const Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.primaryColor,
                ),
              )
            : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2.5 / 2.9,
                    mainAxisSpacing: 16.h),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14.w),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                            context, PagesRoutes.productDetailScreen,
                            arguments: viewModel.products[index]);
                      },
                      child: CustomProductItem(
                        product: viewModel.products[index],
                      ),
                    ),
                  );
                },
                itemCount: viewModel.products.length,
              );
      },
    );
  }
}
