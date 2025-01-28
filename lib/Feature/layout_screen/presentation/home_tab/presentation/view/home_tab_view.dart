import 'package:ecommerce_app/Feature/layout_screen/presentation/manager/home_tab_cubit/home_tab_cubit.dart';
import 'package:ecommerce_app/Feature/layout_screen/presentation/manager/home_tab_cubit/home_tab_state.dart';
import 'package:ecommerce_app/core/Services/servier_locator.dart';
import 'package:ecommerce_app/core/Utils/colors_manager.dart';
import 'package:ecommerce_app/core/Utils/constant_manager.dart';
import 'package:ecommerce_app/core/Widget/custom_diaolg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widget/custom_category_or_brands.dart';
import '../widget/custom_image_adv.dart';
import '../widget/custom_row_home.dart';

class HomeTabView extends StatelessWidget {
  const HomeTabView({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = getIt<HomeTabCubit>()..getAllCategories()..getALLBrands();
    return BlocConsumer<HomeTabCubit, HomeTabState>(
      // bloc: viewModel
      //   ..getAllCategories()
      //   ..getALLBrands(),
      listener: (context, state) {
        if (state is FailureCategoryHomeTabState) {
          DialogUtils.showMessage(
            context: context,
            message: state.errorMessage,
            postActionName: "Ok",
            postAction: () => viewModel.getAllCategories(),
          );
        }
        if (state is FailureBrandHomeTabState) {
          DialogUtils.showMessage(
              context: context,
              message: state.errorMessage,
              title: "error message",
              postActionName: "Ok",
              postAction: () => viewModel.getALLBrands());
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  const CustomImageAdv(),
                  SizedBox(
                    height: 24.h,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  const CustomRowHome(
                    text: AppConstants.category,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  state is LoadingCategoryHomeTabState
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: ColorsManager.primaryColor,
                          ),
                        )
                      : SizedBox(
                          height: 285.h,
                          child: GridView.builder(
                            scrollDirection: Axis.horizontal,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, crossAxisSpacing: 16),
                            itemCount: viewModel.categoriesList!.length,
                            itemBuilder: (context, index) {
                              return CustomCategoryOrBrands(
                                  category: viewModel.categoriesList![index]);
                            },
                          ),
                        ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const CustomRowHome(text: AppConstants.brand),
                  SizedBox(
                    height: 8.h,
                  ),
                  state is LoadingBrandHomeTabState
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: ColorsManager.primaryColor,
                          ),
                        )
                      : SizedBox(
                          height: 280.h,
                          child: GridView.builder(
                            scrollDirection: Axis.horizontal,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, crossAxisSpacing: 12),
                            itemCount: viewModel.brandsList!.length,
                            itemBuilder: (context, index) {
                              return CustomCategoryOrBrands(
                                  category: viewModel.brandsList![index]);
                            },
                          ),
                        ),
                  SizedBox(
                    height: 65.h,
                  )
                ],
              )),
        );
      },
    );
  }
}
