import 'dart:developer';

import 'package:ecommerce_app/Feature/layout_screen/domain/entities/category_or_brand_entity.dart';
import 'package:ecommerce_app/Feature/layout_screen/domain/use_case/home_tab_use_case.dart';
import 'package:ecommerce_app/Feature/layout_screen/presentation/manager/categories_cubit/sub_categories_tab_cubit.dart';
import 'package:ecommerce_app/Feature/layout_screen/presentation/manager/home_tab_cubit/home_tab_state.dart';
import 'package:ecommerce_app/core/Services/servier_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/Utils/assets_manager.dart';

class HomeTabCubit extends Cubit<HomeTabState> {
  HomeTabCubit(this.homeTabUseCase) : super(InitialCategoryHomeTabState());
  HomeTabUseCase homeTabUseCase;
  List<CategoryOrBrandEntity>? categoriesList = [];
  List<CategoryOrBrandEntity>? brandsList = [];
  static List<String> images = [
    ImageAssets.imageAdv1,
    ImageAssets.imageAdv2,
    ImageAssets.imageAdv3,
  ];
  int selected =0;
  bool isSelected = false;

  static HomeTabCubit get(context) => BlocProvider.of(context);
  getAllCategories() async {
    emit(LoadingCategoryHomeTabState());
    var data = await homeTabUseCase.invoke();
    data.fold(
      (error) {
        emit(FailureCategoryHomeTabState(error.errorMessage));
      },
      (response) {
        if (brandsList != null) {
          categoriesList = response;
          emit(SuccessCategoryHomeTabState());
        }
      },
    );
  }

  getALLBrands() async {
    emit(LoadingBrandHomeTabState());
    var data = await homeTabUseCase.execute();
    data.fold(
      (l) {
        emit(FailureBrandHomeTabState(l.errorMessage));
      },
      (response) {
        if (categoriesList != null) {
          brandsList = response;
          emit(SuccessBrandHomeTabState());
        }
      },
    );
  }

  changeCategory(index, String categoryId) {
    emit(InitialCategoryHomeTabState());
    selected = index;
    log(selected.toString());
    getIt<SubCategoriesCubit>().fetchSubCategories(categoryId);
    isSelected = true;
    emit(ChangeIndexCategory());

  }

}
