import 'dart:async';

import 'package:ecommerce_app/Feature/layout_screen/presentation/manager/categories_cubit/sub_categories_tab_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/sub_category_entity.dart';
import '../../../domain/use_case/categores_tab_use_case.dart';

class SubCategoriesCubit extends Cubit<SubCategoriesState> {
  SubCategoriesCubit(this.categoriesTabUseCase)
      : super(InitialSubCategoriesState());
  CategoriesTabUseCase categoriesTabUseCase;
  List<SubCategoryEntity> subCategories = [];
int selectCategories =0;
  bool isLoaded=false;
  bool isClicked =false;
  void fetchSubCategories(String categoryId) async {
    emit(LoadingSubCategoriesState());
    var result = await categoriesTabUseCase.call(categoryId);
    result.fold(
      (error) {
        emit(FailureSubCategoriesState(error.errorMessage));
      },
      (response) {
        subCategories = response;
        emit(SuccessSubCategoriesState(subCategories));
      },
    );
  }
void onClicked(){
    isClicked=true;
    emit(ChoosePageState());
}
  void changeIndex(int index,String categoryId)  {
    selectCategories = index;
    fetchSubCategories(categoryId);
    changeState();
    emit(ChangeIndexSubCategoriesState());
  }
  void changeState (){
    Timer(const Duration(seconds: 2),
    () =>isLoaded=true ,);
    emit(ChangeLoading());
  }
}
