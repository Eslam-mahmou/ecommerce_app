import 'package:ecommerce_app/Feature/layout_screen/domain/use_case/product_use_case.dart';
import 'package:ecommerce_app/Feature/layout_screen/presentation/manager/product_cubit/product_state.dart';
import 'package:ecommerce_app/core/Services/shared_preference_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/product_entity.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.productUseCase) : super(InitialProductState());
  ProductUseCase productUseCase;
  List<ProductEntity> products = [];
  int numberOfCartItems=0;
  static ProductCubit get(context) => BlocProvider.of(context);
 bool isSee=false;
  void fetchAllProducts({String ?q}) async {
    emit(LoadingProductState());

    var data = await productUseCase.callAllProducts(q: q);
    data.fold(
      (error) {
        emit(FailureProductState(error.errorMessage));
      },
      (response) {
        products = response;
        emit(SuccessProductState(products));
      },
    );
  }
  Future<void> addCart(String productId) async {
    emit(LoadingAddCartState());
    var data = await productUseCase.invoke(productId);
    data.fold(
      (error) {
        emit(FailureAddCartState(error.errorMessage));
      },
      (response) {
        numberOfCartItems = response.numberOfItems.toInt();
        SharedPreferenceServices.saveToken("item", numberOfCartItems);
        emit(SuccessAddCartState(response));
      },
    );
  }
  Future<void> addWishlist (String productId)async{
    emit(LoadingAddWishlistState());
    var data =await productUseCase.callProductToWishlist(productId);
    data.fold((error) {
      emit(FailureAddWishlistState(error.errorMessage));
    }, (response) {
         emit(SuccessAddWishlistState(response));
    },);
  }
}
