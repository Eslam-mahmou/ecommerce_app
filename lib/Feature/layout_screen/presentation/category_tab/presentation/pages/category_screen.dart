import 'package:ecommerce_app/Feature/layout_screen/presentation/category_tab/presentation/pages/prodect_screen.dart';
import 'package:ecommerce_app/Feature/layout_screen/presentation/category_tab/presentation/widget/custom_category_item.dart';
import 'package:ecommerce_app/Feature/layout_screen/presentation/category_tab/presentation/widget/sub_category_item.dart';
import 'package:ecommerce_app/Feature/layout_screen/presentation/manager/categories_cubit/sub_categories_tab_cubit.dart';
import 'package:ecommerce_app/Feature/layout_screen/presentation/manager/categories_cubit/sub_categories_tab_state.dart';
import 'package:ecommerce_app/Feature/layout_screen/presentation/manager/home_tab_cubit/home_tab_cubit.dart';
import 'package:ecommerce_app/Feature/layout_screen/presentation/manager/home_tab_cubit/home_tab_state.dart';
import 'package:ecommerce_app/core/Services/servier_locator.dart';
import 'package:ecommerce_app/core/Utils/colors_manager.dart';
import 'package:ecommerce_app/core/Utils/font_manager.dart';
import 'package:ecommerce_app/core/Utils/style_manager.dart';
import 'package:ecommerce_app/core/Widget/custom_diaolg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
class CategoryTabView extends StatefulWidget {
  const CategoryTabView({super.key});

  @override
  State<CategoryTabView> createState() => _CategoryTabViewState();
}

class _CategoryTabViewState extends State<CategoryTabView> {
  @override
  void dispose() {
    getIt<HomeTabCubit>().selected=0;
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    HomeTabCubit viewModel = getIt<HomeTabCubit>();
    SubCategoriesCubit subCubit = getIt<SubCategoriesCubit>();
  return  BlocConsumer<SubCategoriesCubit, SubCategoriesState>(
      bloc: subCubit
        ..fetchSubCategories(
            viewModel.categoriesList![subCubit.selectCategories].id)
        ..changeState(),
      listener: (context, state) {
        if (state is FailureSubCategoriesState) {
          DialogUtils.showMessage(
            context: context,
            message: state.errMessage,
            negativeActionName: "Ok",
            postAction: () {
              viewModel.categoriesList![subCubit.selectCategories].id;
            },
          );
        }
      },
      builder: (context, state) {
        return subCubit.isClicked? const ProductTabView() : Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              Container(
                width: 137.w,
                decoration: const BoxDecoration(
                    border: Border(
                        left: BorderSide(
                            color: ColorsManager.primaryColor, width: .5),
                        top: BorderSide(
                            color: ColorsManager.primaryColor, width: .5),
                        bottom: BorderSide(
                            color: ColorsManager.primaryColor, width: .5)),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10))),
                child: BlocBuilder<HomeTabCubit, HomeTabState>(
                  builder: (context, state) {
                    return ListView.builder(
                      itemCount: viewModel.categoriesList!.length,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return CustomCategoryItem(
                          category: viewModel.categoriesList![index],
                          onTap: () {
                            viewModel.changeCategory(
                                index, viewModel.categoriesList![index].id);
                          },
                          isSelected: viewModel.selected == index,
                        );
                      },
                    );
                  },
                ),
              ),
              SizedBox(
                width: 24.w,
              ),
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Text(
                        viewModel.categoriesList![viewModel.selected].name,
                        style: getTextStyle(FontSize.s14.sp,
                            FontWeightManager.medium, ColorsManager.blueColor),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 16.h,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 8.h, horizontal: 16.w),
                        height: 96.h,
                        width: 237.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: ColorsManager.greyColor),
                            image: DecorationImage(
                                image: NetworkImage(viewModel
                                    .categoriesList![viewModel.selected]
                                    .image))),
                        child: Text(
                          viewModel.categoriesList![viewModel.selected].name,
                          style: getTextStyle(
                              FontSize.s16,
                              FontWeightManager.semiBold,
                              ColorsManager.blueColor),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 20.h,
                      ),
                    ),
                    state is LoadingSubCategoriesState
                        ? SliverGrid(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 2 / 2.5,
                              mainAxisSpacing: 16.h,
                            ),
                            delegate: SliverChildBuilderDelegate(
                              childCount: subCubit.subCategories.length,
                              (context, index) {
                                return Skeletonizer(
                                  enabled: true,
                                  enableSwitchAnimation: true,
                                  child: SubCategoryItem(
                                    subCategory: subCubit.subCategories[index],
                                    onTap: subCubit.onClicked,
                                  ),
                                );
                              },
                            ),
                          )
                        : state is SuccessSubCategoriesState &&
                                state.subCategories.isNotEmpty
                            ? SliverGrid(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  childAspectRatio: 2 / 2.7,
                                  mainAxisSpacing: 16.h,
                                ),
                                delegate: SliverChildBuilderDelegate(
                                  childCount: subCubit.subCategories.length,
                                  (context, index) {
                                    return SubCategoryItem(
                                      subCategory:
                                          subCubit.subCategories[index],
                                      onTap:subCubit.onClicked ,
                                    );
                                  },
                                ),
                              )
                            : SliverToBoxAdapter(
                                child: Center(
                                  child: Text(
                                    "Sub categories not found,...select another category",
                                    style: getTextStyle(FontSize.s16.sp,
                                        FontWeightManager.regular, ColorsManager.blackColor),
                                  ),
                                ),
                              ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
