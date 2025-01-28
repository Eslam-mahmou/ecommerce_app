import 'package:ecommerce_app/Feature/layout_screen/presentation/layout/widget/customBottomNavigationItem.dart';
import 'package:ecommerce_app/Feature/layout_screen/presentation/layout/widget/custom_app_bar.dart';
import 'package:ecommerce_app/Feature/layout_screen/presentation/profile_tab/presentation/view/profile_tab_view.dart';
import 'package:ecommerce_app/core/Utils/colors_manager.dart';
import 'package:ecommerce_app/core/Utils/constant_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/Utils/assets_manager.dart';
import '../manager/layout_cubit/layout_cubit.dart';
import '../manager/layout_cubit/layout_state.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    MainCubit viewModel = MainCubit();
    return SafeArea(
        child: BlocBuilder<MainCubit, MainPageState>(
            bloc: viewModel,
            builder: (context, state) {
              return Scaffold(
                  extendBody: true,
                  backgroundColor: ColorsManager.whiteColor,
                  appBar: viewModel.currentIndex != 3
                     ? HomeAppBar(context: context,) : AppBar(
                    automaticallyImplyLeading: false,
                    backgroundColor: ColorsManager.whiteColor,
                    elevation: 0,
                    surfaceTintColor: ColorsManager.whiteColor,
                    title: Image.asset(ImageAssets.logoBuy,scale: 6,),
                  ),
                  body: viewModel.tabs[viewModel.currentIndex],
                  bottomNavigationBar: BottomNavigationBar(
                    currentIndex: viewModel.currentIndex,
                    onTap: (value) {
                      viewModel.changeIndex(value);
                    },
                    backgroundColor: ColorsManager.primaryColor,
                    type: BottomNavigationBarType.fixed,
                    showUnselectedLabels: false,
                    selectedItemColor: ColorsManager.whiteColor,
                    items: [
                      CustomBottomNavigationItem(
                          IconAssets.iconHome, AppConstants.home),
                      CustomBottomNavigationItem(
                          IconAssets.iconCategories, AppConstants.categories),
                      CustomBottomNavigationItem(
                          IconAssets.iconFavorite, AppConstants.favorite),
                      CustomBottomNavigationItem(
                          IconAssets.iconProfile, AppConstants.profile),
                    ],
                  ));
            }));
  }
}
