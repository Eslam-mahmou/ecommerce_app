import 'package:ecommerce_app/Feature/cart_screen/domain/entities/get_cart_response_entity.dart';
import 'package:ecommerce_app/Feature/cart_screen/domain/use_case/cart_use_case.dart';
import 'package:ecommerce_app/Feature/cart_screen/presentation/manager/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/Services/shared_preference_services.dart';

class CartCubit extends Cubit<CartState>{
  CartCubit(this.cartUseCase) : super(InitialGetCartState());
  CartUseCase cartUseCase;
  int numbersOfItems=0;
  List<GetProductsCartEntity>  allCart=[];
  GetCartResponseEntity? cart;
  Future<void> getCart()async{
    emit(LoadingGetCartState());
    var either=await cartUseCase.call();
    either.fold((error) {
      emit(FailureGetCartState(error.errorMessage));
    }, (response) {
      numbersOfItems=response.numOfCartItems?.toInt()??0;
      SharedPreferenceServices.saveToken("item", numbersOfItems);
      cart=response;
      allCart=response.data?.products??[];
      emit(SuccessGetCartState(response));
    },);
  }
  void updateCart(String productId,num count)async{
    emit(LoadingUpdateCartState());
    var data=await cartUseCase.execute(productId, count);
    data.fold((error) {
      emit(FailureUpdateCartState(error.errorMessage));
    } , (response) async {
      numbersOfItems=response.numOfCartItems?.toInt()??0;
      SharedPreferenceServices.saveToken("item", numbersOfItems);
      allCart=response.data!.products ??[];
     await getCart();
      emit(SuccessUpdateCartState(response));
    },);

  }
  void incrementCartNumber(String productId,num count){
    emit(LoadingUpdateCartState());
    count++;
    emit(IncrementCartState());
    updateCart(productId, count);
  }
  void decrementCartNumber(String productId,num count){
    emit(LoadingUpdateCartState());
    count--;
    emit(DecrementCartState());
    updateCart(productId, count);
  }
  void deleteFromCart(String productId)async{
    emit(LoadingDeleteCartState());
    var data =await cartUseCase.invoke(productId);
    data.fold((error) {
      emit(FailureDeleteCartState(error.errorMessage));
    }, (success)async {
      emit(SuccessDeleteCartState());
      await getCart();
    },);
  }
}