import 'package:ecommerce_app/Feature/layout_screen/domain/use_case/product_use_case.dart';
import 'package:ecommerce_app/Feature/layout_screen/presentation/manager/product_specific_cubit/product_specific_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/product_entity.dart';

class ProductSpecificCubit extends Cubit<ProductSpecificState>{
  ProductSpecificCubit(this.productUseCase):super(InitialProductSpecificState());
  ProductUseCase productUseCase;
  ProductEntity? product;
  int counter=1;
  static ProductSpecificCubit get(context)=>BlocProvider.of(context);
  void fetchProduct(String productId)async{
    emit(LoadingProductSpecificState());
    var data =await productUseCase.execute(productId);
   data.fold((error) {
     emit(FailureProductSpecificState(error.errorMessage));
   }, (response) {
     product=response;
     emit(SuccessProductSpecificState(product!));
   },);
  }
  void incrementCounter(String productId){
    emit(LoadingProductSpecificState());
    counter++;
    emit(IncrementProductSpecificState());
    fetchProduct(productId);
 print(counter);
  }
  void decrementCounter(String productId){
    if (counter>1) {
      emit(LoadingProductSpecificState());
      counter--;
      emit(DecrementProductSpecificState());
      fetchProduct(productId);
    }
  }
}