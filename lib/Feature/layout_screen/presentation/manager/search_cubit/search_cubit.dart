import 'dart:developer';

import 'package:ecommerce_app/Feature/layout_screen/domain/entities/product_entity.dart';
import 'package:ecommerce_app/Feature/layout_screen/domain/use_case/search_item_use_case.dart';
import 'package:ecommerce_app/Feature/layout_screen/presentation/manager/search_cubit/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState>{
  SearchCubit(this.searchItemUseCase) : super(InitialSearchState());
  SearchItemUseCase searchItemUseCase;
  List<ProductEntity> products=[];
  List<ProductEntity> resentsProducts=[];
  Future<void> search({String? query})async{
    try{
      emit(LoadingSearchState());
      var result=await searchItemUseCase.searchProducts(query: query);
      products=result;
      log(products.toString());
      emit(SuccessfulSearchState(result));
    } catch(e){
     emit(FailedSearchState(e.toString()));
    }
  }
}